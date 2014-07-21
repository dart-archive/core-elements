// DO NOT EDIT: auto-generated with core_elements/src/codegen.dart

/// Dart API for the polymer element `core_animation_group`.
library core_elements.core_animation_group;

import 'dart:html';
import 'dart:js' show JsArray, JsObject;
import 'package:web_components/interop.dart' show registerDartType;
import 'package:polymer/polymer.dart' show initMethod;
import 'core_animation.dart';

/// `core-animation-group` combines `core-animation` or `core-animation-group` elements to
/// create a grouped web animation. The group may be parallel (type is `par`) or sequential
/// (type is `seq`). Parallel groups play all the children elements simultaneously, and
/// sequential groups play the children one after another.
///
/// Example of an animation group to rotate and then fade an element:
///
///     <core-animation-group type="seq">
///       <core-animation id="fadeout" duration="500">
///         <core-animation-keyframe>
///           <core-animation-prop name="transform" value="rotate(0deg)"></core-animation-prop>
///           <core-animation-prop name="transform" value="rotate(45deg)"></core-animation-prop>
///         </core-animation-keyframe>
///       </core-animation>
///       <core-animation id="fadeout" duration="500">
///         <core-animation-keyframe>
///           <core-animation-prop name="opacity" value="1"></core-animation-prop>
///         </core-animation-keyframe>
///         <core-animation-keyframe>
///           <core-animation-prop name="opacity" value="0"></core-animation-prop>
///         </core-animation-keyframe>
///       </core-animation>
///     </core-animation-group>
class CoreAnimationGroup extends CoreAnimation {
  CoreAnimationGroup.created() : super.created();

  /// The type of the animation group. 'par' creates a parallel group and 'seq' creates
  /// a sequential group.
  String get type => jsElement['type'];
  set type(String value) { jsElement['type'] = value; }

  /// If target is set, any children without a target will be assigned the group's
  /// target when this property is set.
  get target => jsElement['target'];
  set target(value) { jsElement['target'] = (value is Map || value is Iterable) ? new JsObject.jsify(value) : value;}

  /// For a `core-animation-group`, a duration of "auto" means the duration should
  /// be the specified duration of its children. If set to anything other than
  /// "auto", any children without a set duration will be assigned the group's duration.
  num get duration => jsElement['duration'];
  set duration(num value) { jsElement['duration'] = value; }

  get childAnimationElements => jsElement['childAnimationElements'];

  get childAnimations => jsElement['childAnimations'];
}
@initMethod
upgradeCoreAnimationGroup() => registerDartType('core-animation-group', CoreAnimationGroup);
