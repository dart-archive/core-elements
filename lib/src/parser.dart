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

/// Extract information from the HTML string
List<Element> parsePolymerElements(String text, {onWarning(String msg)}) {
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
  return elements.values;
}



final _ATTRIBUTES_REGEX = new RegExp(r'\s|,');

/// Extract information from documentation comments in [text].
void _parseDocumentation(Map elements, String text,
    {onWarning(String msg)}) {
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
        pragmas.add(m);
      } else {
        nonPragmas.add(line);
      }
    }

    // collect all other text into a single block
    var description = nonPragmas.join('\n');

    // process pragmas
    for (var m in pragmas) {
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
          currentMember.args.add(new Argument(
              param.group(2), param.group(3), param.group(1)));

          break;

        case 'returns':
          if (currentMember == null) {
            _warn('ignoring $pragma information: $content');
            break;
          }
          currentMember.isVoid = false;
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


// Regexp used for parsing the documentation.
final _pragmaMatcher = new RegExp(r"\s*@([\w-]*) (.*)");
final _paramMatcher = new RegExp(r"\s*{([^}]*)} ([^ :]*)(?::?)(.*)");
final _docCommentRegex = () {
  var scriptDocCommentClause = r'\/\*\*([\s\S]*?)\*\/';
  var htmlDocCommentClause = r'<!--([\s\S]*?)-->';
  // matches text between /** and */ inclusive and <!-- and --> inclusive
  return new RegExp('$scriptDocCommentClause|$htmlDocCommentClause');
}();

final _lineEnds = new RegExp(r'\r\n');
final _commentChars = new RegExp(
    r'^\s*\/\*\*|^\s*\*\/|^\s*\* ?|^\s*\<\!-\-|^s*\-\-\>', multiLine: true);

