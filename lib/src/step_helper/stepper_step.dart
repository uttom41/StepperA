/// /*** Uttam kumar mitra ***/
/// create date 14/04/2023; 12:41 AM
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';
import '../interface/step_page/i_step_page.dart';
import '../interface/step_page/step_style.dart';
import '../line.dart';
import '../utils/stepper_model.dart';

abstract class AStepperStep extends StatelessWidget implements IStepPage {
  const AStepperStep({super.key});
  
}

class StepperStep extends AStepperStep with StepStyle {

  ///Stepper Notifier for internal state management
  final StepperNotifier notifier;
  
   StepperStep({super.key,
    required this.notifier,
  });

  @override
  Widget buildHorizontalStep(StepperNotifier notifier) {
    return buildHorizontalStep(notifier);
  }

  @override
  Widget buildVerticalStep(StepperNotifier notifier) {
    return buildVerticalStep(notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  StepperModel().stepperBackgroundColor,
      height:  StepperModel().stepperSize.height,
      width: StepperModel().stepperSize.width,
      child: SingleChildScrollView(
        scrollDirection: StepperModel().stepperAxis,
        controller: notifier.getStepScrollController(
            itemWidth: StepperModel().stepWidth,
            lineWidth: CalculateLength(
                    size: StepperModel().stepperSize.width,
                    width: StepperModel().stepWidth,
                    height: StepperModel().stepHeight,
                    stepSize: notifier.totalIndex)
                .length(),
            screenWidth: StepperModel().stepperAxis == Axis.horizontal
                ? StepperModel().stepperSize.width
                : StepperModel().stepperSize.height),
        child: Container(
          padding: StepperModel().padding,
          margin: StepperModel().margin,
          alignment: Alignment.center,
          child: StepperModel().stepperAxis == Axis.horizontal
              ? SizedBox(
            width: 350,
              height: 80,
              child: buildHorizontal()
          )
              : SizedBox(
            width: 80,
              height: 350,
              child: buildVertical()
          ),
        ),
      ),
    );
  }

  @override
  Widget buildHorizontalIconStep(StepperNotifier notifier) {
   return buildHorizontalIconStep(notifier);
  }

  @override
  Widget buildHorizontalImageStep(StepperNotifier notifier) {
    return buildHorizontalImageStep(notifier);
  }

  @override
  Widget buildVerticalIconStep(StepperNotifier notifier) {
    return buildVerticalIconStep(notifier);
  }

  @override
  Widget buildVerticalImageStep(StepperNotifier notifier) {
    return buildVerticalImageStep(notifier);
  }

  Widget buildHorizontal() {
    return StepperModel().customSteps == null
        ? buildHorizontalStep(notifier)
        : buildHorizontalIconStep(notifier);
  }

  Widget buildVertical() {
    return StepperModel().customSteps == null
        ? buildVerticalStep(notifier)
        : buildVerticalIconStep(notifier);
  }
}
