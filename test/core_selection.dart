//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_selection.test;

import 'dart:async' as async;
import 'dart:html' as dom;
import 'package:polymer/polymer.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart' show useHtmlConfiguration;
import 'package:core_elements/core_selection.dart' show CoreSelection;

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((e) {

      test('core-selection', () {
        var done = expectAsync(() {}, count: 2);
        var s = dom.document.querySelector('core-selection') as CoreSelection;
        int testNr = 0;

        async.StreamSubscription subscr;
        subscr = s.on['core-select'].listen((event) {
          if (testNr == 1) {
            expect(event.detail['isSelected'], isTrue);
            expect(event.detail['item'], equals('(item)'));
            expect(s.isSelected(event.detail['item']), isTrue);
            expect(s.isSelected('(some_item_not_selected)'), isFalse);
            testNr++;
            s.select(null);
            done();
          } else {
            if (testNr == 2) {
              // check test2
              expect(event.detail['isSelected'], isFalse);
              expect(event.detail['item'], equals('(item)'));
              expect(s.isSelected(event.detail['item']), isFalse);
              subscr.cancel(); // don't fire when other tests run
              done();
            }
          }
        });
        testNr = 1;
        s.select('(item)');
      });

    });
  });
}
