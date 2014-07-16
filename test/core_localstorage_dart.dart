//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_localstorage_dart.test;

import "dart:html" as dom;
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_localstorage_dart.dart" show CoreLocalStorage;

void main() {
  useHtmlConfiguration();

  test("core-localstorage", () {
    return initPolymer().run(() {
      return Polymer.onReady.then((_) {
        var s = dom.document.querySelector("#localstorage") as CoreLocalStorage;
        var m = "hello wold";
        dom.window.localStorage[s.name] = m;

        var doneEvent = expectAsync((){});

        s.on["core-localstorage-load"].listen((_) {
          doneEvent();
        });

        s.load();
        expect(s.value, equals(m));
        s.value = "goodbye";
        expect(dom.window.localStorage[s.name], equals(m));
      });
    });
  });

}

