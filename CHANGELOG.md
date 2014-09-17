## Pub version 0.2.2

  * Update all elements so they can be built from code using a normal factory
    constructor, such as `new CoreInput()`. It is still necessary however to
    include the html import for each element you wish to create this way.

## Pub version 0.2.1+2

  * Fix for [107](https://github.com/dart-lang/core-elements/issues/107).
    The `core-ajax-dart` element no longer throws exception in checked mode, and
    the `content-type` header will have the proper default.
    
## Pub version 0.2.1+1

  * Update `core-input` element to
    [88cbe6f](https://github.com/Polymer/core-input/commit/88cbe6f). This
    removes the need to use js interop for many methods that are forwarded to
    the underlying input element.

## Pub version 0.2.1

  * Update all elements to the 0.4.0 js versions.
    * **New** Added new element core_popup_menu.
    * Fix core_drag_drop example.
  * Upgrade polymer dependency to >= 0.14.0.
    * Removed platform.js from all tests and examples.
  * Upgrade dependency on web_components to >=0.7.0.

## Pub version 0.2.0+1

Upgrade polymer dependency to >=0.13.0

## Pub version 0.2.0

Updated all elements to the 0.3.5 js versions.

  * **New** Added core-dropdown element, which acts like a <select> tag.
  * **New** Ported examples/demo.html which provides a central page to run all
    the other demos.
  * **Breaking Change** All icons that previously lived under 
    'packages/core_elements/core_icons/iconsets/' now live directly under
    'packages/core_elements/'.
  * Workaround in core-list-dart for [bug
20648](https://code.google.com/p/dart/issues/detail?id=20648)
  * Expanded polymer version constraint to <0.14.0.

## Pub version 0.1.1+2

Fix for https://dartbug.com/20265, core-ajax-dart no longer throws an exception
when handling errors.

## Pub version 0.1.1+1

Fix for https://github.com/dart-lang/core-elements/issues/84, core-ajax-dart no
longer fails if no params attribute is supplied.

## Pub version 0.1.1

Fix for https://github.com/dart-lang/core-elements/issues/39, added missing
togglePanel method to core-drawer-panel.

## Pub version 0.1.0+1

Updated all elements to the 0.3.4 js version.

## Pub version 0.0.4

New generated wrappers for core-elements. This completely replaces and is
incompatible with earlier version of the package.

## Pub version 0.0.3 and earlier

This was an attempt to port the core-elements to Dart. This version of the
package is deprecated.
