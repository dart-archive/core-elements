// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_dropdown_overlay`.
library core_elements.core_dropdown_overlay;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_overlay.dart';

/// `core-dropdown-overlay` is a helper class to position an overlay relative to another
/// element within the same offsetParent.
class CoreDropdownOverlay extends CoreOverlay {
  CoreDropdownOverlay.created() : super.created();
  factory CoreDropdownOverlay() => new Element.tag('core-dropdown-overlay');

  /// The `relatedTarget` is an element used to position the overlay. It should have
  /// the same offsetParent as the target.
  get relatedTarget => jsElement['relatedTarget'];
  set relatedTarget(value) { jsElement['relatedTarget'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The horizontal alignment of the overlay relative to the `relatedTarget`.
  /// `left` means the left edges are aligned together and `right` means the right
  /// edges are aligned together.
  get halign => jsElement['halign'];
  set halign(value) { jsElement['halign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The vertical alignment of the overlay relative to the `relatedTarget`. `top`
  /// means the top edges are aligned together and `bottom` means the bottom edges
  /// are aligned together.
  get valign => jsElement['valign'];
  set valign(value) { jsElement['valign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreDropdownOverlay() => registerDartType('core-dropdown-overlay', CoreDropdownOverlay);
