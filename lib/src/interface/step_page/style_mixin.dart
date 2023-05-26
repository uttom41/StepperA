
/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

mixin StyleMixin {
  ///Set step circle color

  Color getCircleColor(i) {
    Color color;
    if (i < StepperModel().notifier.currentIndex) {
      color = StepperModel().step.completeStepColor;
      // (StepperModel().customSteps != null && StepperModel().customSteps![i].image != null)
      //     ?Colors.transparent
      //     :StepperModel().step.completeStepColor;

    } else if (i == StepperModel().notifier.currentIndex) {
      color = (StepperModel().step.loadingWidget != null)
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