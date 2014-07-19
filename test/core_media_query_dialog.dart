//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_media_query.test.dialog;

import "dart:html" as dom;
import "package:polymer/polymer.dart";

class MyModel extends Object with Observable {
  @observable
  String phoneQuery;

  @observable
  String tabletQuery;

  @observable
  bool matchesPhone;

  @observable
  bool matchesTablet;

  Function coreMediaChangeHandler;
}

void main() {
  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      int counter = 0;
      var template =
          dom.document.querySelector("#simpleMatch") as AutoBindingElement;
      var mqPhone;
      var mqTablet;
      var model;
      model = template.model = new MyModel()
          ..tabletQuery = "(min-width: 600px)"
          ..phoneQuery = "(max-width: 599px)"
          ..coreMediaChangeHandler = (dom.CustomEvent e) {
            dom.window.opener.postMessage({
              'message_nr': counter,
              'phone': model.matchesPhone,
              'tablet': model.matchesTablet,
              'width' : dom.window.innerWidth
            }, "*");
            counter++;
          };
    });
  });
}
