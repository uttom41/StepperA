import 'package:flutter/material.dart';

import '../../provider/stepper_provider.dart';
import 'i_step_page.dart';
import '../../step_helper/utils.dart';
import '../../utils/stepper_model.dart';

mixin StepStyle on IStepPage {

  @override
  Widget buildHorizontalStep(StepperNotifier notifier) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils(
          notifier: notifier,
          strokeWidth: 3.0)
          .steps(),
    );
  }

  @override
  Widget buildVerticalStep(StepperNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils(
          notifier: notifier,
          strokeWidth: 3.0)
          .steps(),
    );
  }

  @override
  Widget buildHorizontalIconStep(StepperNotifier notifier) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils(
          notifier: notifier,
          strokeWidth: 3.0)
          .customSteps(StepperModel().customSteps!),
    );
  }

  @override
  Widget buildVerticalIconStep(StepperNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils(
          notifier: notifier,
          strokeWidth: 3.0)
          .customSteps(StepperModel().customSteps!),
    );
  }

  @override
  Widget buildHorizontalImageStep(StepperNotifier notifier);

  @override
  Widget buildVerticalImageStep(StepperNotifier notifier);

}