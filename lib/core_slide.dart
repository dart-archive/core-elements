// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_slide`.
library core_elements.core_slide;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;


class CoreSlide extends HtmlElement with DomProxyMixin {
  CoreSlide.created() : super.created();
  factory CoreSlide() => new Element.tag('core-slide');

  get open => jsElement['open'];
  set open(value) { jsElement['open'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get closed => jsElement['closed'];
  set closed(value) { jsElement['closed'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get vertical => jsElement['vertical'];
  set vertical(value) { jsElement['vertical'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get target => jsElement['target'];
  set target(value) { jsElement['target'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get targetId => jsElement['targetId'];
  set targetId(value) { jsElement['targetId'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreSlide() => registerDartType('core-slide', CoreSlide);
