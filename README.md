core-elements
==============

Dart wrappers or ports for Polymer core elements

## Status

Bower is configured and Polymer and core-elements have been added as
dependencies and checked in. They are checked in under `lib/src/*` because Bower
doesn't support version locking yet.

Several elements have been ported or wrapped (elements under `lib/name*`)

## Updating Components

To update the packages you need to have [Bower](http://bower.io) installed.

The JavaScript libraries required by the elements are downloaded via Bower and
installed into `lib/src/`. The direct dependencies are specified in
`bower.json`, and there is a `.borwerrc` file that instructs Bower to install
packages to `lib/`.

Bower has been failing on install, due to
https://github.com/bower/bower/issues/1169 so instead of running a command like
`bower install --save Polymer/polymer` add the dependency to `bower.json` and
run `bower update`.

The source of polymer.html at `lib/src/polymer/polymer.html` is patched so that
it loads the same polymer.html as polymer.dart applications.
