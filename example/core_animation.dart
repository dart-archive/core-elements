import 'dart:html';
import 'package:polymer/polymer.dart';

var player;

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      document.body.onClick.listen((e) {
        clickAction(e);
      });

      document.body.addEventListener('core-animation-finish', (e) {
        print('core-animation-finish');
        if (player) {
          player.cancel();
          player = null;
          e.target.querySelector('span').text = 'polymer';
        }
      });
    });
  });
}

void clickAction(MouseEvent e) {
  var t = e.target;
  if ((e.target as HtmlElement).localName != 'button') return;

  if (player) player.cancel();

  var a = t.querySelector('core-animation, core-animation-group');
  if (a.id == 'custom-animation') a.customEffect = customAnimationFn;

  a.target = document.getElementById('target');
  player = a.play();
}

// TODO(jakemac): Third argument here is always "fixme". What is up with that???
void customAnimationFn(timeFraction, target, _) {
  if (timeFraction == null) timeFraction = 1;
  target.querySelector('span').text = '$timeFraction';
}
