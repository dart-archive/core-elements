/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_ajax_dart.progress;

import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';
import 'package:core_elements/core_ajax_dart.dart';


@CustomTag('progress-test')
class ProgressTest extends PolymerElement {
  @observable bool loading = true;
  @observable int numbytes = 1000;
  @observable CoreAjaxProgress progress;

  ProgressTest.created() : super.created();

  void restart() {
    $['ajax'].abort();
    $['ajax'].go();
  }
}
