// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_dropdown_menu`.
library core_elements.core_dropdown_menu;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_dropdown_base.dart';

/// `core-dropdown-menu` works together with `core-dropdown` and `core-selector` to
/// implement a drop-down menu. The currently selected item is displayed in the
/// control. If no item is selected, the `label` is displayed instead.
///
/// The child element with the class `dropdown` will be used as the drop-down
/// menu. It should be a `core-dropdown` or other overlay element. You should
/// also provide a `core-selector` or other selector element, such as `core-menu`,
/// in the drop-down.
///
/// Example:
///
///     <core-dropdown-menu label="Choose a pastry">
///         <core-dropdown class="dropdown">
///             <core-selector>
///               <core-item label="Croissant"></core-item>
///               <core-item label="Donut"></core-item>
///               <core-item label="Financier"></core-item>
///               <core-item label="Madeleine"></core-item>
///             </core-selector>
///         </core-dropdown>
///     </core-dropdown-menu>
class CoreDropdownMenu extends CoreDropdownBase {
  CoreDropdownMenu.created() : super.created();
  factory CoreDropdownMenu() => new Element.tag('core-dropdown-menu');

  /// A label for the control. The label is displayed if no item is selected.
  String get label => jsElement['label'];
  set label(String value) { jsElement['label'] = value; }

  /// The icon to display when the drop-down is opened.
  String get openedIcon => jsElement['openedIcon'];
  set openedIcon(String value) { jsElement['openedIcon'] = value; }

  /// The icon to display when the drop-down is closed.
  String get closedIcon => jsElement['closedIcon'];
  set closedIcon(String value) { jsElement['closedIcon'] = value; }
}
@initMethod
upgradeCoreDropdownMenu() => registerDartType('core-dropdown-menu', CoreDropdownMenu);
