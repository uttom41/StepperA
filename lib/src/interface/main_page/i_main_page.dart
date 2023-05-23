import 'package:flutter/cupertino.dart';

import '../../provider/stepper_provider.dart';

abstract class IMainPage {

  Widget buildFloatingHorizontalStepper(StepperNotifier notifier);
  Widget buildFloatingVerticalStepper(StepperNotifier notifier);
  Widget buildNormalHorizontalStepper(StepperNotifier notifier);
  Widget buildNormalVerticalStepper(StepperNotifier notifier);

}