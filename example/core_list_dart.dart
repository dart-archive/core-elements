/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_list_dart;

import 'dart:html';
import 'dart:math' as math;
import 'package:polymer/polymer.dart';

var strings = [
  "PARKOUR!",
  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur,"
    " adipisci velit...",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
];

final _random = new math.Random();

_generateString(inLength) {
  var s = '';
  for (var i=0; i<inLength; i++) {
    s += new String.fromCharCode(_random.nextInt(26) + 97);
  }
  return s;
}

_generateName(inMin, inMax) {
  return _generateString(_random.nextInt(inMax - inMin + 1) + inMin);
}


@CustomTag('list-test')
class ListTest extends PolymerElement {
  final int count = 50000;
  @observable ObservableList data;

  ListTest.created() : super.created();

  @override ready() {
    this.data = this.generateData();
  }

  generateData() {
    var names = <String>[], data = new ObservableList();
    for (var i=0; i<this.count; i++) {
      names.add(_generateName(4, 8));
    }
    names.sort();
    for (var i=0; i<this.count; i++) {
      var name = names[i];
      var divider = name[0];

      if (i == 0 || divider == names[i-1][0]) {
        divider = null;
      }
      data.add(new TestItem(
        index: i,
        name: name,
        divider: divider,
        details: strings[i % 3],
        time: '8:29pm'
      ));
    }
    return data;
  }
  tapAction(e) {
    window.console.log('tap $e');
  }
}

class TestItem {
  int index;
  String name;
  String divider;
  String details;
  String time;
  bool selected = false;

  TestItem({this.index, this.name, this.divider, this.details, this.time});
}

main() => initPolymer();
