// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_menu_button`.
library core_elements.core_menu_button;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// core-menu-button is a core-icon-button with a drop down menu
/// that allows the user to select an option. The drop down menu is styled with
/// an arrow pointing to the button, and can be positioned to the top or the
/// bottom of the button with the valign property. The valign property aligns
/// the menu to the left or right edge of the button.
///
/// Example:
///
///     <core-menu-button selected="0">
///       <core-item icon="settings" label="Settings"></core-item>
///       <core-item icon="dialog" label="Dialog"></core-item>
///       <core-item icon="search" label="Search"></core-item>
///     </core-menu-button>
class CoreMenuButton extends HtmlElement with DomProxyMixin {
  CoreMenuButton.created() : super.created();

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

  /// Horizontally align the overlay with the button. Accepted values are
  /// ["left", "center", "right"].
  String get halign => jsElement['halign'];
  set halign(String value) { jsElement['halign'] = value; }

  /// Display the overlay on top or below the button. Accepted values are
  /// ["top", "bottom"].
  String get valign => jsElement['valign'];
  set valign(String value) { jsElement['valign'] = value; }

  get valueattr => jsElement['valueattr'];
  set valueattr(value) { jsElement['valueattr'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get multi => jsElement['multi'];
  set multi(value) { jsElement['multi'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Set to true to cause the menu popup to be displayed inline rather
  /// than in its own layer.
  bool get inlineMenu => jsElement['inlineMenu'];
  set inlineMenu(bool value) { jsElement['inlineMenu'] = value; }

  /// The selected menu item.
  get selection => jsElement['selection'];

  /// Toggle the opened state of the dropdown.
  void toggle() =>
      jsElement.callMethod('toggle', []);
}
@initMethod
upgradeCoreMenuButton() => registerDartType('core-menu-button', CoreMenuButton);
