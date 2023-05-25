
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

mixin StyleMixin {
  ///Set step circle color

  Color getCircleColor(i) {
    Color color;
    if (i < StepperModel().notifier.currentIndex) {
      color = StepperModel().step.completeStepColor;
    } else if (i == StepperModel().notifier.currentIndex) {
      color = (StepperModel().step.loadingWidget != null && StepperModel().customSteps == null)
          ?Colors.transparent
          :StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

  ///Set step border color
  Color getBorderColor(i) {
    Color color;
    if (i < StepperModel().notifier.currentIndex) {
      color = StepperModel().step.completeStepColor;
    } else if (i == StepperModel().notifier.currentIndex) {
      color = StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

  ///set stepper line color
  Color getLineColor(i) {
    Color color;
    if (i < StepperModel().notifier.currentIndex - 1) {
      color = StepperModel().step.completeStepColor;
    } else if (i == StepperModel().notifier.currentIndex - 1) {
      color = StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

}