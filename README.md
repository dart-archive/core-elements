core-elements
==============

Dart wrappers and ports for Polymer's core-elements.

## Overview

This packages makes it more convenient for Dart developers to use the Polymer
project's set of core-elements.

You can find out more about core-elements here:
http://www.polymer-project.org/components/core-docs/index.html

core_elements provides a few things for Dart developers:

 * It packages the elements into a single pub package so that you can add
   `core_elements` as a dependency in your pupbspec. Installing npm and bower
   is not required.
 * It wraps most core-elements with Dart proxy classes to make them easier to
   interact with from Dart scripts.
 * It ports a few elements that are performance sensitive (like `core-list`) or
   use native objects that are difficult to use via dart:js (like `core-ajax`).
   
## Status

This is an early access version of the elements. The elements are still changing
on both the JS and Dart side.

## Using Elements

All elements live at the top-level of the `lib/` folder.

Import into HTML:

    <link rel="import" href="packages/core_elements/core_input.html">

Import into Dart:

    import 'package:core_elements/core_input.dart';
 