// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_menu_button`.
library core_elements.core_menu_button;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// `core-menu-button` is a `core-icon-button` that opens a drop-down menu
/// that allows the user to select an option. You can position the drop-down
/// menu with the `halign` and `valign` properties, or use CSS if more control
/// over positioning is desired.
///
/// Example:
///
///     <core-menu-button id="btn">
///          <core-item icon="settings" label="Settings"></core-item>
///          <core-item icon="dialog" label="Dialog"></core-item>
///          <core-item icon="search" label="Search"></core-item>
///     </core-menu-button>
///
/// Style the drop-down by using the `core-menu-button::shadow #dropdown` selector:
///
///     /* position this drop-down below the button, and style it white on black. */
///     #btn::shadow #dropdown {
///         top: 38px;
///         color: #fff;
///         background: #000;
///     }
class CoreMenuButton extends HtmlElement with DomProxyMixin {
  CoreMenuButton.created() : super.created();
  factory CoreMenuButton() => new Element.tag('core-menu-button');

  /// The icon to display.
  String get icon => jsElement['icon'];
  set icon(String value) { jsElement['icon'] = value; }

  get label => jsElement['label'];
  set label(value) { jsElement['label'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get src => jsElement['src'];
  set src(value) { jsElement['src'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The index of the selected menu item.
  num get selected => jsElement['selected'];
  set selected(num value) { jsElement['selected'] = value; }

  /// Set to true to open the menu.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// Horizontally align the overlay with the button.
  String get halign => jsElement['halign'];
  set halign(String value) { jsElement['halign'] = value; }

  /// Display the overlay on top or below the button.
  String get valign => jsElement['valign'];
  set valign(String value) { jsElement['valign'] = value; }

  /// Specifies the attribute to be used for "selected" attribute.
  String get valueattr => jsElement['valueattr'];
  set valueattr(String value) { jsElement['valueattr'] = value; }

  get multi => jsElement['multi'];
  set multi(value) { jsElement['multi'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Set to true to cause the menu popup to be displayed inline rather
  /// than in its own layer.
  bool get inlineMenu => jsElement['inlineMenu'];
  set inlineMenu(bool value) { jsElement['inlineMenu'] = value; }

  /// If true, the selection will persist when the menu is opened
  /// and closed multiple times.
  bool get stickySelection => jsElement['stickySelection'];
  set stickySelection(bool value) { jsElement['stickySelection'] = value; }

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

  /// Returns the currently selected element. In multi-selection this returns
  /// an array of selected elements.
  /// Note that you should not use this to set the selection. Instead use
  /// `selected`.
  get selectedItem => jsElement['selectedItem'];
  set selectedItem(value) { jsElement['selectedItem'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the model associated with the
  /// selected element.
  /// Note that you should not use this to set the selection. Instead use
  /// `selected`.
  get selectedModel => jsElement['selectedModel'];
  set selectedModel(value) { jsElement['selectedModel'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the selected index.
  /// Note that you should not use this to set the selection. Instead use
  /// `selected`.
  num get selectedIndex => jsElement['selectedIndex'];
  set selectedIndex(num value) { jsElement['selectedIndex'] = value; }

  /// Nodes with local name that are in the list will not be included
  /// in the selection items.
  String get excludedLocalNames => jsElement['excludedLocalNames'];
  set excludedLocalNames(String value) { jsElement['excludedLocalNames'] = value; }

  /// The selected menu item.
  get selection => jsElement['selection'];

  /// Toggle the opened state of the dropdown.
  void toggle() =>
      jsElement.callMethod('toggle', []);
}
@initMethod
upgradeCoreMenuButton() => registerDartType('core-menu-button', CoreMenuButton);
