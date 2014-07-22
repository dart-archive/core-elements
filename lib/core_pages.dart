// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_pages`.
library core_elements.core_pages;

import 'dart:html';
import 'dart:js' show JsArray, JsObject, JsFunction;
import 'dart:mirrors';
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_selector.dart';

/// `core-pages` is used to select one of its children to show. One use is to cycle through a list of children "pages".
///
/// Example:
///
///     <core-pages selected="0">
///       <div>One</div>
///       <div>Two</div>
///       <div>Three</div>
///     </core-pages>
///
///     <script>
///       document.addEventListener('click', function(e) {
///         var pages = document.querySelector('core-pages');
///         pages.selected = (pages.selected + 1) % pages.children.length;
///       };
///     </script>
class CorePages extends CoreSelector {
  CorePages.created() : super.created();

  noSuchMethod(Invocation invocation) {
    String methodName = MirrorSystem.getName(invocation.memberName);
    if (invocation.isMethod && jsElement[methodName] is JsFunction) {
      print('Warning, passing missing method call ${methodName} to '
            'JS element. This may impact performance, and should be wrapped '
            'explicitely in dart.');
      jsElement.callMethod(
          methodName, invocation.positionalArguments);
    } else {
      super.noSuchMethod(invocation);
    }
  }
}
@initMethod
upgradeCorePages() => registerDartType('core-pages', CorePages);
