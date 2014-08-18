// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_selector`.
library core_elements.core_selector;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `<core-selector>` is used to manage a list of elements that can be selected.
///
/// The attribute `selected` indicates which item element is being selected.
/// The attribute `multi` indicates if multiple items can be selected at once.
/// Tapping on the item element would fire `core-activate` event. Use
/// `core-select` event to listen for selection changes.
///
/// Example:
///
///     <core-selector selected="0">
///       <div>Item 1</div>
///       <div>Item 2</div>
///       <div>Item 3</div>
///     </core-selector>
///
/// `<core-selector>` is not styled. Use the `core-selected` CSS class to style the selected element.
///
///     <style>
///       .item.core-selected {
///         background: #eee;
///       }
///     </style>
///     ...
///     <core-selector>
///       <div class="item">Item 1</div>
///       <div class="item">Item 2</div>
///       <div class="item">Item 3</div>
///     </core-selector>
class CoreSelector extends HtmlElement with DomProxyMixin {
  CoreSelector.created() : super.created();

  /// Gets or sets the selected element.  Default to use the index
  /// of the item element.
  ///
  /// If you want a specific attribute value of the element to be
  /// used instead of index, set "valueattr" to that attribute name.
  ///
  /// Example:
  ///
  ///     <core-selector valueattr="label" selected="foo">
  ///       <div label="foo"></div>
  ///       <div label="bar"></div>
  ///       <div label="zot"></div>
  ///     </core-selector>
  ///
  /// In multi-selection this should be an array of values.
  ///
  /// Example:
  ///
  ///     <core-selector id="selector" valueattr="label" multi>
  ///       <div label="foo"></div>
  ///       <div label="bar"></div>
  ///       <div label="zot"></div>
  ///     </core-selector>
  ///
  ///     this.$.selector.selected = ['foo', 'zot'];
  get selected => jsElement['selected'];
  set selected(value) { jsElement['selected'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// If true, multiple selections are allowed.
  bool get multi => jsElement['multi'];
  set multi(bool value) { jsElement['multi'] = value; }

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

  /// Returns the currently selected element. In multi-selection this returns
  /// an array of selected elements.
  get selectedItem => jsElement['selectedItem'];
  set selectedItem(value) { jsElement['selectedItem'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the model associated with the
  /// selected element.
  get selectedModel => jsElement['selectedModel'];
  set selectedModel(value) { jsElement['selectedModel'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// In single selection, this returns the selected index.
  num get selectedIndex => jsElement['selectedIndex'];
  set selectedIndex(num value) { jsElement['selectedIndex'] = value; }

  /// Set this to true to disallow changing the selection via the
  /// `activateEvent`.
  bool get notap => jsElement['notap'];
  set notap(bool value) { jsElement['notap'] = value; }

  /// The target element that contains items.  If this is not set
  /// core-selector is the container.
  get target => jsElement['target'];
  set target(value) { jsElement['target'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// This can be used to query nodes from the target node to be used for
  /// selection items.  Note this only works if the 'target' property is set.
  ///
  /// Example:
  ///
  ///     <core-selector target="{{$.myForm}}" itemsSelector="input[type=radio]"></core-selector>
  ///     <form id="myForm">
  ///       <label><input type="radio" name="color" value="red"> Red</label> <br>
  ///       <label><input type="radio" name="color" value="green"> Green</label> <br>
  ///       <label><input type="radio" name="color" value="blue"> Blue</label> <br>
  ///       <p>color = {{color}}</p>
  ///     </form>
  String get itemsSelector => jsElement['itemsSelector'];
  set itemsSelector(String value) { jsElement['itemsSelector'] = value; }

  /// The event that would be fired from the item element to indicate
  /// it is being selected.
  String get activateEvent => jsElement['activateEvent'];
  set activateEvent(String value) { jsElement['activateEvent'] = value; }

  get items => jsElement['items'];

  get selection => jsElement['selection'];
}
@initMethod
upgradeCoreSelector() => registerDartType('core-selector', CoreSelector);
