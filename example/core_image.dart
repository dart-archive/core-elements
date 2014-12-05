import 'dart:html';
import 'dart:math';
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_image.dart';

class MyModel extends Observable {
  var $;
  MyModel(this.$);

  void preload(Event e) {
    var target = (e.target as HtmlElement);
    var img = querySelector('#${target.attributes['target']}') as CoreImage;
    var rand = new Random();
    img.src = 'http://lorempixel.com/1920/1080?${rand.nextDouble()}';
    target.text = 'Reload image';
  }

}

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var template = querySelector('#myTemplate') as AutoBindingElement;
      template.model = new MyModel(template.$);
    });
  });
}
