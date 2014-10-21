/*
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
library core_elements.core_list_dart;

import 'dart:js' show JsObject;
import 'dart:js' as js;
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
   * When true, tapping a row will select the item, placing its data model
   * in the set of selected items retrievable via the `selection` property.
   *
   * Note that tapping focusable elements within the list item will not
   * result in selection, since they are presumed to have their own action.
   *
   * @attribute selectionEnabled
   * @type {boolean}
   * @default true
   */
  @published bool selectionEnabled = true;

  /**
   *
   * Set to true to support multiple selection. Note, existing selection state
   * is maintained only when changing `multi` from `false` to `true`; it is
   * cleared when changing from `true` to `false`.
   *
   * @attribute multi
   * @type boolean
   * @default false
   */
  @published bool multi = false;

  /**
   * 
   * Data record (or array of records, if `multi: true`) corresponding to
   * the currently selected set of items.
   *
   * @attribute selection
   * @type {any}
   * @default null
   */
  @published var selection;

  @observable var selected;

  var _target;
  var _targetScrollSubscription;
  int _visibleCount;
  int _physicalCount;
  double _physicalHeight;
  double _scrollTop = 0.0;
  bool _oldMulti = false;
  bool _oldSelectionEnabled = false;

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
    _oldMulti = multi;
    _oldSelectionEnabled = selectionEnabled;
  }

  @override
  attached() {
    this.template = this.querySelector('template');
    if (templateBind(this.template).bindingDelegate == null) {
      templateBind(this.template).bindingDelegate = this.element.syntax;
    }
  }

  @ObserveProperty('multi selectionEnabled')
  resetSelection() {
    if ((_oldMulti != multi && !multi) ||
        (_oldSelectionEnabled != selectionEnabled && !selectionEnabled)) {
      this._clearSelection();
      this.refresh(true);
    } else {
      this.selection = _getSelection();
    }
    _oldMulti = multi;
    _oldSelectionEnabled = selectionEnabled;
  }

  // TODO(debug): not sure why we need to add this bogus handler. Without it
  // data modifications are not being handled in initialize if run in Dartium
  // & dirty-checking
  @ObserveProperty('data') updateData() {}

  // TODO(sorvell): it'd be nice to dispense with 'data' and just use
  // template repeat's model. However, we need tighter integration
  // with TemplateBinding for this.
  // Dart note: added data.length so we detect modifications in the list.
  @ObserveProperty('data template scrollTarget')
  initialize(changes) {
    if (this.template == null) return;

    // `changes is List<ListChangeRecord>` does not work in Dart. We assume here
    // that if the first item is a ListChangeRecord then the rest is too.
    if (changes is List && !changes.isEmpty && changes[0] is ListChangeRecord
        && !changes[0].object.isEmpty) {
      for (var s in changes) {
        for (var d in s.removed) {
          _setItemSelected(_selection, _wrap(d), false);
        }
      }
    } else {
     this._clearSelection();
    }

    var target = scrollTarget != null ? scrollTarget : this;
    if (_target != target) {
      if (_targetScrollSubscription != null) {
        _targetScrollSubscription.cancel();
        _targetScrollSubscription = null;
      }
      _target = target;
      _targetScrollSubscription = _target.on['scroll'].listen(scrollHandler);
    }
    // Only use -webkit-overflow-touch from iOS8+, where scroll events are fired
    var ios = new RegExp('iP(?:hone|ad;(?: U;)? CPU) OS (\d+)').firstMatch(
        window.navigator.userAgent);
    if (ios != null && int.parse(ios.group(1)) >= 8) {
      target.style.webkitOverflowScrolling = 'touch';
    }

    this.initializeData();
  }

  initializeData() {
    var currentCount = _physicalCount == null ? 0 : _physicalCount;
    var dataLen = data != null ? data.length : 0;
    _visibleCount = (_target.offsetHeight / this.height).ceil();
    _physicalCount = math.min(_visibleCount + this.extraItems, dataLen);
    _physicalCount = math.max(currentCount, _physicalCount);

    if (_physicalData == null) _physicalData = new ObservableList<_ListModel>();
    if (_physicalData.length < _physicalCount) {
      _physicalData.length = _physicalCount;
    }
    var needItemInit =
        _physicalItems != null && _physicalCount != _physicalItems.length;
    while (currentCount < _physicalCount) {
      _physicalData[currentCount++] = new _ListModel();
      needItemInit = true;
    }
    templateBind(this.template).model = _physicalData;
    this.template.attributes['repeat'] = '';
    if (needItemInit) {
      this.onMutation(this).then((_) => initializeItems());
    } else {
      this.refresh(true);
    }
  }

  initializeItems() {
    var currentCount = _physicalItems != null ? _physicalItems.length : 0;
    if (_physicalItems == null) _physicalItems = new List();
    if (_physicalItems.length < _physicalCount) {
      _physicalItems.length = _physicalCount;
    }
    for (var i = 0, item = this.template.nextElementSibling;
         item != null && i < _physicalCount;
         ++i, item = item.nextElementSibling) {
      _physicalItems[i] = item;
      _transformValue[item] = 0;
    }
    this.refresh(true);
  }

  updateItem(virtualIndex, physicalIndex) {
    var virtualDatum = (data == null || virtualIndex >= data.length) ?
        null : data[virtualIndex];
    var physicalDatum = _physicalData[physicalIndex];
    physicalDatum.model = virtualDatum;
    physicalDatum.physicalIndex = physicalIndex;
    physicalDatum.index = virtualIndex;
    physicalDatum.selected = selectionEnabled && virtualDatum != null
        ? _selectedData[virtualDatum] : null;
    var physicalItem = this._physicalItems[physicalIndex];
    physicalItem.hidden = virtualDatum == null;
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
    var dataLen = this.data != null ? this.data.length : 0;
    if (force) {
      if (this._physicalCount < 
          math.min(this._visibleCount + this.extraItems, dataLen)) {
        // Need to add more items; once new data & items are initialized,
        // refresh will be run again
        this.initializeData();
        return;
      }
      this._physicalHeight = this.height * this._physicalCount;
      this.$['viewport'].style.height = '${this.height * dataLen}px';
    }

    int firstVisibleIndex = (_scrollTop / height).floor();
    num visibleMidpoint = firstVisibleIndex + _visibleCount / 2;

    int firstReifiedIndex = math.max(0, (visibleMidpoint -
        _physicalCount / 2).floor());
    firstReifiedIndex = math.min(firstReifiedIndex, dataLen -
        _physicalCount);
    firstReifiedIndex = (firstReifiedIndex < 0) ? 0 : firstReifiedIndex;

    int firstPhysicalIndex =
        (_physicalCount > 0) ? firstReifiedIndex % _physicalCount : 0;
    int baseVirtualIndex = firstReifiedIndex - firstPhysicalIndex;

    int baseTransformValue = (this.height * baseVirtualIndex).floor();
    int nextTransformValue = (baseTransformValue + _physicalHeight).floor();

    var baseTransformString = 'translate3d(0,${baseTransformValue}px,0)';
    var nextTransformString = 'translate3d(0,${nextTransformValue}px,0)';
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
    var n = e.target;
    var p = e.path;
    if (!this.selectionEnabled || identical(n, this)) return;
    window.requestAnimationFrame((_) {
      // Gambit: only select the item if the tap wasn't on a focusable child
      // of the list (since anything with its own action should be focusable
      // and not result in result in list selection).  To check this, we
      // asynchronously check that shadowRoot.activeElement is null, which 
      // means the tapped item wasn't focusable. On polyfill where
      // activeElement doesn't follow the data-hinding part of the spec, we
      // can check that document.activeElement is the list itself, which will
      // catch focus in lieu of the tapped item being focusable, as we make
      // the list focusable (tabindex="-1") for this purpose.  Note we also
      // allow the list items themselves to be focusable if desired, so those
      // are excluded as well.
      var active = (js.context['ShadowDOMPolyfill'] != null)
          ? js.context['wrap'].apply([document.activeElement])
          : this.shadowRoot.activeElement;
      if (active != null && active != this && active.parentNode != this
          && document.activeElement != document.body) {
        return;
      }
      // Unfortunately, Safari does not focus certain form controls via mouse,
      // so we also blacklist input, button, & select
      // (https://bugs.webkit.org/show_bug.cgi?id=118043)
      if ((p[0].localName == 'input') || 
          (p[0].localName == 'button') || 
          (p[0].localName == 'select')) {
        return;
      }
      var instance = nodeBind(n).templateInstance;
      _ListModel model = instance != null ? instance.model.model : null;
      if (model != null) {
        var vi = model.index, pi = model.physicalIndex;
        var data = this.data[vi], item = _physicalItems[pi];
        _invokeSelect(data);
        this.asyncFire('core-activate', detail:
            new CoreActivateEvent(data: data, item: item));
      }
    });
  }

  // Dart note: Dartium creates a new proxy every time a Dart object is sent via
  // jsinterop, unless the object is previsously jsified. This extra logic here
  // is used to ensure taht core-selection works correctly in `multi` mode
  // (tapping an element twice should deselect it).
  _invokeSelect(item) => _selection.select(_wrap(item));

  _getSelection() {
    var s = _selection.getSelection();
    if (!_inDartium || s == null) return s;
    if (s is List) return s.map(_unwrap).toList();
    return _unwrap(s);
  }

  static final _inDartium = window.navigator.dartEnabled;

  Expando dartObjectProxy = new Expando();

  _wrap(item) {
    if (!_inDartium) return item;
    var o = dartObjectProxy[item];
    if (o == null) {
      o = new JsObject.jsify({'original': item});
      dartObjectProxy[item] = o;
    }
    return o;
  }

  _unwrap(item) => _inDartium ? item['original'] : item;

  selectedHandler(e) {
    this.selection = _getSelection();
    // TODO(sigmund): remove this use of JsInterop when dartbug.com/20648 is
    // fixed
    var detail = new JsObject.fromBrowserObject(e)['detail'];
    var item = _unwrap(detail['item']);
    var i$ = this.indexesForData(item);
    // TODO(sorvell): we should be relying on selection to store the
    // selected data but we want to optimize for lookup.
    _selectedData[item] = detail['isSelected'];

    var physical = i$['physical'];
    if (physical != null && physical >= 0) {
      this.updateItem(i$['virtual'], physical);
    }
  }

  /**
   * Select the list item at the given index.
   *
   * @method selectItem
   * @param {number} index
   */
  selectItem(index) {
    if (!selectionEnabled) return;
    var item = this.data[index];
    if (item != null) {
      _invokeSelect(item);
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
    var item = this.data[index];
    if (item != null) {
      _setItemSelected(_selection, _wrap(item), isSelected);
    }
  }

  indexesForData(data) {
    var virtual = this.data.indexOf(data);
    var physical = this.virtualToPhysicalIndex(virtual);
    return { 'virtual': virtual, 'physical': physical };
  }

  virtualToPhysicalIndex(index) {
    for (var i=0, l=_physicalData.length; i<l; i++) {
      if (_physicalData[i].index == index) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Clears the current selection state of the list.
   *
   * @method clearSelection
   */
  clearSelection() {
    _clearSelection();
    this.refresh(true);
  }

  _clearSelection() {
    _selectedData = new Expando();
    _selection.jsElement.callMethod('clear');
    this.selection = _getSelection();
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

/// Model used for the template of each item in the list.
class _ListModel extends Observable {
  @observable int physicalIndex;
  @observable int index;
  @observable bool selected;
  @observable var model;
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
