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

@CustomTag('svg-icon-demo')
class SvgIconDemo extends PolymerElement {
  @observable String icon;
  @observable int size = 100;

  SvgIconDemo.created() : super.created();

  iconChanged() {
    if (icon == null) return;

    var parts = this.icon.split(':');
    var iconName = parts.removeLast();
    // find the iconSet for the name given via the icon property
    var iconset = $['meta'].byId(parts.removeLast());
    if (iconset != null) {
      // size the element as needed
      this.style.height = this.style.width = '${size}px';
      // use iconset's applyAsBackground method to set the given icon
      // as the element's background image.
      iconset.applyIcon(this, iconName);
    }
  }
}

main() {
  initPolymer();
  Polymer.onReady.then((_) {
    var icons = querySelector('#meta').byId('svg-sample-icons')
        .jsElement['iconNames'];

    icons = icons.map((ic) => 'svg-sample-icons:$ic');
    for (var p in querySelectorAll('template')) {
      templateBind(p).model = icons;
    }
  });
}
