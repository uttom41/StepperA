/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/path_draw.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';
import 'calculate_perfect_size.dart';
import 'dash_draw.dart';
import 'path_draw_animation.dart';
import 'drawing_helper.dart';

class PathPainters extends CustomPainter {
  final Color _lineColor;
  final BorderType _borderType;
  final Animation<double> _animation;
  final double _strokeWidth;
  final Radius _radius;
  final int _startingPercentage;
  final BorderShape _pathType;
  final TaskType _taskType;
  final AnimationDirection _animationDirection;
  final List<double> _dashPattern;

  PathPainters({
    required lineColor,
    required borderType,
    required borderShape,
    required taskType,
    required animationDirection,
    required animation,
    required dashPattern,
    double strokeWidth = 2.0,
    Color strokeColor = Colors.blueGrey,
    Radius radius = const Radius.circular(4.0),
    int startingPercentage = 0,
  })  : assert(strokeWidth > 0, 'strokeWidth must be greater than 0.'),
        assert(startingPercentage >= 0 && startingPercentage <= 100,
            'startingPercentage must lie between 0 and 100.'),
        _animation = animation,
        _strokeWidth = strokeWidth,
        _radius = radius,
        _startingPercentage = startingPercentage,
        _lineColor = lineColor,
        _borderType = borderType,
        _pathType = borderShape,
        _taskType = taskType,
        _animationDirection = animationDirection,
        _dashPattern = dashPattern,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    //  Path _originalPath;
    ///background line paint drawing.
    Paint line = Paint()
      ..color = _lineColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..shader = null
      ..strokeWidth = _strokeWidth;

    /// calculate animate current value
    final animationPercent = _animation.value;

    // Construct original path once when animation starts
    // if (animationPercent == 0.0) {
    Path originalPath = PathDrawing(
            size: size,
            pathType: _pathType,
            radius: _radius,
            startingPercentage: _startingPercentage)
        .createPath();
    //  }

    ///solid background line drawing
    if (_borderType == BorderType.dash) {
      if (_taskType != TaskType.inProgress) {
        canvas.drawPath(
          Dash(
                  source: originalPath,
                  dashArray: CircularIntervalList<double>(_dashPattern))
              .dashDraw(),
          line,
        );
      } else {
        ///complete shape
        final currentPath = DrawAnimationPath(
          animationDirection: _animationDirection,
          path: originalPath,
          percent: animationPercent,
        ).drawAnimation();

        canvas.drawPath(currentPath, line);
      }
    } else {
      ///for line shape
      if (_taskType != TaskType.inProgress) {
        canvas.drawPath(originalPath, line);
      } else {
        ///complete shape
        final currentPath = DrawAnimationPath(
          animationDirection: _animationDirection,
          path: originalPath,
          percent: animationPercent,
        ).drawAnimation();

        canvas.drawPath(currentPath, line);
         // if(StepperModel().notifier.loadingPage){
         //   canvas.drawPath(currentPath, line);
         //   StepperModel().notifier.loadingPage= false;
         // }else{
         //   canvas.drawPath(originalPath, line);
         // }

       }
    }
  }

  @override
  bool shouldRepaint(PathPainters oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainters oldDelegate) => false;
}
