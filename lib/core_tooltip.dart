// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_tooltip`.
library core_elements.core_tooltip;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:custom_element_apigen/src/common.dart' show DomProxyMixin;

/// The `core-tooltip` element creates a hover tooltip centered for the content
/// it contains. It can be positioned on the top|bottom|left|right of content using
/// the `position` attribute.
///
/// To include HTML in the tooltip, include the `tip` attribute on the relevant
/// content.
///
/// <b>Example</b>:
///
///     <core-tooltip label="I'm a tooltip">
///       <span>Hover over me.</span>
///     </core-tooltip>
///
/// <b>Example</b> - positioning the tooltip to the right:
///
///     <core-tooltip label="I'm a tooltip to the right" position="right">
///       <core-icon-button icon="drawer"></core-icon-button>
///     </core-tooltip>
///
/// <b>Example</b> - no arrow and showing by default:
///
///     <core-tooltip label="Tooltip with no arrow and always on" noarrow show>
///       <img src="image.jpg">
///     </core-tooltip>
///
/// <b>Example</b> - rich tooltip using the `tip` attribute:
///
///     <core-tooltip>
///       <div>Example of a rich information tooltip</div>
///       <div tip>
///         <img src="profile.jpg">Foo <b>Bar</b> - <a href="#">@baz</a>
///       </div>
///     </core-tooltip>
///
/// By default, the `tip` attribute specifies the HTML content for a rich tooltip.
/// You can customize this attribute with the `tipAttribute` attribute:
///
///     <core-tooltip tipAttribute="htmltooltip">
///       <div>Example of a rich information tooltip</div>
///       <div htmltooltip>
///         ...
///       </div>
///     </core-tooltip>
class CoreTooltip extends HtmlElement with DomProxyMixin {
  CoreTooltip.created() : super.created();
  factory CoreTooltip() => new Element.tag('core-tooltip');

  /// If true, the tooltip an arrow pointing towards the content.
  bool get noarrow => jsElement['noarrow'];
  set noarrow(bool value) { jsElement['noarrow'] = value; }

  /// Positions the tooltip to the top, right, bottom, left of its content.
  String get position => jsElement['position'];
  set position(String value) { jsElement['position'] = value; }

  /// A simple string label for the tooltip to display. To display a rich
  /// HTML tooltip instead, omit `label` and include the `tip` attribute
  /// on a child node of `core-tooltip`.
  String get label => jsElement['label'];
  set label(String value) { jsElement['label'] = value; }

  /// If true, the tooltip displays by default.
  bool get show => jsElement['show'];
  set show(bool value) { jsElement['show'] = value; }

  /// Customizes the attribute used to specify which content
  /// is the rich HTML tooltip.
  String get tipAttribute => jsElement['tipAttribute'];
  set tipAttribute(String value) { jsElement['tipAttribute'] = value; }
}
@initMethod
upgradeCoreTooltip() => registerDartType('core-tooltip', CoreTooltip);
