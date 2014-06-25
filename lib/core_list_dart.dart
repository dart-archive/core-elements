/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.core_list_dart;

import 'dart:html';
import 'dart:math' as math;
import 'package:core_elements/core_selection.dart';
import 'package:polymer/polymer.dart';
import 'package:smoke/smoke.dart' as smoke;
import 'package:template_binding/template_binding.dart';

@CustomTag('core-list-dart')
class CoreList extends PolymerElement {
  /**
   * Fired when an item element is tapped.
   *
   * @event core-activate
   * @param {Object} detail
   *   @param {Object} detail.item the item element
   */

  /**
   *
   * An array of source data for the list to display.
   *
   * @attribute data
   * @type array
   * @default null
   */
  @published ObservableList data;

  /**
   *
   * An optional element on which to listen for scroll events.
   *
   * @attribute scrollTarget
   * @type Element
   * @default core-list-dart
   */
  @published Element scrollTarget;

  /**
   *
   * The height of a list item. `core-list-dart` currently supports only
   * fixed-height list items. This height must be specified via the height 
   * property.
   *
   * @attribute height
   * @type number
   * @default 80
   */
  @published double height = 80.0;

  /**
   *
   * The number of extra items rendered above the minimum set required to
   * fill the list's height.
   *
   * @attribute extraItems
   * @type number
   * @default 30
   */
  @published int extraItems = 30;

  /**
   *
   * The property set on the list view data to represent selection state.
   * This should set so that it does not conflict with other data properties.
   * Note, selection data is not stored on the data in given in the data 
   * property.
   *
   * @attribute selectedProperty
   * @type string
   * @default null
   */
  @published String selectedProperty = 'selected';

  // TODO(sorvell): experimental
  /**
   *
   * If true, data is sync'd from the list back to the list's data.
   *
   * @attribute sync
   * @type boolean
   * @default false
   */
  @published bool sync = false;

  /**
   *
   * Set to true to support multiple selection.
   *
   * @attribute multi
   * @type boolean
   * @default false
   */
  @published bool multi = false;

  @observable var selected;

  var _target;
  int _visibleCount;
  int _physicalCount;
  double _physicalHeight;
  double _scrollTop = 0.0;

  ObservableList<_ListModel> _physicalData;
  var _physicalItems;

  Expando _selectedData;

  int firstPhysicalIndex;
  int baseVirtualIndex;

  Element template;

  CoreSelection get _selection => $['selection'];

  CoreList.created() : super.created();

  @override
  ready() {
    this.clearSelection();
  }

  @override
  attached() {
    this.template = this.querySelector('template');
  }


  // TODO(sorvell): it'd be nice to dispense with 'data' and just use
  // template repeat's model. However, we need tighter integration
  // with TemplateBinding for this.
  @ObserveProperty('data template scrollTarget')
  initialize() {
    if (this.data == null || this.template == null) {
      return;
    }
    var target = scrollTarget != null ? scrollTarget : this;
    if (_target != target) {
      if (_target != null) {
        _target.removeEventListener('scroll', scrollHandler, false);
      }
      _target = target;
      _target.addEventListener('scroll', scrollHandler, false);
    }

    this.initializeViewport();
    this.initalizeData();
    this.onMutation(this).then((_) => initializeItems());
  }

  // TODO(sorvell): need to handle resizing
  initializeViewport() {
    $['viewport'].style.height = '${this.height * this.data.length}px';
    _visibleCount = (_target.offsetHeight / this.height).ceil();
    _physicalCount = math.min(_visibleCount + this.extraItems,
        this.data.length);
    _physicalHeight = this.height * _physicalCount;
  }

  // TODO(sorvell): selection currently cannot be maintained when
  // items are added or deleted.
  initalizeData() {
    _physicalData = new ObservableList<_ListModel>(_physicalCount);
    for (var i = 0; i < _physicalCount; ++i) {
      _physicalData[i] = new _ListModel();
      this.updateItem(i, i);
    }
    templateBind(this.template).model = _physicalData;
    this.template.attributes['repeat'] = '';
  }

  initializeItems() {
    _physicalItems = new List(_physicalCount);
    for (var i = 0, item = this.template.nextElementSibling;
         item != null && i < _physicalCount;
         ++i, item = item.nextElementSibling) {
      _physicalItems[i] = item;
      _transformValue[item] = 0;
    }
    this.refresh(false);
  }

  updateItem(virtualIndex, physicalIndex) {
    var virtualDatum = this.data[virtualIndex];
    var physicalDatum = _physicalData[physicalIndex];
    this.pushItemData(virtualDatum, physicalDatum);
    physicalDatum._physicalIndex = physicalIndex;
    physicalDatum._virtualIndex = virtualIndex;
    if (this.selectedProperty != null) {
      physicalDatum._set(this.selectedProperty, _selectedData[virtualDatum]);
    }
  }

  pushItemData(source, _ListModel dest) {
    dest._item = source;
    dest._notifyChanges();
  }

  // experimental: push physical data back to this.data.
  // this is optional when scrolling and needs to be called at other times.
  syncData() {
    if (this.firstPhysicalIndex == null ||
        this.baseVirtualIndex == null) {
      return;
    }
    var p, v;
    for (var i = 0; i < this.firstPhysicalIndex; ++i) {
      p = _physicalData[i];
      v = this.data[this.baseVirtualIndex + _physicalCount + i];
      this.pushItemData(p, v);
    }
    for (var i = this.firstPhysicalIndex; i < _physicalCount; ++i) {
      p = _physicalData[i];
      v = this.data[this.baseVirtualIndex + i];
      this.pushItemData(p, v);
    }
  }

  scrollHandler(e) {
    _scrollTop = (e is CustomEvent && e.detail != null ?
        e.detail.target.scrollTop : e.target.scrollTop).toDouble();
    this.refresh(false);
  }

  /**
   * Refresh the list at the current scroll position.
   *
   * @method refresh
   */
  refresh(bool force) {
    int firstVisibleIndex = (_scrollTop / height).floor();
    num visibleMidpoint = firstVisibleIndex + _visibleCount / 2;

    int firstReifiedIndex = math.max(0, (visibleMidpoint -
        _physicalCount / 2).floor());
    firstReifiedIndex = math.min(firstReifiedIndex, data.length -
        _physicalCount);

    int firstPhysicalIndex = firstReifiedIndex % _physicalCount;
    int baseVirtualIndex = firstReifiedIndex - firstPhysicalIndex;

    int baseTransformValue = (this.height * baseVirtualIndex).floor();
    int nextTransformValue = (baseTransformValue + _physicalHeight).floor();

    var baseTransformString = 'translate3d(0,${baseTransformValue}px,0)';
    var nextTransformString = 'translate3d(0,${nextTransformValue}px,0)';
    // TODO(sorvell): experiemental for sync'ing back to virtual data.
    if (this.sync) {
      this.syncData();
    }
    this.firstPhysicalIndex = firstPhysicalIndex;
    this.baseVirtualIndex = baseVirtualIndex;

    for (var i = 0; i < firstPhysicalIndex; ++i) {
      var item = _physicalItems[i];
      if (force || _transformValue[item] != nextTransformValue) {
        this.updateItem(baseVirtualIndex + _physicalCount + i, i);
        _setTransform(item, nextTransformString, nextTransformValue);
      }
    }
    for (var i = firstPhysicalIndex; i < _physicalCount; ++i) {
      var item = _physicalItems[i];
      if (force || _transformValue[item] != baseTransformValue) {
        this.updateItem(baseVirtualIndex + i, i);
        _setTransform(item, baseTransformString, baseTransformValue);
      }
    }
  }

  // list selection
  tapHandler(e) {
    if (e.target == this) {
      return;
    }
    if (this.sync) {
      this.syncData();
    }
    var n = e.target;
    var instance = nodeBind(n).templateInstance;
    _ListModel model = instance != null ? instance.model.model : null;
    if (model != null) {
      var vi = model._virtualIndex, pi = model._physicalIndex;
      var data = this.data[vi], item = _physicalItems[pi];
      _selection.select(data);
      this.asyncFire('core-activate', detail:
          new CoreActivateEvent(data: data, item: item));
    }
  }

  selectedHandler(e, detail) {
    if (this.selectedProperty != null) {
      var i$ = this.indexesForData(detail['item']);
      // TODO(sorvell): we should be relying on selection to store the
      // selected data but we want to optimize for lookup.
      _selectedData[detail['item']] = detail['isSelected'];

      var physical = i$['physical'];
      if (physical != null && physical >= 0) {
        this.updateItem(i$['virtual'], physical);
      }
    }
  }

  /**
   * Select the list item at the given index.
   *
   * @method selectItem
   * @param {number} index
   */
  selectItem(index) {
    var data = this.data[index];
    if (data != null) {
      _selection.select(data);
    }
  }

  /**
   * Set the selected state of the list item at the given index.
   *
   * @method setItemSelected
   * @param {number} index
   * @param {boolean} isSelected
   */
  setItemSelected(index, isSelected) {
    var data = this.data[index];
    if (data) {
      _setItemSelected(_selection, data, isSelected);
    }
  }

  indexesForData(data) {
    var virtual = this.data.indexOf(data);
    var physical = this.virtualToPhysicalIndex(virtual);
    return { 'virtual': virtual, 'physical': physical };
  }

  virtualToPhysicalIndex(index) {
    for (var i=0, l=_physicalData.length; i<l; i++) {
      if (_physicalData[i]._virtualIndex == index) {
        return i;
      }
    }
    return -1;
  }

  get selection => _selection.getSelection();

  selectedChanged() {
    _selection.select(this.selected);
  }

  clearSelection() {
    _selectedData = new Expando();
    if (this.multi) {
      var s$ = this.selection;
      for (var i=0, l=s$.length, s; (i<l) && (s=s$[i]); i++) {
        _setItemSelected(_selection, s, false);
      }
    } else {
      _setItemSelected(_selection, this.selection, false);
    }
    _selection.jsElement.callMethod('clear');
  }

  scrollToItem(index) {
    this.scrollTop = index * this.height;
  }
}

/// The [CustomEvent.detail] of the [CoreList] `core-activate` event.
class CoreActivateEvent {
  Element item;
  var data;

  CoreActivateEvent({this.data, this.item});
}

// Dart note:
// core-list creates a shallow copy of the object. We do the same via a proxy
// Also we don't observe original because of:
// https://github.com/Polymer/core-list/issues/2
class _ListModel extends ChangeNotifier {
  var _item;
  int _physicalIndex;
  int _virtualIndex;
  final _props = new Map<Symbol, Object>();

  // Called to refresh the list after an item has been replaced.
  _notifyChanges() {
    _props.forEach((name, oldValue) {
      var newValue = smoke.read(_item, name);
      _props[name] = newValue;
      notifyChange(new PropertyChangeRecord(this, name, oldValue, newValue));
    });
  }

  _set(String name, value) {
    var field = smoke.nameToSymbol(name);
    smoke.write(_item, field, value);
    _props.putIfAbsent(field, () => value);
  }

  noSuchMethod(Invocation invocation) {
    if (invocation.isGetter) {
      var value = smoke.read(_item, invocation.memberName);
      _props.putIfAbsent(invocation.memberName, () => value);
      return value;
    }
    return super.noSuchMethod(invocation);
  }
}

// TODO: this should be on the CoreSelection type.
_setItemSelected(CoreSelection node, x, y) =>
    node.jsElement.callMethod('setItemSelected', [x, y]);

// Dart note: assuming our CssStyleDeclaration takes care of webkitTransform
// vs transform differences.
_setTransform(element, string, value) {
  element.style.transform = string;
  _transformValue[element] = value;
}

final _transformValue = new Expando();
