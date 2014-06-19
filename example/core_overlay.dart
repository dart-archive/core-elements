/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_overlay;

import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';

@CustomTag('x-dialog')
class XDialog extends PolymerElement {
  @observable bool opened = false;
  @observable bool autoCloseDisabled = false;

  XDialog.created() : super.created();
  ready() {
    $['overlay'].target = this;
  }

  toggle() {
    $['overlay'].toggle();
  }
}

@CustomTag('x-container')
class XContainer extends PolymerElement {
  XContainer.created() : super.created();
  inputHandler(e) {
    if (e.target.value == 'something') {
      $['confirmation'].toggle();
    }
  }

  tapHandler() {
    $['dialog'].toggle();
  }
}
