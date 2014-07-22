// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_icon_button`.
library core_elements.core_icon_button;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-icon-button` is an icon with button behaviors.
///
///     <core-icon-button src="star.png"></core-icon-button>
///
/// `core-icon-button` includes a default icon set.  Use `icon` to specify
/// which icon from the icon set to use.
///
///     <core-icon-button icon="menu"></core-icon-button>
///
/// See [`core-iconset`](#core-iconset) for more information about
/// how to use a custom icon set.
class CoreIconButton extends HtmlElement with DomProxyMixin {
  CoreIconButton.created() : super.created();

  /// The URL of an image for the icon.  Should not use `icon` property
  /// if you are using this property.
  String get src => jsElement['src'];
  set src(String value) { jsElement['src'] = value; }

  /// Specifies the icon name or index in the set of icons available in
  /// the icon set.  Should not use `src` property if you are using this
  /// property.
  String get icon => jsElement['icon'];
  set icon(String value) { jsElement['icon'] = value; }

  /// If true, border is placed around the button to indicate it's
  /// active state.
  bool get active => jsElement['active'];
  set active(bool value) { jsElement['active'] = value; }
}
@initMethod
upgradeCoreIconButton() => registerDartType('core-icon-button', CoreIconButton);
