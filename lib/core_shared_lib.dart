// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_shared_lib`.
library core_elements.core_shared_lib;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// Supports sharing a JSONP-based JavaScript library.
///
///     <core-shared-lib on-core-shared-lib-load="{{load}}" url="https://apis.google.com/js/plusone.js?onload=%%callback%%">
///
/// Multiple components can request a library using a `core-shared-lib` component and only one copy of that library will
/// loaded from the network.
///
/// Currently, the library must support JSONP to work as a shared-lib.
///
/// Some libraries require a specific global function be defined. If this is the case, specify the `callbackName` property.
///
/// Where possible, you should use an HTML Import to load library dependencies. Rather than using this element,
/// create an import (`<link rel="import" href="lib.html">`) that wraps loading the .js file:
///
/// lib.html:
///
///     <script src="lib.js"></script>
class CoreSharedLib extends HtmlElement with DomProxyMixin {
  CoreSharedLib.created() : super.created();

  get url => jsElement['url'];
  set url(value) { jsElement['url'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get notifyEvent => jsElement['notifyEvent'];
  set notifyEvent(value) { jsElement['notifyEvent'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get callbackName => jsElement['callbackName'];
  set callbackName(value) { jsElement['callbackName'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreSharedLib() => registerDartType('core-shared-lib', CoreSharedLib);
