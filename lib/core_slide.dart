// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_slide`.
library core_elements.core_slide;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;


class CoreSlide extends HtmlElement with DomProxyMixin {
  CoreSlide.created() : super.created();

  get open => jsElement['open'];
  set open(value) { jsElement['open'] = value; }

  get closed => jsElement['closed'];
  set closed(value) { jsElement['closed'] = value; }

  get vertical => jsElement['vertical'];
  set vertical(value) { jsElement['vertical'] = value; }

  get target => jsElement['target'];
  set target(value) { jsElement['target'] = value; }

  get targetId => jsElement['targetId'];
  set targetId(value) { jsElement['targetId'] = value; }
}
@initMethod
upgradeCoreSlide() => registerDartType('core-slide', CoreSlide);
