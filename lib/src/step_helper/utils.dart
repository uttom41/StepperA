/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 11:41 PM
///
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

import '../drawing/drawing_helper.dart';
import '../drawing/path_widget.dart';
import '../line.dart';

class Utils {
  ///for Stepper state management
  final StepperNotifier _notifier;

  ///for Step border radius
  final Radius _radius;

  ///for stepper height and width
  final double _stepperSize;

  ///for step width
  final double _stepWidth;

  ///for step height
  final double _stepHeight;

  ///for step padding
  final EdgeInsets _padding;

  ///for stepper line thickness
  final double _lineThickness;

  ///for stepper strokeWidth
  final double _strokeWidth;

  const Utils(
      {required notifier,
      required radius,
      required stepperSize,
      required stepWidth,
      required stepHeight,
      required padding,
      required lineThickness,
      required strokeWidth})
      : _notifier = notifier,
        _radius = radius,
        _stepperSize = stepperSize,
        _stepWidth = stepWidth,
        _stepHeight = stepHeight,
        _padding = padding,
        _lineThickness = lineThickness,
        _strokeWidth = strokeWidth;

  /// build all step
  List<Widget> steps() {
    var list = <Widget>[];
    for (int i = 0; i < _notifier.totalIndex; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);

      /// step circles
      list.add(
        Stack(children: [
          Positioned.fill(
              child: PathWidget(
            notifier: _notifier,
            borderShape: _notifier.borderShape,
            borderType: _notifier.borderType,
            dashPattern: _notifier.dashPattern,
            radius: _radius,
            pathColor: borderColor,
            strokeWidth: _strokeWidth,
            taskType: i == _notifier.currentIndex
                ? TaskType.inProgress
                : TaskType.pending,
            animationDirection: _notifier.direction,
          )),
          Container(
            height: _stepHeight,
            width: _stepWidth,
            padding: _padding,
            child: _getInnerElementOfStepper(i),
          )
        ]),
      );

      ///line between step circles
      if (i != _notifier.totalIndex - 1) {
        list.add(
          StepperLine(
            lineColor: lineColor,
            length: CalculateLength(
                    size: _stepperSize,
                    width: _stepWidth,
                    height: _stepHeight,
                    stepSize: _notifier.totalIndex)
                .length(),
            lineThickness: _lineThickness,
            lineType: _notifier.lineType,
            axis: _notifier.stepperAxis,
          ),
        );
      }
    }
    return list;
  }

  ///Set step circle color
  Color _getCircleColor(i) {
    Color color;
    if (i < _notifier.currentIndex) {
      color = _notifier.stepCompleteColor;
    } else if (i == _notifier.currentIndex) {
      color = _notifier.currentStepColor;
    } else {
      color = _notifier.inactiveColor;
    }
    return color;
  }

  ///Set step border color
  Color _getBorderColor(i) {
    Color color;
    if (i < _notifier.currentIndex) {
      color = _notifier.stepCompleteColor;
    } else if (i == _notifier.currentIndex) {
      color = _notifier.currentStepColor;
    } else {
      color = _notifier.inactiveColor;
    }
    return color;
  }

  ///set stepper line color
  Color _getLineColor(i) {
    Color color;
    if (i < _notifier.currentIndex - 1) {
      color = _notifier.stepCompleteColor;
    } else if (i == _notifier.currentIndex - 1) {
      color = _notifier.currentStepColor;
    } else {
      color = _notifier.inactiveColor;
    }
    return color;
  }

  ///set stepper text and icon
  Widget _getInnerElementOfStepper(index) {
    Color circleColor = _getCircleColor(index);
    if (index < _notifier.currentIndex) {
      return AnimatedContainer(
        margin: EdgeInsets.all(8),
        duration: const Duration(milliseconds: durationTime),
        decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 16.0,
        ),
      );
    } else if (index == _notifier.currentIndex) {
      return AnimatedContainer(
        margin: EdgeInsets.all(8),
        duration: const Duration(milliseconds: durationTime),
        decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
        child: Center(
          child: Text(
            '${_notifier.currentIndex + 1}',
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      );
    } else {
      return AnimatedContainer(
        margin: EdgeInsets.all(8),
        duration: const Duration(milliseconds: durationTime),
        decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      );
    }
  }
}
