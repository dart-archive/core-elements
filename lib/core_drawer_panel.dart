// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_drawer_panel`.
library core_elements.core_drawer_panel;

import 'dart:html';
import 'dart:js' show JsArray, JsObject, JsFunction;
import 'dart:mirrors';
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-drawer-panel` contains a drawer panel and a main panel.  The drawer
/// and the main panel are side-by-side with drawer on the left.  When browser
/// window size is smaller than the `responsiveWidth`, `core-drawer-panel`
/// changes to narrow layout.  In narrow layout, the drawer will be stacked on top
/// of the main panel.  The drawer will be slided in/out to hide/reveal the main
/// panel.
///
/// Use the attribute `drawer` to indicate the element is a drawer panel and
/// `main` to indicate is a main panel.
///
/// Example:
///
///     <core-drawer-panel>
///       <div drawer> Drawer panel... </div>
///       <div main> Main panel... </div>
///     </core-drawer-panel>
///
/// To position the drawer to the right, add `right-drawer` to the class list.
///
///     <core-drawer-panel class="right-drawer">
///       <div drawer> Drawer panel... </div>
///       <div main> Main panel... </div>
///     </core-drawer-panel>
class CoreDrawerPanel extends HtmlElement with DomProxyMixin {
  CoreDrawerPanel.created() : super.created();

  /// Max-width when the panel changes to narrow layout.
  String get responsiveWidth => jsElement['responsiveWidth'];
  set responsiveWidth(String value) { jsElement['responsiveWidth'] = value; }

  /// The panel that is being selected. `drawer` for the drawer panel and
  /// `main` for the main panel.
  String get selected => jsElement['selected'];
  set selected(String value) { jsElement['selected'] = value; }

  /// The panel to be selected when `core-drawer-panel` changes to narrow
  /// layout.
  String get defaultSelected => jsElement['defaultSelected'];
  set defaultSelected(String value) { jsElement['defaultSelected'] = value; }

  /// Returns true if the panel is in narrow layout.  This is useful if you
  /// need to show/hide elements based on the layout.
  bool get narrow => jsElement['narrow'];
  set narrow(bool value) { jsElement['narrow'] = value; }

  noSuchMethod(Invocation invocation) {
    String methodName = MirrorSystem.getName(invocation.memberName);
    if (invocation.isMethod && jsElement[methodName] is JsFunction) {
      print('Warning, passing missing method call ${methodName} to '
            'JS element. This may impact performance, and should be wrapped '
            'explicitely in dart.');
      jsElement.callMethod(
          methodName, invocation.positionalArguments);
    } else {
      super.noSuchMethod(invocation);
    }
  }
}
@initMethod
upgradeCoreDrawerPanel() => registerDartType('core-drawer-panel', CoreDrawerPanel);
