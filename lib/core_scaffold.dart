// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core-scaffold`.
library core_elements.core_scaffold;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// core-scaffold (WIP)
class CoreScaffold extends HtmlElement with DomProxyMixin {
  CoreScaffold.created() : super.created();

  get responsiveWidth => jsElement['responsiveWidth'];
  set responsiveWidth(value) { jsElement['responsiveWidth'] = value; }

  get mode => jsElement['mode'];
  set mode(value) { jsElement['mode'] = value; }
}
@initMethod
upgradeCoreScaffold() => registerDartType('core-scaffold', CoreScaffold);
