// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_transition_css`.
library core_elements.core_transition_css;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_transition.dart';


class CoreTransitionCss extends CoreTransition {
  CoreTransitionCss.created() : super.created();

  get transitionType => jsElement['transitionType'];
  set transitionType(value) { jsElement['transitionType'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreTransitionCss() => registerDartType('core-transition-css', CoreTransitionCss);
