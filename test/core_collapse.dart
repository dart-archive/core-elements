//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library polymer_collapse.test;

import "dart:html" as dom;
import "dart:async" as async;
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_enhanced_config.dart" show
    useHtmlEnhancedConfiguration;
import "package:core_elements/core_collapse.dart" show
    CoreCollapse;

@initMethod
void main() {
  useHtmlEnhancedConfiguration();

  test("core-collapse", () {
    dom.querySelector("button").onClick.listen((e) =>
        (dom.document.querySelector("#collapse") as CoreCollapse).toggle());

    Duration delay = new Duration(milliseconds: 200);

    Polymer.onReady.then((_) {
      var done = expectAsync(() {});
      async.Timer.run(() {
        var c = dom.document.querySelector("#collapse") as CoreCollapse;
        // verify take attribute for opened is correct
        expect(c.opened, isTrue);
        new async.Future.delayed(delay, () {
          // get the height for the opened state
          var h = getCollapseComputedStyle().height;
          // verify the height is not 0px
          expect(h, isNot(equals("0px")));
          // close it
          c.opened = false;
          new async.Future.delayed(delay, () {
            // verify is closed
            expect(getCollapseComputedStyle().height, isNot(equals(h)));
            // open it
            c.opened = true;
            new async.Future.delayed(delay, () {
              // verify is opened
              expect(getCollapseComputedStyle().height, equals(h));
              done();
            });
          });
        });
      });
    });
  });
}

dynamic getCollapseComputedStyle() {
  dom.HtmlElement b = dom.document.querySelector("#collapse");
  return b.getComputedStyle();
}
