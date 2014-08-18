// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_input`.
library core_elements.core_input;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
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
/// The text input's value is considered "committed" if the user hits the "enter"
/// key or blurs the input after changing the value. The `change` event is fired
/// when the value becomes committed, and the committed value is stored in the
/// `value` property. The current value of the input is stored in the `inputValue`
/// property.
///
/// Validation
/// ----------
///
/// core-input can optionally validate the value using the HTML5 constraints API,
/// similar to native inputs. There are two methods to enable input validation:
///
/// 1. By setting the `type` attribute. For example, setting it to `email` will
///    check the value is a valid email, and setting it to `number` will check
///    the input is a number.
///
/// 2. By setting attributes related to validation. The attributes are `pattern`,
///    `min`, `max`, `step` and `required`.
///
/// Only `required` is supported for multiline inputs currently.
///
/// Example:
///
///     <core-input type="email" placeholder="enter your email"></core-input>
///
///     <core-input type="number" min="5" placeholder="enter a number greater than or equal to 5"></core-input>
///
///     <core-input pattern=".*abc.*" placeholder="enter something containing 'abc'"></core-input>
///
/// See https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation
/// for more info on validation.
class CoreInput extends HtmlElement with DomProxyMixin {
  CoreInput.created() : super.created();

  /// Placeholder text that hints to the user what can be entered in
  /// the input.
  String get placeholder => jsElement['placeholder'];
  set placeholder(String value) { jsElement['placeholder'] = value; }

  /// If true, this input cannot be focused and the user cannot change
  /// its value.
  bool get disabled => jsElement['disabled'];
  set disabled(bool value) { jsElement['disabled'] = value; }

  /// If true, the user cannot modify the value of the input.
  bool get readonly => jsElement['readonly'];
  set readonly(bool value) { jsElement['readonly'] = value; }

  /// If true, this input will automatically gain focus on page load.
  bool get autofocus => jsElement['autofocus'];
  set autofocus(bool value) { jsElement['autofocus'] = value; }

  /// If true, this input accepts multi-line input like a `<textarea>`
  bool get multiline => jsElement['multiline'];
  set multiline(bool value) { jsElement['multiline'] = value; }

  /// (multiline only) The height of this text input in rows. The input
  /// will scroll internally if more input is entered beyond the size
  /// of the component. This property is meaningless if multiline is
  /// false. You can also set this property to "fit" and size the
  /// component with CSS to make the input fit the CSS size.
  get rows => jsElement['rows'];
  set rows(value) { jsElement['rows'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The current value of this input. Changing inputValue programmatically
  /// will cause value to be out of sync. Instead, change value directly
  /// or call commit() after changing inputValue.
  String get inputValue => jsElement['inputValue'];
  set inputValue(String value) { jsElement['inputValue'] = value; }

  /// The value of the input committed by the user, either by changing the
  /// inputValue and blurring the input, or by hitting the `enter` key.
  String get value => jsElement['value'];
  set value(String value) { jsElement['value'] = value; }

  /// Set the input type. Not supported for `multiline`.
  String get type => jsElement['type'];
  set type(String value) { jsElement['type'] = value; }

  /// If true, the input is invalid if its value is null.
  bool get required => jsElement['required'];
  set required(bool value) { jsElement['required'] = value; }

  /// A regular expression to validate the input value against. See
  /// https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation#Validation-related_attributes
  /// for more info. Not supported if `multiline` is true.
  String get pattern => jsElement['pattern'];
  set pattern(String value) { jsElement['pattern'] = value; }

  /// If set, the input is invalid if the value is less than this property. See
  /// https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation#Validation-related_attributes
  /// for more info. Not supported if `multiline` is true.
  get min => jsElement['min'];
  set min(value) { jsElement['min'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If set, the input is invalid if the value is greater than this property. See
  /// https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation#Validation-related_attributes
  /// for more info. Not supported if `multiline` is true.
  get max => jsElement['max'];
  set max(value) { jsElement['max'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If set, the input is invalid if the value is not `min` plus an integral multiple
  /// of this property. See
  /// https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation#Validation-related_attributes
  /// for more info. Not supported if `multiline` is true.
  get step => jsElement['step'];
  set step(value) { jsElement['step'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The maximum length of the input value.
  num get maxlength => jsElement['maxlength'];
  set maxlength(num value) { jsElement['maxlength'] = value; }

  /// If this property is true, the text input's inputValue failed validation.
  bool get invalid => jsElement['invalid'];
  set invalid(bool value) { jsElement['invalid'] = value; }

  get willValidate => jsElement['willValidate'];

  get validity => jsElement['validity'];

  get validationMessage => jsElement['validationMessage'];

  /// Commits the inputValue to value.
  void commit() =>
      jsElement.callMethod('commit', []);
}
@initMethod
upgradeCoreInput() => registerDartType('core-input', CoreInput);
