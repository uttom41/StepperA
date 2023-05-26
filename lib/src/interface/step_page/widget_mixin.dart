
/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';

import '../../../stepper_a.dart';
import '../../drawing/path_widget.dart';
import '../../drawing/shape_widget.dart';
import '../../line.dart';
import '../../utils/stepper_model.dart';
import 'a_widget.dart';

mixin WidgetMixin on IWidget {

  @override
  Widget buildBorder(int index) {
    return Positioned.fill(
        child: PathWidget(
          notifier: StepperModel().notifier,
          borderShape: StepperModel().notifier.borderShape,
          borderType: StepperModel().notifier.borderType,
          dashPattern: StepperModel().notifier.dashPattern,
          radius: StepperModel().radius,
          pathColor: getBorderColor(index),
          strokeWidth: 3.0,
          taskType: index == StepperModel().notifier.currentIndex
              ? TaskType.inProgress
              : TaskType.pending,
          animationDirection: StepperModel().notifier.direction,
        ));
  }

  @override
  Widget buildLine(int index, double size) {
    return StepperLine(
      lineColor: getLineColor(index),
      length: CalculateLength(
          size: size,
          width: StepperModel().stepWidth,
          height: StepperModel().stepHeight,
          stepSize: StepperModel().notifier.totalIndex)
          .length(),
      lineThickness: StepperModel().lineThickness,
      lineType: StepperModel().notifier.lineType,
      axis: StepperModel().stepperAxis,
    );
  }

  @override
  Widget buildWidget(int index, Widget child) {
    return AnimatedContainer(
      margin: StepperModel().stepBorder ? StepperModel().step.margin : null,
      duration: const Duration(milliseconds: durationTime),
      child: ShapeWidget(
        shapeColor: getCircleColor(index),
        borderShape: StepperModel().notifier.borderShape,
        radius: StepperModel().radius,
        taskType: index == StepperModel().notifier.currentIndex
            ? TaskType.inProgress
            : TaskType.pending,
        child: FittedBox(child: child),
      ),
    );
  }

}