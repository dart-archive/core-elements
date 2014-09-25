// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_dropdown_menu`.
library core_elements.core_dropdown_menu;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// `core-dropdown-menu` is a control where the user can choose from an array of options in a drop-down
/// menu. The currently selected option is displayed in the control.
///
/// Example:
///
///     <core-dropdown-menu selected="Financier" valueattr="label">
///         <core-item label="Croissant"></core-item>
///         <core-item label="Donut"></core-item>
///         <core-item label="Financier"></core-item>
///         <core-item label="Madeleine"></core-item>
///     </core-dropdown-menu>
///
/// This example renders a drop-down menu with 4 options, with the option `Financier` pre-selected.
///
/// Theming
/// -------
///
/// Style the drop-down menu with the `core-dropdown-menu::shadow #dropdown` selector.
///
/// Example:
///
///     core-dropdown-menu::shadow #dropdown {
///         border: 1px solid #ccc;
///         max-height: 12px;
///     }
///
/// To modify the drop-down's margins, use the same selector. The default margin is 12px.
///
///     core-dropdown-menu::shadow #dropdown {
///         margin: 24px;
///     }
class CoreDropdownMenu extends HtmlElement with DomProxyMixin {
  CoreDropdownMenu.created() : super.created();
  factory CoreDropdownMenu() => new Element.tag('core-dropdown-menu');

  /// True if the menu is open.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// A label for the control. The label is displayed if no item is selected.
  String get label => jsElement['label'];
  set label(String value) { jsElement['label'] = value; }

  /// The currently selected element. By default this is the index of the item element.
  /// If you want a specific attribute value of the element to be used instead of the
  /// index, set `valueattr` to that attribute name.
  get selected => jsElement['selected'];
  set selected(value) { jsElement['selected'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Specifies the attribute to be used for "selected" attribute.
  String get valueattr => jsElement['valueattr'];
  set valueattr(String value) { jsElement['valueattr'] = value; }

  /// Specifies the CSS class to be used to add to the selected element.
  String get selectedClass => jsElement['selectedClass'];
  set selectedClass(String value) { jsElement['selectedClass'] = value; }

  /// Specifies the property to be used to set on the selected element
  /// to indicate its active state.
  String get selectedProperty => jsElement['selectedProperty'];
  set selectedProperty(String value) { jsElement['selectedProperty'] = value; }

  /// Specifies the attribute to set on the selected element to indicate
  /// its active state.
  String get selectedAttribute => jsElement['selectedAttribute'];
  set selectedAttribute(String value) { jsElement['selectedAttribute'] = value; }

  /// The currently selected element.
  get selectedItem => jsElement['selectedItem'];
  set selectedItem(value) { jsElement['selectedItem'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Horizontally align the overlay with the control.
  get halign => jsElement['halign'];
  set halign(value) { jsElement['halign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Vertically align the dropdown menu with the control.
  get valign => jsElement['valign'];
  set valign(value) { jsElement['valign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreDropdownMenu() => registerDartType('core-dropdown-menu', CoreDropdownMenu);
