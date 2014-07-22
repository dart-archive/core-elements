// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_scroll_header_panel`.
library core_elements.core_scroll_header_panel;

import 'dart:html';
import 'dart:js' show JsArray, JsObject, JsFunction;
import 'dart:mirrors';
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-scroll-header-panel` contains a header section and a content section.  The
/// header is initially on the top part of the view but it scrolls away with the
/// rest of the scrollable content.  Upon scrolling slightly up at any point, the
/// header scrolls back into view.  This saves screen space and allows users to
/// access important controls by easily moving them back to the view.
///
/// `core-scroll-header-panel` works well with `core-toolbar` but can use any element
/// that represents a header by adding a `core-header` class to it.  Use the attribute
/// or class `content` to delineate the content section.
///
///     <core-scroll-header-panel>
///       <core-toolbar>Header</core-toolbar>
///       <div content>Content goes here...</div>
///     </core-scroll-header-panel>
class CoreScrollHeaderPanel extends HtmlElement with DomProxyMixin {
  CoreScrollHeaderPanel.created() : super.created();

  /// If true, the header's height will condense to `condensedHeaderHeight`
  /// as the user scrolls down from the top of the content area.
  bool get condenses => jsElement['condenses'];
  set condenses(bool value) { jsElement['condenses'] = value; }

  /// If true, no cross-fade transition from one background to another.
  bool get noDissolve => jsElement['noDissolve'];
  set noDissolve(bool value) { jsElement['noDissolve'] = value; }

  /// If true, the header doesn't slide back in when scrolling back up.
  bool get noReveal => jsElement['noReveal'];
  set noReveal(bool value) { jsElement['noReveal'] = value; }

  /// If true, the header is fixed to the top and never moves away.
  bool get fixed => jsElement['fixed'];
  set fixed(bool value) { jsElement['fixed'] = value; }

  /// If true, the condensed header is always shown and does not move away.
  bool get keepCondensedHeader => jsElement['keepCondensedHeader'];
  set keepCondensedHeader(bool value) { jsElement['keepCondensedHeader'] = value; }

  /// The height of the header when it is at its full size.
  ///
  /// By default, the height will be measured when it is ready.  If the height
  /// changes later the user needs to either set this value to reflect the
  /// new height or invoke `measureHeaderHeight()`.
  num get headerHeight => jsElement['headerHeight'];
  set headerHeight(num value) { jsElement['headerHeight'] = value; }

  /// The height of the header when it is condensed.
  ///
  /// By default, this will be 1/3 of `headerHeight`.
  num get condensedHeaderHeight => jsElement['condensedHeaderHeight'];
  set condensedHeaderHeight(num value) { jsElement['condensedHeaderHeight'] = value; }

  get header => jsElement['header'];

  get scroller => jsElement['scroller'];

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
upgradeCoreScrollHeaderPanel() => registerDartType('core-scroll-header-panel', CoreScrollHeaderPanel);
