import 'package:flutter/material.dart';

import 'i_step_page.dart';
import '../../utils/stepper_model.dart';

mixin StepStyle on IStepPage {

  @override
  List<Widget> buildNumberStep() {
    List<Widget> steps = [];
    for (int index = 0; index < StepperModel().notifier.totalIndex; index++) {
      /// step circles
   steps.add(
        Stack(children: [
          if (StepperModel().stepBorder)buildBorder(index),
          SizedBox(
            height: StepperModel().stepHeight,
            width: StepperModel().stepWidth,
            child: buildInnerElementOfStepper(index),
          )
        ]),
      );

      ///line between step circles
      if (index != StepperModel().notifier.totalIndex - 1) {
        steps.add(
          buildLine(index, StepperModel().stepperSize.width)
        );
      }
    }
   return steps;
  }


  @override
  List<Widget> buildCustomStep() {
    List<Widget> steps = [];
    for (int index = 0; index < StepperModel().notifier.totalIndex; index++) {
      steps.add(Column(
        children: [
          Row(
            children: [
              Stack(children: [
                if (StepperModel().stepBorder)buildBorder(index),
                SizedBox(
                  height: StepperModel().stepHeight,
                  width: StepperModel().stepWidth,
                  child: buildCustomInnerElementOfStepper(index),
                )
              ]),
              if (index != StepperModel().notifier.totalIndex - 1)buildLine(index, StepperModel().stepperSize.width),
            ],
          ),
          if(StepperModel().customSteps![index].title != null)Center(
            child: Text(
              StepperModel().customSteps![index].title??"",
              softWrap: true,
              style: TextStyle(
                  fontSize: index ==  StepperModel().notifier.currentIndex ? 14 : 12,
                  color: index ==  StepperModel().notifier.currentIndex
                      ? getBorderColor(index)
                      : StepperModel().step.inactiveStepColor),
            ),
          )
        ],
      ));
    }
    return steps;
  }

  @override
  Widget buildCustomInnerElementOfStepper(index) {
    if(StepperModel().customSteps![index].image == null && StepperModel().customSteps![index].stepsIcon == null){
     return throw("Please Step Icon or Image provide");
    }
    if (index ==  StepperModel().notifier.currentIndex &&  StepperModel().customSteps![index].loadingWidget != null) {
      return buildWidget(index, StepperModel().customSteps![index].loadingWidget!);
    }
    return buildWidget(index, StepperModel().customSteps![index].image?? Icon(
      StepperModel().customSteps![index].stepsIcon!,
      color: Colors.white,
      size: 16.0,
    ));
  }

  ///set stepper text and icon
  @override
  Widget buildInnerElementOfStepper(index) {
    if (index < StepperModel().notifier.currentIndex) {
      return buildWidget(index, Icon(
        StepperModel().step.completeStepIcon??Icons.check,
        color: Colors.white,
        size: 16.0,
      ));
    } else if (index ==  StepperModel().notifier.currentIndex) {
      return buildWidget(index, Center(
        child: StepperModel().step.loadingWidget??Text(
          '${ StepperModel().notifier.currentIndex + 1}',
          style: StepperModel().step.numberStepTextStyle??const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ));
    } else {
      return buildWidget(index,Center(
        child: Text(
          '${index + 1}',
          style: StepperModel().step.numberStepTextStyle??const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ));
    }
  }

}