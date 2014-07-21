// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_menu`.
library core_elements.core_menu;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_selector.dart';

/// `core-menu` is a selector which styles to looks like a menu.
///
///     <core-menu selected="0">
///       <core-item icon="settings" label="Settings"></core-item>
///       <core-item icon="dialog" label="Dialog"></core-item>
///       <core-item icon="search" label="Search"></core-item>
///     </core-menu>
///
/// When an item is selected the `core-selected` class is added to it.  The user can
/// use the class to add more stylings to the selected item.
///
///     core-item.core-selected {
///       color: red;
///     }
///
/// The `selectedItem` property references the selected item.
///
///     <core-menu selected="0" selectedItem="{{item}}">
///       <core-item icon="settings" label="Settings"></core-item>
///       <core-item icon="dialog" label="Dialog"></core-item>
///       <core-item icon="search" label="Search"></core-item>
///     </core-menu>
///
///     <div>selected label: {{item.label}}</div>
///
/// The `core-select` event signals selection change.
///
///     <core-menu selected="0" on-core-select="{{selectAction}}">
///       <core-item icon="settings" label="Settings"></core-item>
///       <core-item icon="dialog" label="Dialog"></core-item>
///       <core-item icon="search" label="Search"></core-item>
///     </core-menu>
///
///     ...
///
///     selectAction: function(e, detail) {
///       if (detail.isSelected) {
///         var selectedItem = detail.item;
///         ...
///       }
///     }
class CoreMenu extends CoreSelector {
  CoreMenu.created() : super.created();
}
@initMethod
upgradeCoreMenu() => registerDartType('core-menu', CoreMenu);
