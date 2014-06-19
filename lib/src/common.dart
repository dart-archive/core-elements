// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

/// Common logic used by the code generated with `tool/generate_dart_api.dart`.
library core_elements.src.common;
import 'dart:js' as js;

/// A simple mixin to make it easier to interoperate with the Javascript API of
/// a browser object. This is mainly used by classes that expose a Dart API for
/// Javascript custom elements.
// TODO(sigmund): move this to polymer
class DomProxyMixin {
  js.JsObject _proxy;
  js.JsObject get jsElement {
    if (_proxy == null) {
      _proxy = new js.JsObject.fromBrowserObject(this);
    }
    return _proxy;
  }
}
