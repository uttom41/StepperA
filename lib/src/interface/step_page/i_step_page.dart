
/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/interface/step_page/widget_mixin.dart';

import '../calculate.dart';
import 'a_widget.dart';

abstract class IStepPageComponent extends IWidget {}

abstract class IStepPage extends IStepPageComponent with WidgetMixin,CalculateSize{

  List<Widget> buildNumberStep();
  List<Widget> buildCustomStep();
  Widget buildInnerElementOfStepper(index);
  Widget buildCustomInnerElementOfStepper(index);

}