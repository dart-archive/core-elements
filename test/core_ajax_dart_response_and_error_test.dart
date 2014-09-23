//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_ajax.test;

import "dart:async";
import "dart:html" as dom;
import "package:core_elements/core_ajax_dart.dart";
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;

Completer done = new Completer();

@CustomTag('race-condition')
class RaceCondition extends PolymerElement {
  int delay = 1;
  var response;
  var testResult = 'pending...';
  @observable var passed = false;
  var requests = [];
  var finalTimeout;

  RaceCondition.created() : super.created();

  domReady() {
    new Future.delayed(new Duration(milliseconds: 100), () {
      if (this.response != null) {
        print('HTTP request returned too quick!');
        fail('Indeterminate, initial request returned too quick');
        this.testResult = 'indeterminate';
        done.complete();
        return;
      }
      this.delay = 2;
    });
    // This will fail the test if it neither passes nor fails in time.
    this.finalTimeout = new Timer(new Duration(seconds: 7), () {
      fail('Test timed out.');
      done.complete();
    });
  }

  responseChanged() {
    if (this.response['url'] != this.$['ajax'].url) {
      this.testResult = 'FAIL';
      fail('Race condition in response attribute');
      done.complete();
      return;
    }
    this.passed = true;
  }

  passedChanged() {
    if (this.passed && this.testResult == 'pending...') {
      this.testResult = 'PASS';
      this.finalTimeout.cancel();
      done.complete();
    }
  }

  @ObserveProperty("\$['ajax'].activeRequest")
  requestDidChange(o, n) {
    this.requests.add({
      'statusText': 'pending',
      'xhr': n,
      delay: this.delay
    });
  }

  handleResponse(resp) {
    var xhr = resp.detail['xhr'];
    for (var i = 0; i < this.requests.length; i++) {
      if (this.requests[i]['xhr'] == xhr) {
        this.requests[i]['statusText'] = xhr.statusText;
      }
    }
  }
}

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      test("response and error", () {
        return done.future;
      });

    });
  });
}
