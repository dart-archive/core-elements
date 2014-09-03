//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_menu_button.test;

import "dart:html" as dom;
import "dart:async" as async;

import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_menu_button.dart" show CoreMenuButton;

class MyModel extends Object with Observable {
  @observable
  bool showButton;
}

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      group("core-menu-button", () {

        // TODO(zoechi) https://code.google.com/p/dart/issues/detail?id=20004 overlay is not removed
        skip_test("overlay should be removed when button is removed while open", () {
          var template = dom.document.querySelector("#removeOpenedOverlay") as AutoBindingElement;
          var model = template.model = new MyModel()
              ..showButton = true;
          return new async.Future(() {
            var menuButton = dom.document.querySelector("#menuButton") as CoreMenuButton;
            menuButton.opened = true;
            // overlay should be in the DOM
            return new async.Future(() {
              var menuButton = dom.document.querySelector("#menuButton") as CoreMenuButton;
              var overlay = dom.document.querySelector("core-overlay-layer.core-opened");
              expect(overlay, isNotNull);
              var overlayHost = dom.querySelector('core-overlay-layer.core-opened overlay-host');
              expect(overlayHost, isNotNull);
              var menuItems = overlayHost.shadowRoot.querySelectorAll('core-item');
              expect(menuItems.toList().length, equals(4));
              model.showButton = false;
              // button and overlay should not be in the DOM anymore
              return new async.Future(() {
                menuButton = dom.document.querySelector("#menuButton");
                expect(menuButton, isNull);
                overlay = dom.document.querySelector("core-overlay-layer.core-opened");
                expect(overlayHost, isNull, reason: "overlay should have been removed");
              });
            });
          });

        });

      });

    });
  });
}

