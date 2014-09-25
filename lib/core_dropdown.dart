// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_dropdown`.
library core_elements.core_dropdown;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// `core-dropdown` is an element that is initially hidden and is positioned relatively to another
/// element, usually the element that triggers the dropdown. The dropdown and the triggering element
/// should be children of the same offsetParent, e.g. the same `<div>` with `position: relative`.
/// It can be used to implement dropdown menus, menu buttons, etc..
///
/// Example:
///
///     <template is="auto-binding">
///       <div relative>
///         <core-icon-button id="trigger" icon="menu"></core-icon-button>
///         <core-dropdown relatedTarget="{{$.trigger}}">
///           <core-menu>
///             <core-item>Cut</core-item>
///             <core-item>Copy</core-item>
///             <core-item>Paste</core-item>
///           </core-menu>
///         </core-dropdown>
///       </div>
///     </template>
///
/// Positioning
/// -----------
///
/// By default, the dropdown is absolutely positioned on top of the `relatedTarget` with the top and
/// left edges aligned. The `halign` and `valign` properties controls the various alignments. The size
/// of the dropdown is automatically restrained such that it is entirely visible on the screen. Use the
/// `margin`
///
/// If you need more control over the dropdown's position, use CSS. The `halign` and `valign` properties are
/// ignored if the dropdown is positioned with CSS.
///
/// Example:
///
///     <style>
///       /* manually position the dropdown below the trigger */
///       core-dropdown {
///         position: absolute;
///         top: 38px;
///         left: 0;
///       }
///     </style>
///
///     <template is="auto-binding">
///       <div relative>
///         <core-icon-button id="trigger" icon="menu"></core-icon-button>
///         <core-dropdown relatedTarget="{{$.trigger}}">
///           <core-menu>
///             <core-item>Cut</core-item>
///             <core-item>Copy</core-item>
///             <core-item>Paste</core-item>
///           </core-menu>
///         </core-dropdown>
///       </div>
///     </template>
class CoreDropdown extends HtmlElement with DomProxyMixin {
  CoreDropdown.created() : super.created();
  factory CoreDropdown() => new Element.tag('core-dropdown');

  /// The element associated with this dropdown, usually the element that triggers
  /// the menu.
  get relatedTarget => jsElement['relatedTarget'];
  set relatedTarget(value) { jsElement['relatedTarget'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If true, the menu is currently visible.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// The horizontal alignment of the popup relative to `relatedTarget`. `left`
  /// means the left edges are aligned together. `right` means the right edges
  /// are aligned together.
  get halign => jsElement['halign'];
  set halign(value) { jsElement['halign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// The vertical alignment of the popup relative to `relatedTarget`. `top` means
  /// the top edges are aligned together. `bottom` means the bottom edges are
  /// aligned together.
  get valign => jsElement['valign'];
  set valign(value) { jsElement['valign'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// By default an overlay will focus its target or an element inside
  /// it with the `autoFocus` attribute. Disable this
  /// behavior by setting the `autoFocusDisabled` property to true.
  bool get autoFocusDisabled => jsElement['autoFocusDisabled'];
  set autoFocusDisabled(bool value) { jsElement['autoFocusDisabled'] = value; }

  /// The transition property specifies a string which identifies a
  /// <a href="../core-transition/">`core-transition`</a> element that
  /// will be used to help the overlay open and close. The default
  /// `core-transition-fade` will cause the overlay to fade in and out.
  String get transition => jsElement['transition'];
  set transition(String value) { jsElement['transition'] = value; }
}
@initMethod
upgradeCoreDropdown() => registerDartType('core-dropdown', CoreDropdown);
