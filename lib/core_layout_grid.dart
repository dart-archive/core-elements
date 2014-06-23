// DO NOT EDIT: auto-generated with core_elements/tool/generate_dart_api.dart

/// Dart API for the polymer element `core_layout_grid`.
library core_elements.core_layout_grid;

import 'dart:html';
import 'dart:js' show JsArray;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// TODO
class CoreLayoutGrid extends HtmlElement with DomProxyMixin {
  CoreLayoutGrid.created() : super.created();

  get nodes => jsElement['nodes'];
  set nodes(value) { jsElement['nodes'] = value; }

  get layout => jsElement['layout'];
  set layout(value) { jsElement['layout'] = value; }

  get auto => jsElement['auto'];
  set auto(value) { jsElement['auto'] = value; }
}
@initMethod
upgradeCoreLayoutGrid() => registerDartType('core-layout-grid', CoreLayoutGrid);
