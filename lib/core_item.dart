// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_item`.
library core_elements.core_item;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show PolymerProxyMixin, DomProxyMixin;

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
class CoreItem extends HtmlElement with DomProxyMixin, PolymerProxyMixin {
  CoreItem.created() : super.created();
  factory CoreItem() => new Element.tag('core-item');

  /// Specifies the label for the menu item.
  String get label => jsElement[r'label'];
  set label(String value) { jsElement[r'label'] = value; }

  /// Specifies the icon from the Polymer icon set.
  String get icon => jsElement[r'icon'];
  set icon(String value) { jsElement[r'icon'] = value; }

  /// The URL of an image for the icon.
  String get src => jsElement[r'src'];
  set src(String value) { jsElement[r'src'] = value; }
}
@initMethod
upgradeCoreItem() => registerDartType('core-item', CoreItem);
