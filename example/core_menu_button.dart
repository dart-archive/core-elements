/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_menu_button;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_collapse.dart';

class MyModel {
  final List<String> pastries = [
    'Apple fritter',
    'Croissant',
    'Donut',
    'Financier',
    'Jello',
    'Madeleine',
    'Pound cake',
    'Pretzel',
    'Sfogliatelle'
  ];
}

main () {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var template = querySelector('#myTemplate');
      template.model = new MyModel();

      template.on['template-bound'].listen((_) {
        var button = querySelector('#toggleCollapse') as ButtonElement;
        button.onClick.listen((e) {
          (querySelector('#collapse') as CoreCollapse).toggle();
        });
      });
    });
  });
}
