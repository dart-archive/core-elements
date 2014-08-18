// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_collapse`.
library core_elements.core_collapse;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-collapse` creates a collapsible block of content.  By default, the content
/// will be collapsed.  Use `opened` to show/hide the content.
///
///     <button on-click="{{toggle}}">toggle collapse</button>
///
///     <core-collapse id="collapse">
///       ...
///     </core-collapse>
///
///     ...
///
///     toggle: function() {
///       this.$.collapse.toggle();
///     }
class CoreCollapse extends HtmlElement with DomProxyMixin {
  CoreCollapse.created() : super.created();

  /// The target element.
  get target => jsElement['target'];
  set target(value) { jsElement['target'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If true, the orientation is horizontal; otherwise is vertical.
  bool get horizontal => jsElement['horizontal'];
  set horizontal(bool value) { jsElement['horizontal'] = value; }

  /// Set opened to true to show the collapse element and to false to hide it.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// Collapsing/expanding animation duration in second.
  num get duration => jsElement['duration'];
  set duration(num value) { jsElement['duration'] = value; }

  /// If true, the size of the target element is fixed and is set
  /// on the element.  Otherwise it will try to
  /// use auto to determine the natural size to use
  /// for collapsing/expanding.
  bool get fixedSize => jsElement['fixedSize'];
  set fixedSize(bool value) { jsElement['fixedSize'] = value; }

  /// Toggle the opened state.
  void toggle() =>
      jsElement.callMethod('toggle', []);
}
@initMethod
upgradeCoreCollapse() => registerDartType('core-collapse', CoreCollapse);
