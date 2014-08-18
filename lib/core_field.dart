// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_field`.
library core_elements.core_field;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// The `core-field` supplies a horizontal layout, anticipating an input.
///
/// Example:
///
///     <core-field>
///       <core-icon icon="menu"></core-icon>
///       <label>I'm a label!</label>
///       <input placeholder="I have a label" flex>
///     </core-field>
class CoreField extends HtmlElement with DomProxyMixin {
  CoreField.created() : super.created();
}
@initMethod
upgradeCoreField() => registerDartType('core-field', CoreField);
