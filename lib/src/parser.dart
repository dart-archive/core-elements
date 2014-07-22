// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

/// A parser for the documentation in polymer .html files. This parser is
/// adapted from the code in "context-free-parser.js".
// TODO(sigmund,jmesserly): consider reusing the Javascript implementation and
// make this script just parse a .json file instead.
library core_elements.src.parser;

import 'package:html5lib/parser.dart' as html;
import 'ast.dart';

/// Extract info about each polymer element and HTML imports
FileSummary parsePolymerElements(String text, {onWarning(String msg)}) {
  var doc = html.parse(text);
  var elements = {};
  for (var pe in doc.querySelectorAll('polymer-element')) {
    var name = pe.attributes['name'];
    var info = new Element(name, pe.attributes['extends']);
    elements[name] = info;

    // merge names from 'attributes' attribute
    var attrs = pe.attributes['attributes'];
    if (attrs != null) {
      // names='a b c' or names='a,b,c'
      // record each name for publishing
      for (var attr in attrs.split(_ATTRIBUTES_REGEX)) {
        // remove excess ws
        attr = attr.trim();
        if (attr == '') continue;
        info.properties[attr] = new Property(attr, '');
      }
    }
  }

  _parseDocumentation(elements, text, onWarning: onWarning);
  _parseCustomProperties(elements, text, onWarning: onWarning);
  return new FileSummary(
      _parseImports(doc), elements.values);
}

/// Extract imports seen in the document
List<Import> _parseImports(doc) {
  var imports = [];
  for (var link in doc.querySelectorAll('link[rel="import"]')) {
    imports.add(new Import(link.attributes['href']));
  }
  return imports;
}



final _ATTRIBUTES_REGEX = new RegExp(r'\s|,');

/// Extract information from documentation comments in [text].
void _parseDocumentation(Map elements, String text, {onWarning(String msg)}) {
  var current = null;
  var currentMember = null;
  var _warn = onWarning != null ? onWarning : (_) {};

  // acquire all script doc comments
  // each match represents a single block of doc comments
  for (var m in _docCommentRegex.allMatches(text)) {
    // unify line ends, remove all comment characters, split into individual
    // lines
    var lines = m.group(0)
        .replaceAll(_lineEnds, '\n')
        .replaceAll(_commentChars, '')
        .trim()
        .split('\n');

    // pragmas (@-rules) must occur on a line by themselves
    var pragmas = [];
    var nonPragmas = [];
    // filter lines whose first non-whitespace character is @ into the pragma
    // list (and out of the `lines` array)
    for (var line in lines) {
      var m = _pragmaMatcher.firstMatch(line);
      if (m != null) {
        var pragma = m.group(1);

        // Make sure parameter and return text is grouped correctly.
        // TODO(jmesserly): this code needs refactoring; either should reuse
        // the JS code for parsing this so we don't introduce our own bugs,
        // or should be written as a recursive descent parser.
        if (pragma == 'param' || pragma.startsWith('return')) {
          nonPragmas = [];
        }
        pragmas.add([m, nonPragmas]);
      } else {
        // collect text into the comment for the previous
        nonPragmas.add(line);
      }
    }

    // process pragmas
    for (var pragmaInfo in pragmas) {
      Match m = pragmaInfo[0];
      String description = pragmaInfo[1].join('\n');
      var pragma = m.group(1);
      var content = m.group(2);
      switch (pragma) {

        // currently all entities are either @class or @element
        case 'class':
        case 'element':
          // Lookup element
          current = elements[content];
          if (current == null) {
            current = new Element(content, description);
            elements[content] = current;
          } else {
            current.description = description;
          }
          break;

        // an entity may have these describable sub-features
        case 'attribute':
        case 'property':
          if (current == null) {
            _warn('not in element, ignoring property: $content');
            break;
          }
          currentMember = new Property(content, description);
          current.properties[content] = currentMember;
          break;

        case 'method':
          if (current == null) {
            _warn('not in element, ignoring method: $content');
            break;
          }
          currentMember = new Method(content, description);
          current.methods.add(currentMember);
          break;

        case 'event':
          currentMember = null;
          break;

        case 'param':
          var param = _paramMatcher.firstMatch(content);
          if (param == null) {
            _warn("param didn't match expected format: $content");
            break;
          }
          if (currentMember is! Method) {
            _warn('not in method ($currentMember), ignoring param: $content');
            break;
          }
          var desc = '${param.group(3)}\n$description';
          var arg = new Argument(param.group(2), desc, param.group(1));
          if (param.group(3).contains(_optionalMatcher)) {
            currentMember.optionalArgs.add(arg);
          } else {
            currentMember.args.add(arg);
          }

          break;

        case 'return':
        case 'returns':
          if (currentMember == null) {
            _warn('ignoring $pragma information: $content');
            break;
          }
          if (currentMember is! Method) {
            _warn('not in method ($currentMember), ignoring return: $content');
            break;
          }
          currentMember.isVoid = false;

          var returnMatch = _returnMatcher.firstMatch(content);
          if (returnMatch == null) {
            _warn("'return' didn't match expected format: $content");
            break;
          }
          currentMember.type = returnMatch.group(1);

          currentMember.description = '${currentMember.description}\n'
              'Returns${returnMatch.group(3)}\n$description';
          break;

        case 'type':
          if (currentMember == null) {
            _warn('ignoring $pragma information: $content');
            break;
          }
          currentMember.type = content;
          break;

        default:
          _warn('ignoring $pragma information: $content');
          break;
      }
    }
  }
}

/// Extract custom javascript getters and setters from text.
void _parseCustomProperties(
    Map elements, String text, {onWarning(String msg)}) {
  var current = null;
  var _warn = onWarning != null ? onWarning : (_) {};
  for (var m in _elementPragmasAndGettersRegex.allMatches(text)) {
    if (m.group(1) == '@element' || m.group(1) == '@class') {
      current = elements[m.group(2)];
      continue;
    }

    var isGetter = m.group(3) == 'get';
    var isSetter = m.group(5) == 'set';
    if (!isGetter && !isSetter) {
      _warn("Invalid match, expecting '@element', '@class', 'get' or 'set' "
            "but got: ${m.group(0)}");
    }

    var name = (isGetter) ? m.group(4) : m.group(6);
    if (current == null) {
      _warn('not in element, ignoring: $name');
      continue;
    }
    if (current.properties[name] == null) {
      current.properties[name] = new Property(name, '');
    }

    var property = current.properties[name];
    if (isGetter) property.hasGetter = true;
    if (isSetter) property.hasSetter = true;
  }
}


// Regexp used for parsing the documentation.
final _pragmaMatcher = new RegExp(r"\s*@([\w-]*) (.*)");
final _paramMatcher = new RegExp(r"\s*{([^}]*)} ([^ :]*)(?::?)(.*)");
final _returnMatcher = new RegExp(r"\s*{([^}]*)} ([^ :]*)(?::?)(.*)");
final _docCommentRegex = () {
  var scriptDocCommentClause = r'\/\*\*([\s\S]*?)\*\/';
  var htmlDocCommentClause = r'<!--([\s\S]*?)-->';
  // matches text between /** and */ inclusive and <!-- and --> inclusive
  return new RegExp('$scriptDocCommentClause|$htmlDocCommentClause');
}();
final _optionalMatcher = new RegExp(r'([\(]|(,\s*))optional\s*[,\)]');

// Regexp used for matching ES5 getters and @element/@class pragmas.
final _elementPragmasAndGettersRegex = () {
  var elementPragma = r'(@element|@class)\s([\w-_]+)';
  var es5Getter = r'\n\s*(get)\s*([\w-_]+)\s*\(\)\s+\{';
  var es5Setter = r'\n\s*(set)\s*([\w-_]+)\s*\(\s*([\w_-]*)\s*\)\s+\{';
  return new RegExp('$elementPragma|$es5Getter|$es5Setter');
}();

final _lineEnds = new RegExp(r'\r\n');
final _commentChars = new RegExp(
    r'^\s*\/\*\*|^\s*\*\/|^\s*\* ?|^\s*\<\!-\-|^s*\-\-\>', multiLine: true);

