/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_drag_drop;

import 'dart:html';
import 'dart:js' show JsObject;
import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart' show main;

@initMethod init() {
  window.on['drag-start'].listen((e) {
    // TODO(sigmund): remove this use of JsInterop when dartbug.com/20648 and
    // dartbug.com/19315 are fixed.
    var dragInfo = _js(e)['detail'];

    // flaw #2: e vs dragInfo.event
    var color = dragInfo['event'].target.style.backgroundColor;
    dragInfo['avatar'].style.cssText = 'border: 3px solid $color;'
        'width: 32px; height: 32px; '
        'border-radius: 32px; background-color: whitesmoke';
    dragInfo['avatar'].append(querySelector('#hello'));
    dragInfo['drag'] = (_) {};
    dragInfo['drop'] = drop;
  });
  //
}

drop(dragInfo) {
  var color = dragInfo['avatar'].style.borderColor;
  var dropTarget = _js(dragInfo['event'])['relatedTarget'];
  if (color != '' && dropTarget.id == 'drop') {
    var f = dragInfo['framed'];
    var d = new DivElement();
    d.className = 'dropped';
    d.style.left = "${f['x'] - 4}px";
    d.style.top = "${f['y'] - 4}px";
    d.style.backgroundColor = color;
    dropTarget.append(d);
    dropTarget.style.backgroundColor = color;
  }
}
_js(e) => new JsObject.fromBrowserObject(e);
