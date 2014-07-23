// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

/// Methods to generate code from previously collected information.
library core_elements.src.codegen;

import 'package:core_elements/src/config.dart';
import 'ast.dart';

String generateClass(Element element, FileConfig config) {
  var sb = new StringBuffer();
  var comment = _toComment(element.description);
  sb.write(_generateHeader(element.name, comment, element.extendName));
  var getDartName = _substituteFunction(config.nameSubstitutions);
  element.properties.values.forEach((p) => _generateProperty(p, sb, getDartName));
  element.methods.forEach((m) => _generateMethod(m, sb, getDartName));
  sb.write('}\n');
  sb.write(_generateUpdateMethod(element.name));
  return sb.toString();
}

Function _substituteFunction(Map<String, String> nameSubstitutions) {
  if (nameSubstitutions == null) return (x) => x;
  return (x) {
    var v = nameSubstitutions[x];
    return v != null ? v : x;
  };
}

void _generateProperty(Property property, StringBuffer sb,
    String getDartName(String)) {
  var comment = _toComment(property.description, 2);
  var type = property.type;
  if (type != null) {
    type = _docToDartType[type];
  }
  var name = property.name;
  var dartName = getDartName(name);
  var body = "jsElement['$name']";
  sb.write(comment == '' ? '\n' : '\n$comment\n');
  var t = type != null ? '$type ' : '';
  sb.write('  ${t}get $dartName => $body;\n');

  // Don't output the setter if it has a getter but no setter in the original
  // source code. In all other cases we want a dart setter (normal js property
  // with no getter or setter, or custom property with a js setter).
  if (property.hasGetter && !property.hasSetter) return;
  if (type == null) {
    sb.write('  set $dartName(${t}value) { '
             '$body = (value is Map || value is Iterable) ? '
             'new JsObject.jsify(value) : value;}\n');
  } else if (type == "JsArray") {
    sb.write('  set $dartName(${t}value) { '
             '$body = (value is Iterable) ? '
             'new JsObject.jsify(value) : value;}\n');
  } else {
    sb.write('  set $dartName(${t}value) { $body = value; }\n');
  }
}

void _generateMethod(Method method, StringBuffer sb,
    String getDartName(String)) {
  var comment = _toComment(method.description, 2);
  sb.write(comment == '' ? '\n' : '\n$comment\n');
  for (var arg in method.args) {
    _generateArgComment(arg, sb);
  }
  for (var arg in method.optionalArgs) {
    _generateArgComment(arg, sb);
  }
  sb.write('  ');
  if (method.isVoid) sb.write('void ');
  var name = method.name;
  var dartName = getDartName(name);
  sb.write('$dartName(');
  var argList = new StringBuffer();
  // First do the regular args, then the optional ones if there are any.
  _generateArgList(method.args, sb, argList);
  if (!method.optionalArgs.isEmpty) {
    if (!method.args.isEmpty) {
      sb.write(', ');
      argList.write(', ');
    }
    sb.write('[');
    _generateArgList(method.optionalArgs, sb, argList);
    sb.write(']');
  }

  sb.write(") =>\n      jsElement.callMethod('$name', [$argList]);\n");
}

// Returns whether it found any args or not.
void _generateArgList(
    List<Argument> args, StringBuffer dartArgList, StringBuffer jsArgList) {
  bool first = true;
  for (var arg in args) {
    if (!first) {
      dartArgList.write(', ');
      jsArgList.write(', ');
    }
    first = false;
    var type = arg.type;
    if (type != null) {
      type = _docToDartType[type];
    }
    if (type != null) {
      dartArgList..write(type)
                 ..write(' ');
    }
    dartArgList.write(arg.name);
    jsArgList.write(arg.name);
  }
}

String generateDirectives(String name, Iterable<String> extendNames,
    FileConfig config) {
  var libName = name.replaceAll('-', '_');
  var extraImports = new Set<String>();

  for (var extendName in extendNames) {
    if (extendName == null || !extendName.contains('-')) {
      extraImports.add(
          "import 'package:core_elements/src/common.dart' show DomProxyMixin;");
    } else {
      var extendsImport = config.extendsImport;
      if (extendsImport == null) {
        var packageName = config.global.findPackageNameForElement(extendName);
        var fileName = '${extendName.replaceAll('-', '_')}.dart';
        extendsImport = packageName != null
            ? 'package:$packageName/$fileName' : fileName;
      }
      extraImports.add("import '$extendsImport';");
    }
  }

  return '''
// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `$name`.
library core_elements.$libName;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
${extraImports.join('\n')}
''';
}

String _generateHeader(String name, String comment, String extendName) {
  var className = _toCamelCase(name);

  if (extendName == null || !extendName.contains('-')) {
    extendName = 'HtmlElement with DomProxyMixin';
  } else {
    extendName = _toCamelCase(extendName);
  }

  return '''

$comment
class $className extends $extendName {
  ${className}.created() : super.created();
''';
}

String _generateUpdateMethod(String name) {
  var className = _toCamelCase(name);
  return '''
@initMethod
upgrade$className() => registerDartType('$name', ${className});
''';
}

void _generateArgComment(Argument arg, StringBuffer sb) {
  var name = arg.name;
  var description = arg.description.trim();
  if (description == '') return;
  var comment = description.replaceAll('\n', '\n  ///     ');
  sb.write('  /// [${name}]: $comment\n');
}

String _toComment(String description, [int indent = 0]) {
  description = description.trim();
  if (description == '') return '';
  var s1 = ' ' * indent;
  var comment = description.split('\n')
      .map((e) {
        var trimmed = e.trimRight();
        return trimmed == '' ? '' : ' $trimmed';
      })
      .join('\n$s1///');
  return '$s1///$comment';
}

String _toCamelCase(String dashName) => dashName.split('-')
    .map((e) => '${e[0].toUpperCase()}${e.substring(1)}').join('');

final _docToDartType = {
  'boolean': 'bool',
  'Boolean': 'bool',
  'array': 'JsArray',
  'string': 'String',
  'String': 'String',
  'number': 'num',
  'Object': null, // keep as dynamic
  'any': null,    // keep as dynamic
};
