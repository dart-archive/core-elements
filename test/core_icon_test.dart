//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_icon.test;

import 'dart:html' as dom;
import 'dart:async' show Future, Stream;

import 'package:polymer/polymer.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart' show useHtmlConfiguration;
import 'package:core_elements/core_icon.dart' show CoreIcon;

class MyModel extends Object with Observable {
  @observable
  String icon = 'menu';
}

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      test('basic test', () {
        var icon = dom.document.querySelector('core-icon#basic') as CoreIcon;
        print('x');
      });

      test('bind null to the icon attribute', () {
        var template =
            dom.document.querySelector('#bindNullTemplate') as AutoBindingElement;
        var model = template.model = new MyModel();
        return new Future(() {
          try {
            model.icon = null;
          } catch(e, s) {
            print('Exception: $e\n $s');
          }
          return new Future(() {
            var icon = dom.document.querySelector('#bindValue') as CoreIcon;
            // TODO(zoechi) complete test
          });
        });
      });

    });
  });
}
