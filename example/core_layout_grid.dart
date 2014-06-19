/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_layout_grid;

import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';

@CustomTag('grid-test')
class GridTest extends PolymerElement {
  var arrangements = [[
    [1, 1, 1, 1],
    [2, 3, 3, 4],
    [2, 3, 3, 5]
  ], [
    [4, 3, 2],
    [5, 3, 2],
    [5, 1, 1]
  ], [
    [1, 1],
    [2, 3],
    [4, 3]
  ]];

  @observable var layout = [];
  @observable var nodes;
  @observable int outputLayout = 0;

  GridTest.created() : super.created();

  ready() {
    this.outputLayoutChanged();
  }

  outputLayoutChanged() {
    this.layout = this.arrangements[this.outputLayout];
  }

  toggleLayout() {
    this.outputLayout = (this.outputLayout + 1) % this.arrangements.length;
  }

  rotate() {
    this.toggleLayout();
  }
}
