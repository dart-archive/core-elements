// DO NOT EDIT: auto-generated with `pub run custom_element_apigen:update`

/// Dart API for the polymer element `core_icons`.
library core_elements.core_icons;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import '`core_icons` is a utitliy import that includes the definition for the `core_icon` element, `core_iconset_svg` element, as well as an import for the default icon set.

The `core_icons` directory also includes imports for additional icon sets that can be loaded into your project.

Example loading icon set:

    <link rel="import" href="../core_icons/maps_icons.html">

To use an icon from one of these sets, first prefix your `core_icon` with the icon set name, followed by a colon, ":", and then the icon id.

Example using the directions_bus icon from the maps icon set:

    <core_icon icon="maps:directions_bus"></core_icon>


See [core_icon](#core_icon) for more information about working with icons.

See [core_iconset](#core_iconset) and [core_iconset_svg](#core_iconset_svg) for more information about how to create a custom iconset.
.dart';


class CoreIcons extends `coreIcons` is a utitliy import that includes the definition for the `coreIcon` element, `coreIconsetSvg` element, as well as an import for the default icon set.

The `coreIcons` directory also includes imports for additional icon sets that can be loaded into your project.

Example loading icon set:

    <link rel="import" href="../coreIcons/mapsIcons.html">

To use an icon from one of these sets, first prefix your `coreIcon` with the icon set name, followed by a colon, ":", and then the icon id.

Example using the directionsBus icon from the maps icon set:

    <coreIcon icon="maps:directionsBus"></coreIcon>


See [coreIcon](#coreIcon) for more information about working with icons.

See [coreIconset](#coreIconset) and [coreIconsetSvg](#coreIconsetSvg) for more information about how to create a custom iconset.
 {
  CoreIcons.created() : super.created();
  factory CoreIcons() => new Element.tag('core-icons');
}
@initMethod
upgradeCoreIcons() => registerDartType('core-icons', CoreIcons);
