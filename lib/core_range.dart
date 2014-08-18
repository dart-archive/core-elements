// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_range`.
library core_elements.core_range;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// The `core-range` element is used for managing a numeric value within a given
/// range.  It has no visual appearance and is typically used in conjunction with
/// another element.
///
/// One can build a progress bar using `core-range` like this:
///
///     <core-range min="0" max="200" value="100" ratio="{{ratio}}"></core-range>
///     <div class="progress-bar" style="width: {{ratio}}%;"></div>
class CoreRange extends HtmlElement with DomProxyMixin {
  CoreRange.created() : super.created();

  /// The number that represents the current value.
  num get value => jsElement['value'];
  set value(num value) { jsElement['value'] = value; }

  /// The number that indicates the minimum value of the range.
  num get min => jsElement['min'];
  set min(num value) { jsElement['min'] = value; }

  /// The number that indicates the maximum value of the range.
  num get max => jsElement['max'];
  set max(num value) { jsElement['max'] = value; }

  /// Specifies the value granularity of the range's value.
  num get step => jsElement['step'];
  set step(num value) { jsElement['step'] = value; }

  /// Returns the ratio of the value.
  num get ratio => jsElement['ratio'];
  set ratio(num value) { jsElement['ratio'] = value; }
}
@initMethod
upgradeCoreRange() => registerDartType('core-range', CoreRange);
