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

  int _changeHandlerCount = 0;
  int _inputHandlerCount = 0;
  int _inputInvalidHandlerCount = 0;
  int _inputValidHandlerCount = 0;

  void changeHandler(e) => _changeHandlerCount++;
  void inputHandler(e) => _inputHandlerCount++;
  void inputInvalidHandler(e) => _inputInvalidHandlerCount++;
  void inputValidHandler(e) => _inputValidHandlerCount++;
}

const INITIAL_VALUE = "Initial value";
const INPUT_VALUE = "Input value";
const NUMBER_VALUE = "1234";
const PASSWORD_VALUE = "My secret password 19 !\"§\$";

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      group("core-input", () {
        // TODO(zoechi) test multiline

        // TODO(zoechi) test required http://stackoverflow.com/questions/24572472
        test("type='text'", () {
          var input = dom.document.querySelector("#typeText") as CoreInput;
          expect(input.value, equals("Some content"));
        });

        test("bind value", () {
          var template =
              dom.document.querySelector("#bindValueTemplate") as AutoBindingElement;
          var model = template.model = new MyModel()
              ..stringValue = INITIAL_VALUE;
          return new async.Future(() {
            var input = dom.document.querySelector("#bindValue") as CoreInput;
            input.value = INPUT_VALUE;
            return new async.Future(() {
              expect(model.stringValue, equals(INPUT_VALUE));
              final MODEL_VALUE = "Model value";
              model.stringValue = MODEL_VALUE;
              return new async.Future(() {
                expect(input.value, equals(MODEL_VALUE));
              });
            });
          });
        });

        test("change and input event", () {
          var template =
              dom.document.querySelector("#changeAndInputEventTemplate") as AutoBindingElement;
          var model = template.model = new MyModel();

          return new async.Future(() {
            var input = dom.document.querySelector("#changeAndInputEvent") as CoreInput;
            var domInput = (input.shadowRoot.querySelector('#input') as dom.InputElement);
            domInput.dispatchEvent(new dom.CustomEvent("change", detail: {"source": "changeAndInputEventTest}"}));
            domInput.dispatchEvent(new dom.CustomEvent("input", canBubble: true, detail: {"source": "changeEventTest"}));
            expect(model._changeHandlerCount, 1);
            expect(model._inputHandlerCount, 1);
          });
        });

        test("validate number", () {
          var template =
              dom.document.querySelector("#validateNumberTemplate") as AutoBindingElement;
          var model = template.model = new MyModel()
              ..stringValue = INITIAL_VALUE;

          return new async.Future(() {
            var input =
                dom.document.querySelector("#validateNumber") as CoreInput;
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

        test("type='password'", () {
          var template =
              dom.document.querySelector("#passwordTemplate") as AutoBindingElement;
          var model = template.model = new MyModel()..stringValue = "";

          return new async.Future(() {
            var input = dom.document.querySelector("#password") as CoreInput;

            var innerInputElement = input.shadowRoot.querySelector("#input") as dom.PasswordInputElement;
            expect(
                innerInputElement.attributes['type'].toLowerCase(), equals('password'));

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
  });
}
