// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `hero_transition`.
library core_elements.hero_transition;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_transition_pages.dart';

/// `hero-transition` transforms two elements in different pages such that they appear
/// to be shared across the pages.
///
/// Example:
///
///     <core-animated-pages transition="hero-transition">
///       <section layout horizontal>
///         <div id="div1" flex></div>
///         <div id="div2" flex hero-id="shared" hero></div>
///       </section>
///       <section>
///       <section layout horizontal>
///         <div id="div3" flex hero-id="shared" hero></div>
///         <div id="div4" flex></div>
///       </section>
///       </section>
///     </core-animated-pages>
///
/// In the above example, the elements `#div2` and `#div3` shares the same `hero-id`
/// attribute and a single element appears to translate and scale smoothly between
/// the two positions during a page transition.
///
/// Both elements from the source and destination pages must share the same `hero-id`
/// and must both contain the `hero` attribute to trigger the transition. The separate
/// `hero` attribute allows you to use binding to configure the transition:
///
/// Example:
///
///     <core-animated-pages transition="hero-transition">
///       <section layout horizontal>
///         <div id="div1" flex hero-id="shared" hero?="{{selected == 0}}"></div>
///         <div id="div2" flex hero-id="shared" hero?="{{selected == 1}}"></div>
///       </section>
///       <section>
///       <section layout horizontal>
///         <div id="div3" flex hero-id="shared" hero></div>
///       </section>
///       </section>
///     </core-animated-pages>
///
/// In the above example, either `#div1` or `#div2` scales to `#div3` during a page transition,
/// depending on the value of `selected`.
///
/// Because it is common to share elements with different `border-radius` values, by default
/// this transition will also animate the `border-radius` property.
///
/// You can configure the duration of the hero transition with the global variable
/// `CoreStyle.g.transitions.heroDuration`.
class HeroTransition extends CoreTransitionPages {
  HeroTransition.created() : super.created();
  factory HeroTransition() => document.createElement('hero-transition');
}
@initMethod
upgradeHeroTransition() => registerDartType('hero-transition', HeroTransition);
