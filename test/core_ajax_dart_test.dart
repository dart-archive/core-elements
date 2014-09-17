//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_ajax.test;

import "dart:html" as dom;
import "package:core_elements/core_ajax_dart.dart";
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      group("core-ajax", () {

        test("auto basic", () {
          var done = expectAsync(() {});

          var s = dom.document.querySelector("#auto");
          s.addEventListener("core-response", (event) {
            expect(event.detail['response']['feed']['entry'].length, greaterThan(0));
            done();
          });
        });

        test("no auto basic", () {
          var done = expectAsync(() {});

          var s = dom.document.querySelector("#manual");
          s.addEventListener("core-response", (event) {
            expect(event.detail['response']['feed']['entry'].length, greaterThan(0));
            done();
          });
          (s as CoreAjax).go();
        });

      });

    });
  });
}
