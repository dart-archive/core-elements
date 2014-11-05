//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_list_dart.test;

import "dart:html" as dom;
import 'dart:async' show Future;

import 'package:polymer/polymer.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart' show useHtmlConfiguration;
import 'package:core_elements/core_list_dart.dart' show CoreList, CoreActivateEvent;

class Item {
  String value;

  Item(this.value);
}

class MyModel extends Object with Observable {
  final data = toObservable(<Item>[new Item('foo'), new Item('bar')]);

  @observable
  Item selection;
}

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      group('core-list-dart', () {

        test('update selection from model', () {
          final template =
              dom.document.querySelector('#bindSelectionTemplate') as AutoBindingElement;
          final model = template.model = new MyModel();
          final done1 = expectAsync(() {});

          return new Future(() {
            final list = dom.document.querySelector('#bindSelection') as CoreList;

// TODO(zoechi) check if this event should be fired when selection was changed
// probably not because the doc says `Fired when an item element is tapped`
// but it is handy during debugging of the test (remove this code when the problem is fixed)
//            list.on['core-activate'].first.then((e) {
//              expect((e.detail as CoreActivateEvent).data, equals(model.data[0]));
//              done1();
//            });

            model.selection = model.data[0];
            return new Future(() {
              final foundSelected = dom.document.querySelector('#bindSelection .selected');
              expect(foundSelected.innerHtml, contains(model.data[0].value));
            });
          });
        });

      });

    });
  });
}
