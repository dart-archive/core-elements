//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_selector.test.activate_event;

import "dart:html" as dom;
import "dart:js" as js;
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_selector.dart" show CoreSelector;

void oneMutation(dom.Element node, options, Function cb) {
  var o = new dom.MutationObserver((List<dom.MutationRecord>
      mutations, dom.MutationObserver observer) {
    cb();
    observer.disconnect();
  });
  o.observe(node, attributes: options["attributes"]);
}

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    Polymer.onReady.then((e) {
      test("core-selector-activate-event", () {
        var done = expectAsync(() {});
        // selector1
        var s = (dom.document.querySelector("#selector") as CoreSelector);
        s.on['core-activate'].listen((dom.CustomEvent e) {
// TODO(zoechi) event detail is null https://code.google.com/p/dart/issues/detail?id=19315
          var detail = new js.JsObject.fromBrowserObject(e)['detail'];
          expect(detail["item"], equals(s.children[1]));
          expect(s.selected, equals(1));
          done();
        });
        expect(s.selected, equals('0'));
        dom.window.requestAnimationFrame((e) {
          s.children[1].dispatchEvent(new dom.CustomEvent("tap", canBubble: true));
        });
      });

    });
  });
}

