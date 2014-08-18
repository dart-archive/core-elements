// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_item`.
library core_elements.core_item;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-item` is a simple line-item object: a label and/or an icon that can also
/// act as a link.
///
/// Example:
///
///     <core-item icon="settings" label="Settings"></core-item>
///
/// To use as a link, put &lt;a&gt; element in the item.
///
/// Example:
///
///     <core-item icon="settings" label="Settings">
///       <a href="#settings" target="_self"></a>
///     </core-item>
class CoreItem extends HtmlElement with DomProxyMixin {
  CoreItem.created() : super.created();

  /// Specifies the label for the menu item.
  String get label => jsElement['label'];
  set label(String value) { jsElement['label'] = value; }

  /// Specifies the icon from the Polymer icon set.
  String get icon => jsElement['icon'];
  set icon(String value) { jsElement['icon'] = value; }

  /// The URL of an image for the icon.
  String get src => jsElement['src'];
  set src(String value) { jsElement['src'] = value; }
}
@initMethod
upgradeCoreItem() => registerDartType('core-item', CoreItem);
