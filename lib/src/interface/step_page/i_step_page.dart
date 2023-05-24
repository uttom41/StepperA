import 'package:flutter/material.dart';
import 'package:stepper_a/src/interface/step_page/widget_mixin.dart';

import 'a_widget.dart';

abstract class IStepPageComponent extends IWidget {}

abstract class IStepPage extends IStepPageComponent with WidgetMixin{

  Widget buildHorizontalStep();
  Widget buildHorizontalCustomStep();
//  Widget buildHorizontalIconStep();
 // Widget buildHorizontalImageStep();
 // Widget buildHorizontalProgressStep();
  Widget buildVerticalStep();
  Widget buildVerticalCustomStep();
 // Widget buildVerticalIconStep();
  //Widget buildVerticalImageStep();
  //Widget buildVerticalProgressStep();

}