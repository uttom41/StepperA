/// /*** Uttam kumar mitra ***/
/// create date 14/04/2023; 12:41 AM
///
///

import 'package:flutter/material.dart';
import '../interface/calculate.dart';
import '../interface/step_page/i_step_page.dart';
import '../interface/step_page/step_style.dart';
import '../interface/step_page/style_mixin.dart';
import '../interface/step_page/widget_mixin.dart';
import '../line.dart';
import '../utils/stepper_model.dart';

abstract class AStepperStep extends StatelessWidget implements IStepPage {
  const AStepperStep({super.key});
  
}

class StepperStep extends AStepperStep with StepStyle,CalculateSize,StyleMixin,WidgetMixin {

   StepperStep({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color:  StepperModel().stepperBackgroundColor,
      height: stepperSizeCalculate().height,
      width:  stepperSizeCalculate().width,
      child: SingleChildScrollView(
        scrollDirection: StepperModel().stepperAxis,
        controller: StepperModel().notifier.getStepScrollController(
            itemWidth: StepperModel().stepWidth,
            lineWidth: CalculateLength(
                    size:  stepperSizeCalculate().width,
                    width: StepperModel().stepWidth,
                    height: StepperModel().stepHeight,
                    stepSize: StepperModel().notifier.totalIndex)
                .length(),
            screenWidth: StepperModel().stepperAxis == Axis.horizontal
                ? stepperSizeCalculate().width
                :  stepperSizeCalculate().height),
        child: Container(
          padding: StepperModel().padding,
          margin: StepperModel().margin,
          alignment: Alignment.center,
          child: StepperModel().stepperAxis == Axis.horizontal
              ? buildHorizontal()
              : buildVertical(),
        ),
      ),
    );
  }

  Widget buildHorizontal() {
    return StepperModel().customSteps == null
        ? buildHorizontalStep()
        : buildHorizontalCustomStep();
  }

  Widget buildVertical() {
    return StepperModel().customSteps == null
        ? buildVerticalStep()
        : buildVerticalCustomStep();
  }
}
