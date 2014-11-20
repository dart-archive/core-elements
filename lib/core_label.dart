// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_label`.
library core_elements.core_label;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// `<core-label>` provides a version of the `<label>` element that works with Custom Elements as well as native elements.
///
/// All text in the `core-label` will be applied to the target element as a screen-reader accessible description.
///
/// There are two ways to use `core-label` to target an element:
///
/// 1. place an element inside core-label with the `for` attribute:
///
///         <core-label>
///           Context for the Button
///           <paper-button for>button</paper-button>
///         </core-label>
///
/// 2. Set the `for` attribute on the `core-label` element to point to a target element in the same scope with a query
/// string:
///
///         <core-label for=".foo">
///           Context for the button witht the "foo" class"
///         </core-label>
///         <paper-button class="foo">Far away button</paper-button>
///
/// All taps on the `core-label` will be forwarded to the "target" element.
class CoreLabel extends HtmlElement with DomProxyMixin {
  CoreLabel.created() : super.created();
  factory CoreLabel() => new Element.tag('core-label');

  /// A query selector string for a "target" element not nested in the `<core-label>`
  String get htmlFor => jsElement['for'];
  set htmlFor(String value) { jsElement['for'] = value; }
}
@initMethod
upgradeCoreLabel() => registerDartType('core-label', CoreLabel);
