import 'package:flutter/material.dart';
import 'package:stepper_a/src/interface/step_page/style_mixin.dart';

import '../../provider/stepper_provider.dart';

abstract class IStepPage {

  Widget buildHorizontalStep(StepperNotifier notifier);
  Widget buildVerticalStep(StepperNotifier notifier);
  Widget buildVerticalCustomStep(StepperNotifier notifier);
  Widget buildHorizontalCustomStep(StepperNotifier notifier);


}

abstract class ISingleStep with StyleMixin{
  Widget buildSingleIconStep(int index);
  Widget buildSingleImageStep(int index);
  Widget buildNormalStep(int index);
}