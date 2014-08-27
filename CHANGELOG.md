# changelog

This file contains highlights of what changes on each version of the
core_elements package.

#### Pub version 0.2.0-dev

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

#### Pub version 0.1.1+2

Fix for https://dartbug.com/20265, core-ajax-dart no longer throws an exception
when handling errors.

#### Pub version 0.1.1+1

Fix for https://github.com/dart-lang/core-elements/issues/84, core-ajax-dart no
longer fails if no params attribute is supplied.

#### Pub version 0.1.1

Fix for https://github.com/dart-lang/core-elements/issues/39, added missing
togglePanel method to core-drawer-panel.

#### Pub version 0.1.0+1

Updated all elements to the 0.3.4 js version.

#### Pub version 0.0.4

New generated wrappers for core-elements. This completely replaces and is
incompatible with earlier version of the package.

#### Pub version 0.0.3 and earlier

This was an attempt to port the core-elements to Dart. This version of the
package is deprecated.
