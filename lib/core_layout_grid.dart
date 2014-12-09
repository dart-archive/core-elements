// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_layout_grid`.
library core_elements.core_layout_grid;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show PolymerProxyMixin, DomProxyMixin;

/// TODO
class CoreLayoutGrid extends HtmlElement with DomProxyMixin, PolymerProxyMixin {
  CoreLayoutGrid.created() : super.created();
  factory CoreLayoutGrid() => new Element.tag('core-layout-grid');

  get nodes => jsElement[r'nodes'];
  set nodes(value) { jsElement[r'nodes'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get layout => jsElement[r'layout'];
  set layout(value) { jsElement[r'layout'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  get auto => jsElement[r'auto'];
  set auto(value) { jsElement[r'auto'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreLayoutGrid() => registerDartType('core-layout-grid', CoreLayoutGrid);
