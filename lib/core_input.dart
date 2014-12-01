// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_input`.
library core_elements.core_input;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// `core-input` is an unstyled single-line input field. It extends the native
/// `input` element.
///
/// Example:
///
///     <input is="core-input">
///
/// The input's value is considered "committed" if the user hits the "enter" key
/// or blurs the input after changing the value. The committed value is stored in
/// the `committedValue` property.
///
/// If the input has `type = number`, this element will also prevent non-numeric characters
/// from being typed into the text field.
///
/// Accessibility
/// -------------
///
/// The following ARIA attributes are set automatically:
///
/// - `aria-label`: set to the `placeholder` attribute
/// - `aria-disabled`: set if `disabled` is true
class CoreInput extends InputElement with DomProxyMixin {
  CoreInput.created() : super.created();
  factory CoreInput() => new Element.tag('input', 'core-input');

  /// The "committed" value of the input, ie. the input value when the user
  /// hits the "enter" key or blurs the input after changing the value. You
  /// can bind to this value instead of listening for the "change" event.
  /// Setting this property has no effect on the input value.
  String get committedValue => jsElement['committedValue'];
  set committedValue(String value) { jsElement['committedValue'] = value; }

  /// Set to true to prevent invalid input from being entered.
  bool get preventInvalidInput => jsElement['preventInvalidInput'];
  set preventInvalidInput(bool value) { jsElement['preventInvalidInput'] = value; }

  /// Commits the `value` to `committedValue`
  void commit() =>
      jsElement.callMethod('commit', []);
}
@initMethod
upgradeCoreInput() => registerDartType('core-input', CoreInput, extendsTag: 'input');
