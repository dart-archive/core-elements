// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_media_query`.
library core_elements.core_media_query;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// core-media-query can be used to data bind to a CSS media query.
/// The "query" property is a bare CSS media query.
/// The "queryMatches" property will be a boolean representing if the page matches that media query.
///
/// core-media-query uses media query listeners to dynamically update the "queryMatches" property.
/// A "core-media-change" event also fires when queryMatches changes.
///
/// Example:
///
///      <core-media-query query="max-width: 640px" queryMatches="{{phoneScreen}}"></core-media-query>
///
///
///
/// Fired when the media query state changes
class CoreMediaQuery extends HtmlElement with DomProxyMixin {
  CoreMediaQuery.created() : super.created();

  /// The CSS media query to evaulate
  String get mediaQuery => jsElement['query'];
  set mediaQuery(String value) { jsElement['query'] = value; }

  /// The Boolean return value of the media query
  bool get queryMatches => jsElement['queryMatches'];
  set queryMatches(bool value) { jsElement['queryMatches'] = value; }
}
@initMethod
upgradeCoreMediaQuery() => registerDartType('core-media-query', CoreMediaQuery);
