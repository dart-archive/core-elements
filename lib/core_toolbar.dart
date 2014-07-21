// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_toolbar`.
library core_elements.core_toolbar;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'package:core_elements/src/common.dart' show DomProxyMixin;

/// `core-toolbar` is a horizontal bar containing elements that can be used for
/// label, navigation, search and actions.
///
///     <core-toolbar>
///       <core-icon-button icon="menu" on-tap="{{menuAction}}"></core-icon-button>
///       <div flex>Title</div>
///       <core-icon-button icon="more" on-tap="{{moreAction}}"></core-icon-button>
///     </core-toolbar>
///
/// `core-toolbar` has a standard height, but can made be taller by setting `tall`
/// class on the `core-toolbar`.  This will make the toolbar 3x the normal height.
///
///     <core-toolbar class="tall">
///       <core-icon-button icon="menu"></core-icon-button>
///     </core-toolbar>
///
/// Apply `medium-tall` class to make the toolbar medium tall.  This will make the
/// toolbar 2x the normal height.
///
///     <core-toolbar class="medium-tall">
///       <core-icon-button icon="menu"></core-icon-button>
///     </core-toolbar>
///
/// When taller, elements can pin to either the top (default), middle or bottom.
///
///     <core-toolbar class="tall">
///       <core-icon-button icon="menu"></core-icon-button>
///       <div class="middle indent">Middle Title</div>
///       <div class="bottom indent">Bottom Title</div>
///     </core-toolbar>
///
/// To make an element completely fit at the bottom of the toolbar, use `fit` along
/// with `bottom`.
///
///     <core-toolbar class="tall">
///       <div id="progressBar" class="bottom fit"></div>
///     </core-toolbar>
class CoreToolbar extends HtmlElement with DomProxyMixin {
  CoreToolbar.created() : super.created();
}
@initMethod
upgradeCoreToolbar() => registerDartType('core-toolbar', CoreToolbar);
