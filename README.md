# Core elements

This package wraps the Polymer project's core elements, providing the
following features:

 * Because the elements are bundled into a single pub package, you can add
   `core_elements` as a dependency in your pubspec. You don't need to
   install npm or bower.
 * Most core elements are wrapped with Dart proxy classes, making them easier
   to interact with from Dart apps.
 * Elements that are either performance sensitive (like `core-list`) or
   use native objects that are difficult to use via dart:js (like `core-ajax`)
   have been ported to Dart.
   
You can find out more about core elements here:
http://www.polymer-project.org/docs/elements/core-elements.html


## Status

This is an early access version of the core elements. The elements are still
changing on both the JavaScript and Dart sides.


## Using elements

All elements live at the top level of the `lib/` folder.

Import into HTML:

    <link rel="import" href="packages/core_elements/core_input.html">

Import into Dart:

    import 'package:core_elements/core_input.dart';


## Running demos

If you download or fork the repo from
https://github.com/dart-lang/core-elements,
then you can use the `pub` command to run demos.

If you only want to run a few demos, then you can edit `pubspec.yaml` to
comment out (using `#`) all the entrypoints except the ones you need.

To run a core element demo:

1. From the top directory, use the `pub serve` command, specifying the
   `example` directory:

        pub serve example

2. In a browser, visit <code>http://localhost:8080/<em>element_name</em>.html).

   Note that you use an underscore (`_`) instead of the dash (`-`)
   in the element name.
   For example, to see the core-icons demo, browse to
   <a href="http://localhost:8080/core_icons.html">http://localhost:8080/core_icons.html</a>.

   For a full list of demos, see the values for `entry_points`
   in the `pubspec.yaml` file.


To create a deployable build of one or more demos:

1. From the top directory, use the `pub build` command:

    pub build example

2. Copy the files from the resulting `build` directory to
   where you want to serve the files.

**Note:** Building the demos might take a few minutes.
 