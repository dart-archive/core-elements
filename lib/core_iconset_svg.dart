// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_iconset_svg`.
library core_elements.core_iconset_svg;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_meta.dart';

/// The `core-iconset-svg` element allows users to define their own icon sets
/// that contain svg icons. The svg icon elements should be children of the
/// `core-iconset-svg` element. Multiple icons should be given distinct id's.
///
/// Using svg elements to create icons has a few advantages over traditional
/// bitmap graphics like jpg or png. Icons that use svg are vector based so they
/// are resolution independent and should look good on any device. They are
/// stylable via css. Icons can be themed, colorized, and even animated.
///
/// Example:
///
///     <core-iconset-svg id="my-svg-icons" iconSize="24">
///       <svg>
///         <defs>
///           <g id="shape">
///             <rect x="50" y="50" width="50" height="50" />
///             <circle cx="50" cy="50" r="50" />
///           </g>
///         </defs>
///       </svg>
///     </core-iconset-svg>
///
/// This will automatically register the icon set "my-svg-icons" to the iconset
/// database.  To use these icons from within another element, make a
/// `core-iconset` element and call the `byId` method
/// to retrieve a given iconset. To apply a particular icon inside an
/// element use the `applyIcon` method. For example:
///
///     iconset.applyIcon(iconNode, 'car');
class CoreIconsetSvg extends CoreMeta {
  CoreIconsetSvg.created() : super.created();

  /// The size of an individual icon. Note that icons must be square.
  num get iconSize => jsElement['iconSize'];
  set iconSize(num value) { jsElement['iconSize'] = value; }

  get iconNames => jsElement['iconNames'];

  /// Applies an icon to the given element. The svg icon is added to the
  /// element's shadowRoot if one exists or directly to itself.
  ///
  /// Returns icon element
  /// [element]: The element to which the icon is
  ///     applied.
  /// [icon]: The name the icon to apply.
  applyIcon(element, icon) =>
      jsElement.callMethod('applyIcon', [element, icon]);

  /// Tell users of the iconset, that the set has loaded.
  /// This finds all elements matching the selector argument and calls
  /// the method argument on them.
  /// [css]: selector to identify iconset users, 
  ///     defaults to '[icon]'
  /// [method]: to call on found elements, 
  ///     defaults to 'updateIcon'
  void updateIcons(String css, String method) =>
      jsElement.callMethod('updateIcons', [css, method]);
}
@initMethod
upgradeCoreIconsetSvg() => registerDartType('core-iconset-svg', CoreIconsetSvg);
