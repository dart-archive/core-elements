// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_header_panel`.
library core_elements.core_header_panel;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-header-panel` contains a header section and a content panel section.
///
/// __Important:__ The `core-header-panel` will not display if its parent does not have a height.
///
/// Using [layout attributes](http://www.polymer-project.org/docs/polymer/layout-attrs.html), you can easily make the `core-header-panel` fill the screen
///
///     <body fullbleed layout vertical>
///       <core-header-panel flex>
///         <core-toolbar>
///           <div>Hello World!</div>
///         </core-toolbar>
///       </core-header-panel>
///     </body>
///
/// or, if you would prefer to do it in CSS, just give `html`, `body`, and `core-header-panel` a height of 100%:
///
///     html, body {
///       height: 100%;
///       margin: 0;
///     }
///     core-header-panel {
///       height: 100%;
///     }
///
/// Special support is provided for scrolling modes when one uses a core-toolbar or equivalent
/// for the header section.
///
/// Example:
///
///     <core-header-panel>
///       <core-toolbar>Header</core-toolbar>
///       <div>Content goes here...</div>
///     </core-header-panel>
///
/// If you want to use other than `core-toolbar` for the header, add
/// `core-header` class to that element.
///
/// Example:
///
///     <core-header-panel>
///       <div class="core-header">Header</div>
///       <div>Content goes here...</div>
///     </core-header-panel>
///
/// To have the content fits to the main area, use `fit` attribute.
///
///     <core-header-panel>
///       <div class="core-header">standard</div>
///       <div class="content" fit>content fits 100% below the header</div>
///     </core-header-panel>
///
/// Use `mode` to control the header and scrolling behavior.
class CoreHeaderPanel extends HtmlElement with DomProxyMixin {
  CoreHeaderPanel.created() : super.created();
  factory CoreHeaderPanel() => document.createElement('core-header-panel');

  /// Controls header and scrolling behavior. Options are
  /// `standard`, `seamed`, `waterfall`, `waterfall-tall`,
  /// `waterfall-medium-tall`, `scroll` and `cover`.
  /// Default is `standard`.
  ///
  /// `standard`: The header is a step above the panel. The header will consume the
  /// panel at the point of entry, preventing it from passing through to the
  /// opposite side.
  ///
  /// `seamed`: The header is presented as seamed with the panel.
  ///
  /// `waterfall`: Similar to standard mode, but header is initially presented as
  /// seamed with panel, but then separates to form the step.
  ///
  /// `waterfall-tall`: The header is initially taller (`tall` class is added to
  /// the header).  As the user scrolls, the header separates (forming an edge)
  /// while condensing (`tall` class is removed from the header).
  ///
  /// `scroll`: The header keeps its seam with the panel, and is pushed off screen.
  ///
  /// `cover`: The panel covers the whole `core-header-panel` including the
  /// header. This allows user to style the panel in such a way that the panel is
  /// partially covering the header.
  ///
  ///     <style>
  ///       core-header-panel[mode=cover]::shadow #mainContainer {
  ///         left: 80px;
  ///       }
  ///       .content {
  ///         margin: 60px 60px 60px 0;
  ///       }
  ///     </style>
  ///
  ///     <core-header-panel mode="cover">
  ///       <core-appbar class="tall">
  ///         <core-icon-button icon="menu"></core-icon-button>
  ///       </core-appbar>
  ///       <div class="content"></div>
  ///     </core-header-panel>
  String get mode => jsElement['mode'];
  set mode(String value) { jsElement['mode'] = value; }

  /// The class used in waterfall-tall mode.  Change this if the header
  /// accepts a different class for toggling height, e.g. "medium-tall"
  String get tallClass => jsElement['tallClass'];
  set tallClass(String value) { jsElement['tallClass'] = value; }

  /// If true, the drop-shadow is always shown no matter what mode is set to.
  bool get shadow => jsElement['shadow'];
  set shadow(bool value) { jsElement['shadow'] = value; }

  /// Returns the scrollable element.
  get scroller => jsElement['scroller'];

  get header => jsElement['header'];
}
@initMethod
upgradeCoreHeaderPanel() => registerDartType('core-header-panel', CoreHeaderPanel);
