// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_overlay`.
library core_elements.core_overlay;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// The `core-overlay` element displays overlayed on top of other content. It starts
/// out hidden and is displayed by setting its `opened` property to true.
/// A `core-overlay's` opened state can be toggled by calling the `toggle`
/// method.
///
/// The `core-overlay` will, by default, show/hide itself when it's opened. The
/// `target` property may be set to another element to cause that element to
/// be shown when the overlay is opened.
///
/// It's common to want a `core-overlay` to animate to its opened
/// position. The `core-overlay` element uses a `core-transition` to handle
/// animation. The default transition is `core-transition-fade` which
/// causes the overlay to fade in when displayed. See
/// <a href="../core-transition/">`core-transition`</a> for more
/// information about customizing a `core-overlay's` opening animation. The
/// `backdrop` property can be set to true to show a backdrop behind the overlay
/// that will darken the rest of the window.
///
/// An element that should close the `core-overlay` will automatically
/// do so if it's given the `core-overlay-toggle` attribute. This attribute
/// can be customized with the `closeAttribute` property. You can also use
/// `closeSelector` if more general matching is needed.
///
/// By default  `core-overlay` will close whenever the user taps outside it or
/// presses the escape key. This behavior can be turned off via the
/// `autoCloseDisabled` property.
///
///     <core-overlay>
///       <h2>Dialog</h2>
///       <input placeholder="say something..." autofocus>
///       <div>I agree with this wholeheartedly.</div>
///       <button core-overlay-toggle>OK</button>
///     </core-overlay>
///
/// `core-overlay` will automatically size and position itself according to the
/// following rules. If the target's style.top and style.left are unset, the
/// target will be centered. The size of the target is constrained to be no larger
/// than the window dimensions. The `margin` property specifies the extra amount
/// of space that should be reserved around the overlay. This can be used to ensure
/// that, for example, a drop shadow is always visible around the overlay.
class CoreOverlay extends HtmlElement with DomProxyMixin {
  CoreOverlay.created() : super.created();

  /// The target element that will be shown when the overlay is
  /// opened. If unspecified, the core-overlay itself is the target.
  get target => jsElement['target'];
  set target(value) { jsElement['target'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// A `core-overlay`'s size is guaranteed to be
  /// constrained to the window size. To achieve this, the sizingElement
  /// is sized with a max-height/width. By default this element is the
  /// target element, but it can be specifically set to a specific element
  /// inside the target if that is more appropriate. This is useful, for
  /// example, when a region inside the overlay should scroll if needed.
  get sizingTarget => jsElement['sizingTarget'];
  set sizingTarget(value) { jsElement['sizingTarget'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// Set opened to true to show an overlay and to false to hide it.
  /// A `core-overlay` may be made initially opened by setting its
  /// `opened` attribute.
  bool get opened => jsElement['opened'];
  set opened(bool value) { jsElement['opened'] = value; }

  /// If true, the overlay has a backdrop darkening the rest of the screen.
  /// The backdrop element is attached to the document body and may be styled
  /// with the class `core-overlay-backdrop`. When opened the `core-opened`
  /// class is applied.
  bool get backdrop => jsElement['backdrop'];
  set backdrop(bool value) { jsElement['backdrop'] = value; }

  /// If true, the overlay is guaranteed to display above page content.
  bool get layered => jsElement['layered'];
  set layered(bool value) { jsElement['layered'] = value; }

  /// By default an overlay will close automatically if the user
  /// taps outside it or presses the escape key. Disable this
  /// behavior by setting the `autoCloseDisabled` property to true.
  bool get autoCloseDisabled => jsElement['autoCloseDisabled'];
  set autoCloseDisabled(bool value) { jsElement['autoCloseDisabled'] = value; }

  /// This property specifies an attribute on elements that should
  /// close the overlay on tap. Should not set `closeSelector` if this
  /// is set.
  String get closeAttribute => jsElement['closeAttribute'];
  set closeAttribute(String value) { jsElement['closeAttribute'] = value; }

  /// This property specifies a selector matching elements that should
  /// close the overlay on tap. Should not set `closeAttribute` if this
  /// is set.
  String get closeSelector => jsElement['closeSelector'];
  set closeSelector(String value) { jsElement['closeSelector'] = value; }

  /// A `core-overlay` target's size is constrained to the window size.
  /// The `margin` property specifies a pixel amount around the overlay
  /// that will be reserved. It's useful for ensuring that, for example,
  /// a shadow displayed outside the target will always be visible.
  num get margin => jsElement['margin'];
  set margin(num value) { jsElement['margin'] = value; }

  /// The transition property specifies a string which identifies a
  /// <a href="../core-transition/">`core-transition`</a> element that
  /// will be used to help the overlay open and close. The default
  /// `core-transition-fade` will cause the overlay to fade in and out.
  String get transition => jsElement['transition'];
  set transition(String value) { jsElement['transition'] = value; }

  /// Toggle the opened state of the overlay.
  void toggle() =>
      jsElement.callMethod('toggle', []);

  /// Open the overlay. This is equivalent to setting the `opened`
  /// property to true.
  void open() =>
      jsElement.callMethod('open', []);

  /// Close the overlay. This is equivalent to setting the `opened`
  /// property to false.
  void close() =>
      jsElement.callMethod('close', []);

  /// Extensions of core-overlay should implement the `resizeHandler`
  /// method to adjust the size and position of the overlay when the
  /// browser window resizes.
  void resizeHandler() =>
      jsElement.callMethod('resizeHandler', []);
}
@initMethod
upgradeCoreOverlay() => registerDartType('core-overlay', CoreOverlay);
