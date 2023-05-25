import 'package:flutter/material.dart';
import 'package:stepper_a/src/interface/step_page/widget_mixin.dart';

import 'a_widget.dart';

abstract class IStepPageComponent extends IWidget {}

abstract class IStepPage extends IStepPageComponent with WidgetMixin{

  List<Widget> buildNumberStep();
  List<Widget> buildCustomStep();
  Widget buildInnerElementOfStepper(index);
  Widget buildCustomInnerElementOfStepper(index);

}