//Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
//This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
//The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
//The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
//Code distributed by Google as part of the polymer project is also
//subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library core_media_query.test;

import "dart:html" as dom;
import "dart:async" as async;
import "package:polymer/polymer.dart";
import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart" show useHtmlConfiguration;

void main() {
  useHtmlConfiguration();

  initPolymer().run(() {
    return Polymer.onReady.then((_) {

      group("core-media-query", () {

        // TODO(zoechi) the fix for the issue 20143 broke this test
        // I created a new issue https://code.google.com/p/dart/issues/detail?id=20216
        skip_test("basic", () {
          const WIDTHS = const [500, 1000, 700, 300, 700];
          const IS_PHONE = const [true, false, false, true, false];
          const IS_TABLET = const [false, true, true, false, true];
          var done = expectAsync(() {});
          dom.Window dialog;
          dom.window.onMessage.listen((e) {
            // ignore messages the unittest runner sends internally
            if (e.data is Map && (e.data as Map).containsKey("message_id")) {
              int messageId = e.data["message_id"];
              // increase the test data index because
              // resize from 1000 to 700 doesn't produce a message
              if (messageId >= 2) messageId++;

              expect(e.data["width"], WIDTHS[messageId]);
              expect(e.data["phone"], equals(IS_PHONE[messageId]));
              expect(e.data["tablet"], equals(IS_TABLET[messageId]));

              // resize from 1000 to 700 doesn't produce a message
              // just send another resize
              if (messageId == 1) {
                new async.Future(
                    () => dialog.resizeTo(WIDTHS[messageId + 2], 700));
              }

              if (messageId < 4) {
                dialog.resizeTo(WIDTHS[messageId + 1], 700);
              } else {
                dialog.close();
                done();
              }
            }
          });

          // TODO(zoechi) this will break when https://code.google.com/p/dart/issues/detail?id=20143 is fixed
          // this also doesn't work in JavaScript
          dialog = dom.window.open(
              "core_media_query_dialog.html",
              "_blank") as dom.Window;
          dialog.resizeTo(WIDTHS[0], 700);
        });

      });

    });
  });
}
