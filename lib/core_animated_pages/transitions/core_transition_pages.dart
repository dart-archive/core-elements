// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_transition_pages`.
library core_elements.core_transition_pages;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_transition.dart';

/// `core-transition-pages` represents a page transition, which may include CSS and/or
/// script. It will look for a `core-style` element with the same `id` to install in the
/// scope of the `core-animated-pages` that's using the transition.
///
/// Example:
///
///     <core-style id="fooTransition">
///         // some CSS here
///     </core-style>
///     <core-transition-pages id="fooTransition"></core-transition-pages>
///
/// There are three stages to a page transition:
///
/// 1. `prepare`: Called to set up the incoming and outgoing pages to the "before" state,
///   e.g. setting the incoming page to `opacity: 0` for `cross-fade` or find and
///   measure hero elements for `hero-transition`.
///
/// 2. `go`: Called to run the transition. For CSS-based transitions, this generally
///   applies a CSS `transition` property.
///
/// 3. `complete`: Called when the elements are finished transitioning.
///
/// See the individual transition documentation for specific details.
class CoreTransitionPages extends CoreTransition {
  CoreTransitionPages.created() : super.created();

  /// This class will be applied to the scope element in the `prepare` function.
  /// It is removed in the `complete` function. Used to activate a set of CSS
  /// rules that need to apply before the transition runs, e.g. a default opacity
  /// or transform for the non-active pages.
  String get scopeClass => jsElement['scopeClass'];
  set scopeClass(String value) { jsElement['scopeClass'] = value; }

  /// This class will be applied to the scope element in the `go` function. It is
  /// remoived in the `complete' function. Generally used to apply a CSS transition
  /// rule only during the transition.
  String get activeClass => jsElement['activeClass'];
  set activeClass(String value) { jsElement['activeClass'] = value; }

  /// Specifies which CSS property to look for when it receives a `transitionEnd` event
  /// to determine whether the transition is complete. If not specified, the first
  /// transitionEnd event received will complete the transition.
  String get transitionProperty => jsElement['transitionProperty'];
  set transitionProperty(String value) { jsElement['transitionProperty'] = value; }

  /// True if this transition is complete.
  bool get completed => jsElement['completed'];
  set completed(bool value) { jsElement['completed'] = value; }
}
@initMethod
upgradeCoreTransitionPages() => registerDartType('core-transition-pages', CoreTransitionPages);
