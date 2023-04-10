/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/path_painter.dart';
import '../provider/stepper_provider.dart';
import 'drawing_helper.dart';

class PathWidget extends StatelessWidget {
  final StepperNotifier _notifier;
  final Color _pathColor;
  final double _strokeWidth;
  final BorderShape _borderShape;
  final BorderType _borderType;
  final Radius _radius;
  final TaskType _taskType;
  final AnimationDirection _animationDirection;
  final List<double> _dashPattern;

  const PathWidget({
    Key? key,
    required notifier,
    required pathColor,
    required strokeWidth,
    required borderShape,
    required borderType,
    required radius,
    required taskType,
    required animationDirection,
    required  dashPattern,
  }) :
        _notifier = notifier,
        _pathColor = pathColor,
        _strokeWidth = strokeWidth,
        _borderShape = borderShape,
        _borderType = borderType,
        _radius = radius,
        _taskType = taskType,
        _animationDirection = animationDirection,
        _dashPattern = dashPattern,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: PathPainters(
          lineColor: _pathColor,
          animation: _notifier.getAnimation(),
          strokeWidth: _strokeWidth,
          borderType: _borderType,
          startingPercentage: 50,
          radius: _radius,
          borderShape:_borderShape,
          animationDirection: _animationDirection,
          taskType: _taskType,
          dashPattern: _dashPattern
        ),
    );
  }
}
