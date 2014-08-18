// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_splitter`.
library core_elements.core_splitter;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-splitter` provides a split bar and dragging on the split bar
/// will resize the sibling element.  Use its `direction` property to indicate
/// which sibling element to be resized and the orientation.  Usually you would want
/// to use `core-splitter` along with flex layout so that the other sibling
/// element can be _flexible_.
///
/// Example:
///
///     <div horizontal layout>
///       <div>left</div>
///       <core-splitter direction="left"></core-splitter>
///       <div flex>right</div>
///     </div>
///
/// In the above example, dragging the splitter will resize the _left_ element.  And
/// since the parent container is a flexbox and the _right_ element has
/// `flex`, the _right_ element will be auto-resized.
///
/// For horizontal splitter set `direction` to "up" or "down".
///
/// Example:
///
///     <div vertical layout>
///       <div>top</div>
///       <core-splitter direction="up"></core-splitter>
///       <div flex>bottom</div>
///     </div>
class CoreSplitter extends HtmlElement with DomProxyMixin {
  CoreSplitter.created() : super.created();

  /// Possible values are "left", "right", "up" and "down".
  String get direction => jsElement['direction'];
  set direction(String value) { jsElement['direction'] = value; }

  /// Locks the split bar so it can't be dragged.
  bool get locked => jsElement['locked'];
  set locked(bool value) { jsElement['locked'] = value; }

  /// Minimum width to which the splitter target can be sized
  num get minSize => jsElement['minSize'];
  set minSize(num value) { jsElement['minSize'] = value; }

  /// By default the parent and siblings of the splitter are set to overflow hidden. This helps
  /// avoid elements bleeding outside the splitter regions. Set this property to true to allow
  /// these elements to overflow.
  bool get allowOverflow => jsElement['allowOverflow'];
  set allowOverflow(bool value) { jsElement['allowOverflow'] = value; }
}
@initMethod
upgradeCoreSplitter() => registerDartType('core-splitter', CoreSplitter);
