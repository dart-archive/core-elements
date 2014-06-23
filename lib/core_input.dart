// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_input`.
library core_elements.core_input;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// core-input is an unstyled single- or multi-line text field where user can
/// enter input.
///
/// Example:
///
///     <core-input placeholder="Placeholder text here"></core-input>
///
///     <core-input multiline placeholder="Enter multiple lines here"></core-input>
///
/// The text input's value is considered "committed" if the user hits the `enter`
/// key or blurs the input after changing the value. The "change" event is fired
/// when the value becomes committed, and the committed value is stored in the
/// "value" property. The current value of the input is stored in the "inputValue"
/// property.
///
/// core-input also can optionally validate the value by providing it with a
/// regular expression to match against, or a validation function. The
/// "input-invalid" event is fired if the input value changes and is invalid.
/// The "invalid" property is also available for observation.
///
/// Example:
///
///     // valid only if the value is a number
///     <core-input validate="^[0-9]*$" on-input-invalid="{{inputInvalidAction}}"></core-input>
///
///     this.$.input.validate = /^[0-9]*$/;  // valid only if the value is a number
///
///     this.$.input2.validate = function(value) {
///       return value === 'foo';  // valid only if the value is 'foo'
///     }
///
///
///
/// Fired when the inputValue of is changed. This is the same event as the DOM
/// "input" event.
///
///
///
/// Fired when the user commits the value of the input, either by the hitting the
/// `enter` key or blurring the input after the changing the inputValue. Also see the
/// DOM "change" event.
///
///
///
/// Fired when the inputValue of this text input changes and fails validation.
class CoreInput extends HtmlElement with DomProxyMixin {
  CoreInput.created() : super.created();

  /// The value of the input committed by the user, either by changing the
  /// inputValue and blurring the input, or by hitting the `enter` key.
  String get value => jsElement['value'];
  set value(String value) { jsElement['value'] = value; }

  /// The current value of this input.
  String get inputValue => jsElement['inputValue'];
  set inputValue(String value) { jsElement['inputValue'] = value; }

  /// Placeholder text that hints to the user what can be entered in
  /// the input.
  String get placeholder => jsElement['placeholder'];
  set placeholder(String value) { jsElement['placeholder'] = value; }

  /// If true, this input cannot be focused and the user cannot change
  /// its value.
  bool get disabled => jsElement['disabled'];
  set disabled(bool value) { jsElement['disabled'] = value; }

  /// If true, this input accepts multi-line input like a `<textarea>`
  bool get multiline => jsElement['multiline'];
  set multiline(bool value) { jsElement['multiline'] = value; }

  /// (multiline only) The height of this text input in rows. The input
  /// will scroll internally if more input is entered beyond the size
  /// of the component. This property is meaningless if multiline is
  /// false. You can also set this property to "fit" and size the
  /// component with CSS to make the input fit the CSS size.
  get rows => jsElement['rows'];
  set rows(value) { jsElement['rows'] = value; }

  /// If this property is not null, the text input's inputValue will be
  /// validated. You can validate the value with either a regular expression
  /// or a custom function.
  ///
  /// To use a regular expression, set this property to a RegExp object or
  /// a string containing the regular expression to match against. To use a
  /// custom validator, set this property to a function with the signature
  /// function(value) that returns a boolean. The input is valid if the
  /// function returns true.
  ///
  /// Example:
  ///
  ///     // valid only if the value is a number
  ///     <core-input validate="^[0-9]*$"></core-input>
  ///
  ///     // valid only if the value is a number
  ///     this.$.input.validate = /^[0-9]*$/;
  ///
  ///     this.$.input2.validate = function(value) {
  ///         // valid only if the value is 'foo'
  ///         return value === 'foo';
  ///     }
  get validate => jsElement['validate'];
  set validate(value) { jsElement['validate'] = value; }

  /// If this property is true, the text input's inputValue failed validation.
  bool get invalid => jsElement['invalid'];
  set invalid(bool value) { jsElement['invalid'] = value; }
}
@initMethod
upgradeCoreInput() => registerDartType('core-input', CoreInput);
