// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_animated_pages`.
library core_elements.core_animated_pages;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_selector.dart';

/// `core-animated-pages` selects one of its children "pages" to show and runs a transition
/// when switching between them. The transitions are designed to be pluggable, and can
/// accept any object that is an instance of a `core-transition-pages`. Transitions to run
/// are specified in the `transitions` attribute as a space-delimited string of `id`s of
/// transition elements. Several transitions are available with `core-animated-pages` by
/// default, including `hero-transition`, `cross-fade`, and `tile-cascade`.
///
/// Example:
///
///     <style>
///       #hero1 {
///         position: absolute;
///         top: 0;
///         left: 0;
///         width: 300px;
///         height: 300px;
///         background-color: orange;
///       }
///       #hero2 {
///         position: absolute;
///         top: 200px;
///         left: 300px;
///         width: 300px;
///         height: 300px;
///         background-color: orange;
///       }
///       #bottom1, #bottom2 {
///         position: absolute;
///         bottom: 0;
///         top: 0;
///         left: 0;
///         height: 50px;
///       }
///       #bottom1 {
///         background-color: blue;
///       }
///       #bottom2 {
///         background-color: green;
///       }
///     </style>
///     // hero-transition and cross-fade are declared elsewhere
///     <core-animated-pages transitions="hero-transition cross-fade">
///       <section id="page1">
///         <div id="hero1" hero-id="hero" hero></div>
///         <div id="bottom1" cross-fade></div>
///       </section>
///       <section id="page2">
///         <div id="hero2" hero-id="hero" hero></div>
///         <div id="bottom2" cross-fade></div>
///       </section>
///     </core-animated-pages>
///
/// In the above example, two transitions (`hero-transition` and `cross-fade`) are run when switching
/// between `page1` and `page2`. `hero-transition` transforms elements with the same `hero-id` such
/// that they appear to be shared across different pages. `cross-fade` fades out the elements marked
/// `cross-fade` in the outgoing page, and fades in those in the incoming page. See the individual
/// transition's documentation for specific details.
///
/// Finding elements to transition
/// ------------------------------
///
/// In general, a transition is applied to elements marked with a certain attribute. For example,
/// `hero-transition` applies the transition on elements with the `hero` and `hero-id` attribute.
/// Among the transitions included with `core-animated-pages`, script-based transitions such as
/// `hero-transition` generally look for elements up to one level of shadowRoot from the
/// `core-animated-pages` element, and CSS-based transitions such as `cross-fade` look for elements
/// within any shadowRoot within the `core-animated-pages` element. This means you can use
/// custom elements as pages and mark elements in their shadowRoots as heroes, or mark
/// elements in deeper shadowRoots with other transitions.
///
/// Example:
///
///     <polymer-element name="x-el" noscript>
///     <template>
///       <style>
///         #hero {
///           position: absolute;
///           top: 0;
///           right: 0;
///           width: 50px;
///           height: 300px;
///           background-color: blue;
///         }
///       </style>
///       <div id="hero" hero-id="bar" hero></div>
///     </template>
///     </polymer-element>
///
///     <polymer-element name="x-page-1" noscript>
///     <template>
///       <style>
///         #hero1 {
///           position: absolute;
///           top: 0;
///           left: 0;
///           width: 300px;
///           height: 300px;
///           background-color: orange;
///         }
///       </style>
///       <div id="hero1" hero-id="foo" hero></div>
///       <div id="hero2" hero-id="bar" hero></div>
///     </template>
///     </polymer-element>
///
///     <polymer-element name="x-page-2" noscript>
///     <template>
///       <style>
///         #hero1 {
///           position: absolute;
///           top: 200px;
///           left: 300px;
///           width: 300px;
///           height: 300px;
///           background-color: orange;
///         }
///         #hero2 {
///           background-color: blue;
///           height: 150px;
///           width: 400px;
///         }
///       </style>
///       // The below element is one level of shadow from the core-animated-pages and will
///       // be transitioned.
///       <div id="hero1" hero-id="foo" hero></div>
///       // The below element contains a hero inside its shadowRoot making it two levels away
///       // from the core-animated-pages, and will not be transitioned.
///       <x-el></x-el>
///     </template>
///     </polymer-element>
///
///     <core-animated-pages transitions="hero-transition">
///       <x-page-1></x-page-1>
///       <x-page-2></x-page-2>
///     </core-animated-pages>
///
/// Note that the container element of the page does not participate in the transition.
///
///     // This does not work
///     <core-animated-pages transitions="cross-fade">
///       <section cross-fade></section>
///       <section cross-fade></section>
///     </core-animated-pages>
///
///     // This works
///     <core-animated-pages transitions="cross-fade">
///       <section>
///         <div cross-fade></div>
///       </section>
///       <section>
///         <div cross-fade></div>
///       </section>
///     </core-animated-pages>
///
/// Dynamically setting up transitions
/// ----------------------------------
///
/// An easy way to dynamically set up transitions dynamically is to use property binding on
/// the transition attributes.
///
/// Example:
///
///     <core-animated-pages selected="{{selected}}">
///       <section id="page1">
///         <div hero-id="hero" hero></div>
///       </section>
///       <section id="page2">
///         <div id="foo" hero-id="hero" hero?="{{selected === 1 || selected === 0}}" cross-fade="{{selected === 2}}"></div>
///       </section>
///       <section id="page3">
///       </section>
///     </core-animated-pages>
///
/// In the above example, the "foo" element only behaves as a hero element if transitioning between
/// `#page1` and `#page2`. It gets cross-faded when transition to or from `#page3`.
///
/// Nesting pages
/// -------------
///
/// It is possible to nest core-animated-pages elements for organization. Excessive nesting is
/// not encouraged, however, since it makes setting up the transition more complex.
///
/// To nest core-animated-pages, the page containing the nested core-animated-pages element should
/// have a `selectedItem` property bound to the `selectedItem` property of the nested element. This
/// will allow the outer core-animated-pages to know which nested page it is actually transitioning
/// to.
///
/// Example:
///
///     <polymer-element name="nested-page" attributes="selectedItem">
///     <template>
///       <core-animated-pages selectedItem="{{selectedItem}}">
///         ...
///       </core-animated-pages>
///     </template>
///     </polymer-element>
///
///     <core-animated-pages>
///       <section id="page1"></section>
///       <nested-page id="page2"></section>
///     </core-animated-pages>
class CoreAnimatedPages extends CoreSelector {
  CoreAnimatedPages.created() : super.created();
  factory CoreAnimatedPages() => document.createElement('core-animated-pages');

  /// A space-delimited string of transitions to use when switching between pages in this element.
  /// The strings are `id`s of `core-transition-pages` elements included elsewhere. See the
  /// individual transition's document for specific details.
  String get transitions => jsElement['transitions'];
  set transitions(String value) { jsElement['transitions'] = value; }

  /// The last page selected. This property is useful to dynamically set transitions based
  /// on incoming and outgoing pages.
  get lastSelected => jsElement['lastSelected'];
  set lastSelected(value) { jsElement['lastSelected'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}
}
@initMethod
upgradeCoreAnimatedPages() => registerDartType('core-animated-pages', CoreAnimatedPages);
