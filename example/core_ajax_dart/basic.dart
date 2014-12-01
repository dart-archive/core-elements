/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.example.core_ajax_dart.basic;

import 'dart:html';

import 'package:template_binding/template_binding.dart';
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_ajax_dart.dart';

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var ajax = querySelector('core-ajax-dart') as CoreAjax;

      ajax.on["core-response"].listen((event) {
        var detail = event.detail;
        var response = detail['response'];
        print(response['feed']['entry']);
        print(response['feed']['entry'].length);
        print(response['feed']['entry'][0]['title'][r'$t']);

        templateBind(querySelector('#t1')).model = {
          'response': response
        };

        templateBind(querySelector('#t2')).model = {
          'response': response
        };

      });
    });
  });
}
