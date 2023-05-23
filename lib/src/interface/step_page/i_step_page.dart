import 'package:flutter/material.dart';

import '../../provider/stepper_provider.dart';

abstract class IStepPage {

  Widget buildHorizontalStep(StepperNotifier notifier);
  Widget buildVerticalStep(StepperNotifier notifier);
  Widget buildHorizontalIconStep(StepperNotifier notifier);
  Widget buildVerticalIconStep(StepperNotifier notifier);
  Widget buildHorizontalImageStep(StepperNotifier notifier);
  Widget buildVerticalImageStep(StepperNotifier notifier);

}