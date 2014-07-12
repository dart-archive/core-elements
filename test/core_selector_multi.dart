//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_selector.test.multi;

import "dart:async" as async;
import "dart:html" as dom;
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

// TODO see issue #52 and comment on line 31 below
      skip_test("core-selector-multi", () {
        var done = expectAsync(() {});
        // selector1
        var s = (dom.document.querySelector("#selector") as CoreSelector);
        expect(s.selected, isNull);
        expect(s.selectedClass, equals("core-selected"));
        expect(s.multi, isTrue);
        expect(s.valueattr, equals("name"));
        // TODO expect(s.items.length, equals(5)); // getter items not available, see #52
        // setup listener for polymer-select event
        var selectEventCounter = 0;
        s.on["core-select"].listen((dom.CustomEvent e) {
          if (e.detail["isSelected"]) {
            selectEventCounter++;
          } else {
            selectEventCounter--;
          }
          // check selectedItem in polymer-select event
          expect(s.selectedItem.length, selectEventCounter);
        });
        // set selected
        // TODO dom.Platform.flush(); is there an equivalent in Polymer.dart
        s.selected = [0, 2];
            // TODO doesn't work as expected https://code.google.com/p/dart/issues/detail?id=17472
        // TODO s.dummy = "dummy"; // issue is still not fixed. Check if the workaround is necessary anymore anyway
        oneMutation(s, {
          "attributes": true
        }, () {
          new async.Future.delayed(new Duration(milliseconds: 50), () {
              // TODO workaround for https://code.google.com/p/dart/issues/detail?id=14496
            // check polymer-select event
            expect(selectEventCounter, equals(2));
            // check selected class
            expect(s.children[0].classes.contains("core-selected"), isTrue);
            expect(s.children[2].classes.contains("core-selected"), isTrue);
            // check selectedItem
            expect(s.selectedItem.length, equals(2));
            expect(s.selectedItem[0], equals(s.children[0]));
            expect(s.selectedItem[1], equals(s.children[2]));
            // tap on already selected element should unselect it
            s.children[0].dispatchEvent(new dom.CustomEvent("tap", canBubble:
                true)); // TODO change to 'tap' when it's working
            // check selected
            expect(s.selected.length, equals(1));
            expect(s.children[0].classes.contains("core-selected"), isFalse);
            done();
          });
        });
      });
    });
  });
}

