// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_layout_grid`.
library core_elements.core_layout_grid;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// TODO
class CoreLayoutGrid extends HtmlElement with DomProxyMixin {
  CoreLayoutGrid.created() : super.created();
  factory CoreLayoutGrid() => new Element.tag('core-layout-grid');

  get nodes => jsElement['nodes'];
  set nodes(value) { jsElement['nodes'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get layout => jsElement['layout'];
  set layout(value) { jsElement['layout'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get auto => jsElement['auto'];
  set auto(value) { jsElement['auto'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreLayoutGrid() => registerDartType('core-layout-grid', CoreLayoutGrid);
