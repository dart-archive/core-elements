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
  @observable String addIdx = '0';
  @observable String deleteIdx = '0';
  @observable String scrollToIdx = '0';
  @observable bool multi = false;
  @observable bool selectionEnabled = true;
  @observable int count = 50000;
  @observable ObservableList data;
  @observable var selection;

  ListTest.created() : super.created();

  @override ready() {
    this.initArrayFull();
  }

  generateData() {
    var names = <String>[];
    var data = new ObservableList();
    for (var i = 0; i < this.count; i++) {
      names.add(_generateName(4, 8));
    }
    names.sort();
    for (var i = 0; i < this.count; i++) {
      data.add(new TestItem(
        id: i,
        name: names[i],
        details: strings[i % 3],
        image: i % 4,
        value: 0,
        type: 0,
        checked: false
      ));
    }
    return data;
  }

  addRecord() {
    data.insert(int.parse(addIdx), new TestItem(
        id: ++this.count,
        name: _generateName(4, 8),
        details: strings[this.count % 3],
        image: this.count % 4,
        value: 0,
        type: 0,
        checked: false));
  }

  deleteRecord() {
    data.removeAt(int.parse(deleteIdx));
  }

  scrollTo() {
    $['list'].scrollToItem(int.parse(scrollToIdx));
  }

  deleteSelection() {
    if (this.multi) {
      if (this.selection.length > 0) {
        for (var item in this.selection) {
          this.data.removeAt(this.data.indexOf(item));
        }
      }
    } else {
      var x = data.remove(this.selection);
    }
  }

  clearSelection() {
    $['list'].clearSelection();
  }

  deleteAll() {
    data.clear();
  }

  deleteArray() {
    data = null;
  }

  initArrayEmpty() {
    data = toObservable([]);
  }

  initArrayFull() {
    data = generateData();
  }

  charFor(type) => ['a', 'b', 'c'][type];
}

class TestItem extends Observable {
  final int id;
  final String name;
  final String details;
  final int image;
  @observable int value;
  @observable int type;
  @observable bool checked;

  TestItem({this.id, this.name, this.details, this.image, this.value, this.type,
      this.checked});
}

main() => initPolymer();
