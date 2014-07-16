//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_selection.test.multi;

import "dart:html" as dom;
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_selection.dart" show CoreSelection;

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    Polymer.onReady.then((e) {

      test("core-selection-multi", () {
        var done = expectAsync(() {}, count: 2);
        var s = dom.document.querySelector("core-selection") as CoreSelection;
        int testNr = 0;

        s.addEventListener("core-select", (event) {
          if (testNr == 1) {
            // check test1
            expect(event.detail["isSelected"], isTrue);
            expect(event.detail["item"], equals("(item1)"));
            expect(s.isSelected(event.detail["item"]), isTrue);
            expect(s.getSelection().length, equals(1));
            // test2
            testNr++;
            s.select("(item2)");
            done();
          } else {
            if (testNr == 2) {
              // check test2
              expect(event.detail["isSelected"], isTrue);
              expect(event.detail["item"], equals("(item2)"));
              expect(s.isSelected(event.detail["item"]), isTrue);
              expect(s.getSelection().length, equals(2));
              done();
            }
          }
        });
        testNr = 1;
        s.select("(item1)");
      });

    });
  });
}
