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
            ..stringValue = "Initial value";
        return new async.Future(() {
          var input = dom.document.querySelector("#bindValue") as CoreInput;
          input.value = "Input value";
          return new async.Future(() {
            expect(model.stringValue, equals("Input value"));

            model.stringValue = "Model value";
            return new async.Future(() {
              expect(input.value, equals("Model value"));
            });
          });
        });
      });

      test("core-input validate number", () {
        var template = dom.document.querySelector("#validateNumberTemplate") as AutoBindingElement;
        var model = template.model = new MyModel()
            ..stringValue = "Initial value"
            ..inputInvalidHandler = (dom.CustomEvent e) {
              print("invalid: ${e.detail}");
            }
            ..inputValidHandler = (dom.CustomEvent e) {
              print("valid: ${e.detail}");
            };

        return new async.Future(() {
          var input = dom.document.querySelector("#validateNumber") as CoreInput;
          input.value = "Input value";
          return new async.Future(() {
            expect(model.stringValue, equals("Input value"));
            expect(model.isInvalid, isTrue);
            expect(input.invalid, isTrue);

            model.stringValue = "1234";
            return new async.Future(() {
              expect(input.value, equals("1234"));
              expect(model.isInvalid, isFalse);
              expect(input.invalid, isFalse);
            });
          });
        });
      });

    });
  });
}

