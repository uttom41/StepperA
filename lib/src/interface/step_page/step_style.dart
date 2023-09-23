/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';

import 'i_step_page.dart';
import '../../utils/stepper_model.dart';

mixin StepStyle on IStepPage {
  @override
  List<Widget> buildNumberStep() {
    List<Widget> steps = [];
    for (int index = 0;
        index < StepperModel().notifier.getTotalSteps;
        index++) {
      /// step circles
      steps.add(
        Stack(children: [
          if (StepperModel().stepBorder) buildBorder(index),
          SizedBox(
            height: StepperModel().stepHeight,
            width: StepperModel().stepWidth,
            child: buildInnerElementOfStepper(index),
          )
        ]),
      );

      ///line between step circles
      if (index != StepperModel().notifier.getTotalSteps - 1) {
        steps.add(buildLine(
            index, StepperModel().stepperSize.width, getLineColor(index)));
      }
    }
    return steps;
  }

  ///todo: horizontal step text field alignment update
  @override
  List<Widget> buildCustomStep() {
    List<Widget> steps = [];
    for (int index = 0;
        index < StepperModel().notifier.getTotalSteps;
        index++) {
      steps.add(StepperModel().stepperAxis == Axis.horizontal
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(children: [
                      if (StepperModel().stepBorder) buildBorder(index),
                      SizedBox(
                        height: StepperModel().stepHeight,
                        width: StepperModel().stepWidth,
                        child: buildCustomInnerElementOfStepper(index),
                      )
                    ]),
                    if (index != StepperModel().notifier.getTotalSteps - 1)
                      buildLine(index, StepperModel().stepperSize.width,
                          getLineColor(index)),
                  ],
                ),
                if (StepperModel().customSteps![index].title != null)
                  Container(
                    padding: const EdgeInsets.only(top: 3),
                    alignment: Alignment.centerLeft,
                    width: StepperModel().stepWidth + 10,
                    child: Text(
                      StepperModel().customSteps![index].title ?? "",
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize:
                              index == StepperModel().notifier.currentIndex
                                  ? 14
                                  : 12,
                          color: index == StepperModel().notifier.currentIndex
                              ? getBorderColor(index)
                              : StepperModel().step.inactiveStepColor),
                    ),
                  )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  if (StepperModel().stepBorder) buildBorder(index),
                  SizedBox(
                    height: StepperModel().stepHeight,
                    width: StepperModel().stepWidth,
                    child: buildCustomInnerElementOfStepper(index),
                  )
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //if (index != StepperModel().notifier.getTotalSteps - 1)
                    buildLine(
                        index,
                        StepperModel().stepperSize.width,
                        index == StepperModel().notifier.currentIndex
                            ? StepperModel().step.currentStepColor
                            : getBorderColor(index),
                        2),
                    if (StepperModel().customSteps![index].title != null)
                      Text(
                        StepperModel().customSteps![index].title ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                            fontSize:
                                index == StepperModel().notifier.currentIndex
                                    ? 14
                                    : 12,
                            color: index == StepperModel().notifier.currentIndex
                                ? getBorderColor(index)
                                : StepperModel().step.inactiveStepColor),
                      ),
                    if (index != StepperModel().notifier.getTotalSteps - 1)
                      buildLine(index, StepperModel().stepperSize.width,
                          getLineColor(index), 2),
                  ],
                ),
              ],
            ));
    }
    return steps;
  }

  @override
  Widget buildCustomInnerElementOfStepper(index) {
    if (StepperModel().customSteps![index].image == null &&
        StepperModel().customSteps![index].stepsIcon == null) {
      return throw ("Please Step Icon or Image provide");
    }
    if (index == StepperModel().notifier.currentIndex &&
        StepperModel().step.loadingWidget != null) {
      return buildWidget(index, StepperModel().step.loadingWidget!);
    }
    return buildWidget(
        index,
        StepperModel().customSteps![index].image ??
            Icon(
              StepperModel().customSteps![index].stepsIcon!,
              color: Colors.white,
              size: 18.0,
            ));
  }

  ///set stepper text and icon
  @override
  Widget buildInnerElementOfStepper(index) {
    if (index < StepperModel().notifier.currentIndex) {
      return buildWidget(
          index,
          Icon(
            StepperModel().step.completeStepIcon ?? Icons.check,
            color: Colors.white,
            size: 16.0,
          ));
    } else if (index == StepperModel().notifier.currentIndex) {
      return buildWidget(
          index,
          Center(
            child: StepperModel().step.loadingWidget ??
                Text(
                  '${StepperModel().notifier.currentIndex + 1}',
                  style: StepperModel().step.numberStepTextStyle ??
                      const TextStyle(fontSize: 14, color: Colors.white),
                ),
          ));
    } else {
      return buildWidget(
          index,
          Center(
            child: Text(
              '${index + 1}',
              style: StepperModel().step.numberStepTextStyle ??
                  const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ));
    }
  }
}
