// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_popup_overlay`.
library core_elements.core_popup_overlay;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_overlay.dart';

/// `core-popup-overlay` is a helper class to position an overlay relative to another
/// element.
class CorePopupOverlay extends CoreOverlay {
  CorePopupOverlay.created() : super.created();
  factory CorePopupOverlay() => document.createElement('core-popup-overlay');

  /// The `relatedTarget` is an element used to position the overlay, for example a
  /// button the user taps to show a menu.
  get relatedTarget => jsElement['relatedTarget'];
  set relatedTarget(value) { jsElement['relatedTarget'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The horizontal alignment of the overlay relative to the `relatedTarget`.
  get halign => jsElement['halign'];
  set halign(value) { jsElement['halign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The vertical alignment of the overlay relative to the `relatedTarget`.
  get valign => jsElement['valign'];
  set valign(value) { jsElement['valign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCorePopupOverlay() => registerDartType('core-popup-overlay', CorePopupOverlay);
