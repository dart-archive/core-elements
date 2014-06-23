// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_transition_css`.
library core_elements.core_transition_css;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_transition.dart';


class CoreTransitionCss extends CoreTransition {
  CoreTransitionCss.created() : super.created();

  get transitionType => jsElement['transitionType'];
  set transitionType(value) { jsElement['transitionType'] = value; }
}
@initMethod
upgradeCoreTransitionCss() => registerDartType('core-transition-css', CoreTransitionCss);
