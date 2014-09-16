// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_popup_menu`.
library core_elements.core_popup_menu;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-popup-menu` is a popup menu that can be positioned relative to another
/// element, usually the element that opens or closes the menu. It can be used
/// to implement drop-downs, menu buttons, etc..
///
/// Example:
///
///     <template is="auto-binding">
///         <div id="control">Your favorite pastry:</div>
///         <core-popup-menu relatedTarget="{{$.control}}" on-core-select="{{selectAction}}">
///           <core-item label="Churro"></core-item>
///           <core-item label="Donut"></core-item>
///           <core-item label="Macaron"></core-item>
///         </core-popup-menu>
///     </template>
class CorePopupMenu extends HtmlElement with DomProxyMixin {
  CorePopupMenu.created() : super.created();
  factory CorePopupMenu() => document.createElement('core-popup-menu');

  /// The element associated with this menu, usually the element that
  /// causes the menu the open.
  get relatedTarget => jsElement['relatedTarget'];
  set relatedTarget(value) { jsElement['relatedTarget'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If true, the menu is currently visible.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// The horizontal alignment of the pulldown menu relative to the button.
  get halign => jsElement['halign'];
  set halign(value) { jsElement['halign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The vertical alignment of the pulldown menu relative to the button.
  get valign => jsElement['valign'];
  set valign(value) { jsElement['valign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The transition property specifies a string which identifies a
  /// <a href="../core-transition/">`core-transition`</a> element that
  /// will be used to help the overlay open and close. The default
  /// `core-transition-fade` will cause the overlay to fade in and out.
  String get transition => jsElement['transition'];
  set transition(String value) { jsElement['transition'] = value; }

  /// Gets or sets the selected element.  Default to use the index
  /// of the item element.
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

  /// Returns the currently selected element.
  get selectedItem => jsElement['selectedItem'];
  set selectedItem(value) { jsElement['selectedItem'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the model associated with the
  /// selected element.
  get selectedModel => jsElement['selectedModel'];
  set selectedModel(value) { jsElement['selectedModel'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the selected index.
  num get selectedIndex => jsElement['selectedIndex'];
  set selectedIndex(num value) { jsElement['selectedIndex'] = value; }
}
@initMethod
upgradeCorePopupMenu() => registerDartType('core-popup-menu', CorePopupMenu);
