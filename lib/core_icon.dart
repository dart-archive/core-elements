// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_icon`.
library core_elements.core_icon;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// The `core-icon` element displays an icon using CSS background image. By default an icon renders as 24px square.
///
/// Example using src:
///
///     <core-icon src="star.png"></core-icon>
///
/// Example setting size to 32px x 32px:
///
///     <core-icon src="big_star.png" size="32"></core-icon>
///
/// Example using icon from default iconset:
///
///     <core-icon icon="menu"></core-icon>
///
/// Example using icon `cherry` from custom iconset `fruit`:
///
///     <core-icon icon="fruit:cherry"></core-icon>
///
/// See [core-iconset](#core-iconset) and [core-iconset-svg](#core-iconset-svg) for more information about
/// how to use a custom iconset.
///
/// See [core-icons](#core-icons) for the default set of icons. To use the default set of icons you'll need to include an import for `core-icons.html`.
class CoreIcon extends HtmlElement with DomProxyMixin {
  CoreIcon.created() : super.created();

  /// The URL of an image for the icon. If the src property is specified,
  /// the icon property should not be.
  String get src => jsElement['src'];
  set src(String value) { jsElement['src'] = value; }

  /// Specifies the size of the icon in pixel units.
  String get size => jsElement['size'];
  set size(String value) { jsElement['size'] = value; }

  /// Specifies the icon name or index in the set of icons available in
  /// the icon's icon set. If the icon property is specified,
  /// the src property should not be.
  String get icon => jsElement['icon'];
  set icon(String value) { jsElement['icon'] = value; }
}
@initMethod
upgradeCoreIcon() => registerDartType('core-icon', CoreIcon);
