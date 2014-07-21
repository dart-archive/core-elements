// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_signals`.
library core_elements.core_signals;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-signals` provides basic publish-subscribe functionality.
///
/// Note: avoid using `core-signals` whenever you can use
/// a controller (parent element) to mediate communication
/// instead.
///
/// To send a signal, fire a custom event of type `core-signal`, with
/// a detail object containing `name` and `data` fields.
///
///     this.fire('core-signal', {name: 'hello', data: null});
///
/// To receive a signal, listen for `core-signal-<name>` event on a
/// `core-signal` element.
///
///   <core-signal on-core-signal-hello="{{helloSignal}}">
///
/// You can fire a signal event from anywhere, and all
/// `core-signal` elements will receive the event, regardless
/// of where they are in DOM.
class CoreSignals extends HtmlElement with DomProxyMixin {
  CoreSignals.created() : super.created();
}
@initMethod
upgradeCoreSignals() => registerDartType('core-signals', CoreSignals);
