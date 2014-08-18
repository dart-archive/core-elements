/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_iconset_svg;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart';
import 'package:core_elements/core_meta.dart';

class MyModel {
  List<String> icons;

  MyModel(this.icons);
}

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var template = querySelector('template') as TemplateElement;
      template.on['template-bound'].listen((_) {
        var setName = 'svg-sample-icons';
        var meta = querySelector('#meta') as CoreMeta;
        var icons = meta.byId(setName).iconNames;
        template.model = new MyModel(icons.map((icon) => '$setName:$icon').toList());
      });
    });
  });
}
