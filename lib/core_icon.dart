// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_icon`.
library core_elements.core_icon;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// The `core-icon` element displays an icon. By default an icon renders as 24px square.
///
/// Example using src:
///
///     <core-icon src="star.png"></core-icon>
///
/// Example setting size to 32px x 32px:
///
///     <core-icon class="big" src="big_star.png"></core-icon>
///
///     <style>
///       .big {
///         height: 32px;
///         width: 32px;
///       }
///     </style>
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
/// See [core-icons](http://www.polymer-project.org/components/core-icons/demo.html) for the default set of icons. To use the default set of icons you'll need to include an import for `core-icons.html`. To use a different built-in set of icons, you'll need to include an import for `core-icons/iconsets/<iconset>.html`.
class CoreIcon extends HtmlElement with DomProxyMixin {
  CoreIcon.created() : super.created();

  /// The URL of an image for the icon. If the src property is specified,
  /// the icon property should not be.
  String get src => jsElement['src'];
  set src(String value) { jsElement['src'] = value; }

  /// Specifies the icon name or index in the set of icons available in
  /// the icon's icon set. If the icon property is specified,
  /// the src property should not be.
  String get icon => jsElement['icon'];
  set icon(String value) { jsElement['icon'] = value; }

  /// Alternative text content for accessibility support.
  /// If alt is present and not empty, it will set the element's role to img and add an aria-label whose content matches alt.
  /// If alt is present and is an empty string, '', it will hide the element from the accessibility layer
  /// If alt is not present, it will set the element's role to img and the element will fallback to using the icon attribute for its aria-label.
  String get alt => jsElement['alt'];
  set alt(String value) { jsElement['alt'] = value; }
}
@initMethod
upgradeCoreIcon() => registerDartType('core-icon', CoreIcon);
