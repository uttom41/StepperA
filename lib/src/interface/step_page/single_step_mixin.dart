
import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/path_widget.dart';
import 'package:stepper_a/src/interface/step_page/i_step_page.dart';
import 'package:stepper_a/src/line.dart';

import '../../../stepper_a.dart';
import '../../drawing/shape_widget.dart';
import '../../utils/stepper_model.dart';

mixin SingleStepMixin on ISingleStep {

  @override
  Widget buildSingleIconStep(int index) {
    var borderColor = getBorderColor(index);
    var lineColor = getLineColor(index);
    Widget step = StepperModel().stepperAxis == Axis.horizontal
        ?
    Column(
      children: [
        Row(
          children: [
            Stack(children: [
              if (StepperModel().stepBorder)
                Positioned.fill(
                    child: PathWidget(
                      notifier: StepperModel().notifier,
                      borderShape: StepperModel().notifier.borderShape,
                      borderType: StepperModel().notifier.borderType,
                      dashPattern: StepperModel().notifier.dashPattern,
                      radius: StepperModel().radius,
                      pathColor: borderColor,
                      strokeWidth: 3.0,
                      taskType: index == StepperModel().notifier.currentIndex
                          ? TaskType.inProgress
                          : TaskType.pending,
                      animationDirection: StepperModel().notifier.direction,
                    )),
              SizedBox(
                height: StepperModel().stepHeight,
                width: StepperModel().stepWidth,
                child: buildChild(StepperModel().customSteps![index].stepsIcon!, index),
              )
            ]),
            if (index != StepperModel().notifier.totalIndex - 1)
              StepperLine(
                lineColor: lineColor,
                length: CalculateLength(
                    size: StepperModel().stepperSize.height,///////////////////////////
                    width: StepperModel().stepWidth,
                    height: StepperModel().stepHeight,
                    stepSize: StepperModel().notifier.totalIndex)
                    .length(),
                lineThickness: StepperModel().lineThickness,
                lineType: StepperModel().notifier.lineType,
                axis: StepperModel().stepperAxis,
              ),
          ],
        ),
        if(StepperModel().customSteps![index].title != null)Center(
          child: Text(
            StepperModel().customSteps![index].title!,
            softWrap: true,
            style: TextStyle(
                fontSize: index == StepperModel().notifier.currentIndex ? 14 : 12,
                color: index == StepperModel().notifier.currentIndex
                    ? borderColor
                    : StepperModel().step.inactiveStepColor),
          ),
        )
      ],
    )
        :
    Row(
      children: [
        Column(
          children: [
            Stack(children: [
              if (StepperModel().stepBorder)
                Positioned.fill(
                    child: PathWidget(
                      notifier: StepperModel().notifier,
                      borderShape: StepperModel().borderShape,
                      borderType: StepperModel().borderType,
                      dashPattern: StepperModel().dashPattern,
                      radius: StepperModel().radius,
                      pathColor: borderColor,
                      strokeWidth: 3.0,
                      taskType: index == StepperModel().notifier.currentIndex
                          ? TaskType.inProgress
                          : TaskType.pending,
                      animationDirection: StepperModel().notifier.direction,
                    )),
              SizedBox(
                height: StepperModel().stepHeight,
                width: StepperModel().stepWidth,
                child: buildChild(StepperModel().customSteps![index].stepsIcon!, index),
              )
            ]),
            if (index != StepperModel().notifier.totalIndex - 1)
              StepperLine(
                lineColor: lineColor,
                length: CalculateLength(
                    size: StepperModel().stepperSize.height,////////////////////////
                    width: StepperModel().stepWidth,
                    height: StepperModel().stepHeight,
                    stepSize: StepperModel().notifier.totalIndex)
                    .length(),
                lineThickness: StepperModel().lineThickness,
                lineType: StepperModel().notifier.lineType,
                axis: StepperModel().stepperAxis,
              ),
          ],
        ),
        if(StepperModel().customSteps![index].title != null)Expanded(
          child: Center(
            child: Text(
              StepperModel().customSteps![index].title!,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: index == StepperModel().notifier.currentIndex ? 14 : 12,
                  color: index == StepperModel().notifier.currentIndex
                      ? borderColor
                      : StepperModel().step.inactiveStepColor),
            ),
          ),
        )
      ],
    );

    return step;
  }
  @override
  Widget buildSingleImageStep(int index) {
    return Container();
  }

  @override
  Widget buildNormalStep(int index) {///set stepper text and icon
      Widget getInnerElementOfStepper ;
      if (index < StepperModel().notifier.currentIndex) {
        getInnerElementOfStepper = _buildSteps(
            const Icon(
              Icons.check,
              color: Colors.white,
              size: 16.0,
            ),
            index);
      } else if (index == StepperModel().notifier.currentIndex) {
        getInnerElementOfStepper = _buildSteps(
            Center(
              child: Text(
                '${StepperModel().notifier.currentIndex + 1}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            index);
      } else {
        getInnerElementOfStepper = _buildSteps(
            Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            index);
      }
      return getInnerElementOfStepper;
  }



  Widget _buildSteps(Widget child, int index) {
    Color shapeColor = getCircleColor(index);
    return AnimatedContainer(
      margin: StepperModel().stepBorder ? StepperModel().step.margin : null,
      duration: const Duration(milliseconds: durationTime),
      child: ShapeWidget(
        shapeColor: shapeColor,
        borderShape: StepperModel().notifier.borderShape,
        radius: StepperModel().radius,
        taskType: index == StepperModel().notifier.currentIndex
            ? TaskType.inProgress
            : TaskType.pending,
        child: child,
      ),
    );
  }

  Widget buildChild(IconData icon, int i) {
    return _buildSteps(
        Icon(
          icon,
          color: Colors.white,
          size: 16.0,
        ),
        i);
  }
}