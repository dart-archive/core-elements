// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_submenu`.
library core_elements.core_submenu;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// Use to create nested menus inside of `core-menu` elements.
///
///     <core-menu selected="0">
///
///       <core-submenu icon="settings" label="Topics">
///         <core-item label="Topic 1"></core-item>
///         <core-item label="Topic 2"></core-item>
///       </core-submenu>
///
///       <core-submenu icon="settings" label="Favorites">
///         <core-item label="Favorite 1"></core-item>
///         <core-item label="Favorite 2"></core-item>
///         <core-item label="Favorite 3"></core-item>
///       </core-submenu>
///
///     </core-menu>
///
/// There is a margin set on the submenu to indent the items.
/// You can override the margin by doing:
///
///     core-submenu::shadow #submenu {
///       margin-left: 20px;
///     }
class CoreSubmenu extends HtmlElement with DomProxyMixin {
  CoreSubmenu.created() : super.created();

  get selected => jsElement['selected'];
  set selected(value) { jsElement['selected'] = value; }

  get selectedItem => jsElement['selectedItem'];
  set selectedItem(value) { jsElement['selectedItem'] = value; }

  get label => jsElement['label'];
  set label(value) { jsElement['label'] = value; }

  get icon => jsElement['icon'];
  set icon(value) { jsElement['icon'] = value; }

  get src => jsElement['src'];
  set src(value) { jsElement['src'] = value; }
}
@initMethod
upgradeCoreSubmenu() => registerDartType('core-submenu', CoreSubmenu);
