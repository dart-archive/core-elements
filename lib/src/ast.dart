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

/// Common information to most entries (element, property, method, etc).
abstract class Entry {
  final String name;
  String description;

  Entry(this.name, this.description);

  String toString() {
    var sb = new StringBuffer();
    _prettyPrint(sb);
    return sb.toString();
  }

  void _prettyPrint(StringBuffer sb);
}

/// An entry that has type information (like arguments and properties).
abstract class TypedEntry extends Entry {
  String type;
  TypedEntry(name, desc, [this.type]) : super(name, desc);
}

/// Data about a custom-element.
class Element extends Entry {
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
  Property(name, desc) : super(name, desc);

  void _prettyPrint(StringBuffer sb) {
    sb.write('$type $name;');
  }
}

/// Data about a method.
// TODO(sigmund): extend TypedEntry if return types become available.
class Method extends Entry {
  bool isVoid = true;
  List<Argument> args = [];
  Method(name, desc) : super(name, desc);

  void _prettyPrint(StringBuffer sb) {
    if (isVoid) sb.write('void ');
    sb.write('$name(');
    bool first = true;
    for (var arg in args) {
      if (!first) {
        sb.write(',');
      }
      first = false;
      arg._prettyPrint(sb);
    }
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
