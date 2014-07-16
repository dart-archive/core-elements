//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_input.test;

import "dart:html" as dom;
import "dart:async" as async;

import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;
import "package:core_elements/core_input.dart" show CoreInput;

class MyModel extends Object with Observable {
  @observable
  String stringValue;

  @observable
  bool isInvalid;

  Function changeHandler;
  Function inputHandler;
  Function inputInvalidHandler;
  Function inputValidHandler;
}

const INITIAL_VALUE = 'Initial value';
const INPUT_VALUE = 'Input value';
const NUMBER_VALUE = '1234';
const PASSWORD_VALUE = 'My secret password 19 !\"§\$';

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      test("core-input type='text'", () {
        var input = dom.document.querySelector("#typeText") as CoreInput;
        expect(input.value, equals("Some content"));
      });

      test("core-input bind value", () {
        var template = dom.document.querySelector("#bindValueTemplate") as AutoBindingElement;
        var model = template.model = new MyModel()
            ..stringValue = INITIAL_VALUE;
        return new async.Future(() {
          var input = dom.document.querySelector("#bindValue") as CoreInput;
          input.value = INPUT_VALUE;
          return new async.Future(() {
            expect(model.stringValue, equals(INPUT_VALUE));

            final MODEL_VALUE = 'Model value';
            model.stringValue = MODEL_VALUE;
            return new async.Future(() {
              expect(input.value, equals(MODEL_VALUE));
            });
          });
        });
      });

      test("core-input validate number", () {
        var template = dom.document.querySelector("#validateNumberTemplate") as AutoBindingElement;
        var model = template.model = new MyModel()
            ..stringValue = INITIAL_VALUE
            ..inputInvalidHandler = (dom.CustomEvent e) {
              logMessage("invalid: ${e.detail}");
            }
            ..inputValidHandler = (dom.CustomEvent e) {
              logMessage("valid: ${e.detail}");
            };

        return new async.Future(() {
          var input = dom.document.querySelector("#validateNumber") as CoreInput;
          input.value = INPUT_VALUE;
          return new async.Future(() {
            expect(model.stringValue, equals(INPUT_VALUE));
            expect(model.isInvalid, isTrue);
            expect(input.invalid, isTrue);

            model.stringValue = NUMBER_VALUE;
            return new async.Future(() {
              expect(input.value, equals(NUMBER_VALUE));
              expect(model.isInvalid, isFalse);
              expect(input.invalid, isFalse);
            });
          });
        });
      });

      // TODO(zoechi) #48 <core-input type="password"> works in JS but not in Dart
      skip_test("core-input type='password'", () {
        var template = dom.document.querySelector("#passwordTemplate") as AutoBindingElement;
        var model = template.model = new MyModel()
            ..stringValue = "";

        return new async.Future(() {
          var input = dom.document.querySelector("#password") as CoreInput;

          var innerInputElement = input.shadowRoot.querySelector("#input");
          expect(innerInputElement, new isInstanceOf(dom.PasswordInputElement));

          input.value = PASSWORD_VALUE;
          return new async.Future(() {
            expect(model.stringValue, equals(PASSWORD_VALUE));

            final MODEL_VALUE = "another password";
            model.stringValue = MODEL_VALUE;
            return new async.Future(() {
              expect(input.value, equals(MODEL_VALUE));
              expect(input.invalid, isFalse);
            });
          });
        });
      });

    });
  });
}

