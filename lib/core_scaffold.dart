// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_scaffold`.
library core_elements.core_scaffold;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-scaffold` provides general application layout, introducing a
/// responsive scaffold containing a header, toolbar, menu, title and
/// areas for application content.
///
/// Example:
///
///     <core-scaffold>
///       <core-header-panel navigation flex mode="seamed">
///         <core-toolbar>Application</core-toolbar>
///         <core-menu theme="core-light-theme">
///           <core-item icon="settings" label="item1"></core-item>
///           <core-item icon="settings" label="item2"></core-item>
///         </core-menu>
///       </core-header-panel>
///       <div tool>Title</div>
///       <div>Content goes here...</div>
///     </core-scaffold>
///
/// Use `mode` to control the header and scrolling behavior of `core-header-panel`
/// and `responsiveWidth` to change the layout of the scaffold.
///
/// To have the content fits to the main area, use `fit` attribute.
///
///     <core-scaffold>
///       <core-header-panel navigation flex mode="seamed">
///         ....
///       </core-header-panel>
///       <div tool>Title</div>
///       <div fit>Content fits to the main area</div>
///     </core-scaffold>
class CoreScaffold extends HtmlElement with DomProxyMixin {
  CoreScaffold.created() : super.created();

  /// When the browser window size is smaller than the `responsiveWidth`,
  /// `core-drawer-panel` changes to a narrow layout. In narrow layout,
  /// the drawer will be stacked on top of the main panel.
  String get responsiveWidth => jsElement['responsiveWidth'];
  set responsiveWidth(String value) { jsElement['responsiveWidth'] = value; }

  /// Used to control the header and scrolling behaviour of `core-header-panel`
  String get mode => jsElement['mode'];
  set mode(String value) { jsElement['mode'] = value; }

  /// Toggle the drawer panel
  void togglePanel() =>
      jsElement.callMethod('togglePanel', []);

  /// Open the drawer panel
  void openDrawer() =>
      jsElement.callMethod('openDrawer', []);

  /// Close the drawer panel
  void closeDrawer() =>
      jsElement.callMethod('closeDrawer', []);
}
@initMethod
upgradeCoreScaffold() => registerDartType('core-scaffold', CoreScaffold);
