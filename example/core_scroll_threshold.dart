import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

class MyModel {
  var $;
  int n;
  final List data = toObservable([]);
  MyModel(this.$);

  initData() {
    for (n = 0; n < 20; n++) {
      data.add(n);
    }
  }

  loadMore() {
    new Future.delayed(new Duration(seconds: 1), () {
      var end = n + 10;
      for (; n < end; n++) {
        data.add(n);
      }
      $['threshold'].clearLower(false);
    });
  }
}

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var template = querySelector('#myTemplate') as AutoBindingElement;
      template.model = new MyModel(template.$);
      template.on['template-bound'].take(1).listen((_) {
        template.model.initData();
      });
    });
  });
}
