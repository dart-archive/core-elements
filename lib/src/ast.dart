// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

/// AST nodes to represent the API of a Javascript polymer custom element. This
/// is parsed from documentation found in polymer elements and then it is used
/// to autogenerate a Dart API for them.
library core_elements.src.ast;

class FileSummary {
  List<Import> imports;
  List<Element> elements;

  FileSummary(this.imports, this.elements);

  String toString() => 'imports: $imports, elements: $elements';
}

/// Base class for any entry we parse out of the HTML files.
abstract class Entry {
  String toString() {
    var sb = new StringBuffer();
    _prettyPrint(sb);
    return sb.toString();
  }

  void _prettyPrint(StringBuffer sb);
}

/// Common information to most entries (element, property, method, etc).
abstract class NamedEntry {
  final String name;
  String description;

  NamedEntry(this.name, this.description);
}

/// An entry that has type information (like arguments and properties).
abstract class TypedEntry extends NamedEntry {
  String type;
  TypedEntry(name, desc, [this.type]) : super(name, desc);
}

/// An import to another html element.
class Import extends Entry {
  String importPath;
  Import(this.importPath);

  void _prettyPrint(StringBuffer sb) {
    sb.write('import: $importPath\n');
  }
}

/// Data about a custom-element.
class Element extends NamedEntry {
  final Map<String, Property> properties = {};
  final List<Method> methods = [];
  final String extendName;

  Element(name, this.extendName) : super(name, '');

  void _prettyPrint(StringBuffer sb) {
    sb.write('$name:\n');
    for (var p in properties.values) {
      sb.write('  - ');
      p._prettyPrint(sb);
      sb.write('\n');
    }
    for (var m in methods) {
      sb.write('  - ');
      m._prettyPrint(sb);
      sb.write('\n');
    }
  }
}

/// Data about a property.
class Property extends TypedEntry {
  bool hasGetter;
  bool hasSetter;

  Property(name, desc, {this.hasGetter: false, this.hasSetter: false})
      : super(name, desc);

  void _prettyPrint(StringBuffer sb) {
    sb.write('$type $name;');
  }
}

/// Data about a method.
class Method extends TypedEntry {
  bool isVoid = true;
  List<Argument> args = [];
  List<Argument> optionalArgs = [];
  Method(name, desc) : super(name, desc);

  void _prettyPrint(StringBuffer sb) {
    if (isVoid) sb.write('void ');
    sb.write('$name(');

    bool first = true;
    for (var arg in args) {
      if (!first) sb.write(',');
      first = false;
      arg._prettyPrint(sb);
    }

    bool firstOptional = true;
    for (var arg in optionalArgs) {
      if (firstOptional) {
        if (!first) sb.write(',');
        sb.write('[');
      } else {
        sb.write(',');
      }
      first = false;
      firstOptional = false;
      arg._prettyPrint(sb);
    };
    if (!firstOptional) sb.write(']');

    sb.write(');');
  }
}


/// Collects name and type information for arguments.
class Argument extends TypedEntry {
  Argument(name, desc, type) : super(name, desc, type);

  void _prettyPrint(StringBuffer sb) {
    if (type != null) sb..write(type)..write(' ');
    sb.write(name);
  }
}
