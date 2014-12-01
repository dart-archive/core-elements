//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_localstorage_dart.raw_test;

import "dart:async";
import "dart:convert";
import "dart:html";
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_localstorage_dart.dart";

void main() {
  useHtmlConfiguration();
  window.localStorage['core-localstorage-test'] = 'hello world';

  initPolymer().run(() {
    return Polymer.onReady.then((_) {
      var storage = document.querySelector("#localstorage") as CoreLocalStorage;

      group("basic", () {

        test("load", () {
          expect(storage.value, 'hello world');
        });

        test('save', () {
          var m = 'goodby';
          storage.value = m;
          return new Future(() {}).then((_) {
            var v = window.localStorage[storage.name];
            expect(v, m);
          });
        });

      });

    });
  });
}

