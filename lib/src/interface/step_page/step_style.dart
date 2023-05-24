import 'package:flutter/material.dart';

import 'i_step_page.dart';
import '../../utils/stepper_model.dart';

mixin StepStyle on IStepPage {

  @override
  Widget buildHorizontalStep() {
    List<Widget> steps = [];
    for (int index = 0; index < StepperModel().notifier.totalIndex; index++) {
      /// step circles
   steps.add(
        Stack(children: [
          if (StepperModel().stepBorder)buildBorder(index),
          SizedBox(
            height: StepperModel().stepHeight,
            width: StepperModel().stepWidth,
            child: _getInnerElementOfStepper(index),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps,
    );
  }

  @override
  Widget buildVerticalStep() {
    List<Widget> steps = [];
    for (int index = 0; index < StepperModel().notifier.totalIndex; index++) {
      /// step circles
      steps.add(
        Stack(children: [
          if (StepperModel().stepBorder)buildBorder(index),
          SizedBox(
            height: StepperModel().stepHeight,
            width: StepperModel().stepWidth,
            child: _getInnerElementOfStepper(index),
          )
        ]),
      );

      ///line between step circles
      if (index != StepperModel().notifier.totalIndex - 1) {
        steps.add(
            buildLine(index, StepperModel().stepperSize.height)
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps
    );
  }

  @override
  Widget buildVerticalCustomStep() {
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
                  child: buildWidget(index, StepperModel().customSteps![index].image??Container()),
                )
              ]),
              if (index != StepperModel().notifier.totalIndex - 1)buildLine(index, StepperModel().stepperSize.width),
            ],
          ),
          Center(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps
    );
  }

  @override
  Widget buildHorizontalCustomStep() {
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
                  child: buildWidget(index, StepperModel().customSteps![index].image??Container()),
                )
              ]),
              if (index != StepperModel().notifier.totalIndex - 1)buildLine(index, StepperModel().stepperSize.width),
            ],
          ),
          Center(
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps,
    );
  }

  ///set stepper text and icon
  Widget _getInnerElementOfStepper(index) {
    if (index < StepperModel().notifier.currentIndex) {
      return buildWidget(index,const Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      ));
    } else if (index ==  StepperModel().notifier.currentIndex) {
      return buildWidget(index, Center(
        child: Text(
          '${ StepperModel().notifier.currentIndex + 1}',
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ));
    } else {
      return buildWidget(index,Center(
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ));
    }
  }

}