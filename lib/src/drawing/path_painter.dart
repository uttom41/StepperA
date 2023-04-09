/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/path_draw.dart';
import 'calculate_perfect_size.dart';
import 'dash_draw.dart';
import 'path_draw_animation.dart';
import 'drawing_helper.dart';

class PathPainters extends CustomPainter {
  final Color _lineColor;
  final Color _completeColor;
  final BorderType _borderType;
  final Animation<double> _animation;
  final double _strokeWidth;
  final Radius _radius;
  final int _startingPercentage;
  final PathType _pathType;

  PathPainters({
    required lineColor,
    required completeColor,
    required circleBorder,
    required pathType,
    required animation,
    double strokeWidth = 2.0,
    Color strokeColor = Colors.blueGrey,
    Radius radius = const Radius.circular(4.0),
    int startingPercentage = 0,
  }): assert(strokeWidth > 0, 'strokeWidth must be greater than 0.'),
        assert(startingPercentage >= 0 && startingPercentage <= 100,
        'startingPercentage must lie between 0 and 100.'),
        _animation = animation,
        _strokeWidth = strokeWidth,
        _radius = radius,
        _startingPercentage = startingPercentage,
        _lineColor = lineColor,
        _completeColor = completeColor,
        _borderType = circleBorder,
        _pathType= pathType,
        super(repaint: animation);



  late Path _originalPath;

  @override
  void paint(Canvas canvas, Size size) {

    ///background line paint drawing.
    Paint line = Paint()
      ..color = _lineColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..shader = null
      ..strokeWidth = _strokeWidth;

    ///complete line paint drawing.
    Paint complete = Paint()
      ..color = _completeColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..shader = null
      ..strokeWidth = _strokeWidth;

    /// calculate animate current value
    final animationPercent = _animation.value;

    ///solid background line drawing
    if(_borderType== BorderType.dash){
      final rect =  RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
        const Radius.circular(15),
      );
      // final rect = Offset.zero & size;
      final path = Path()
        ..addRRect(rect)
        ..close();

      canvas.drawPath(
        Dash(source: path,
            dashArray: CircularIntervalList<double>(<double>[10, 15])
        ).dashDraw(),
        line,
      );

      ///complete shape

      // Construct original path once when animation starts
      if (animationPercent == 0.0) {
        _originalPath = PathDrawing(
            size: size,
            pathType: _pathType,
            radius: _radius,
            startingPercentage: _startingPercentage
        ).createPath();

      }

      final currentPath = DrawAnimationPath(
        animationDirection: AnimationDirection.clockwise,
        path:  _originalPath,
        percent: animationPercent,
      ).drawAnimation();

      canvas.drawPath(currentPath, complete);
    }else{
      ///for line shape
      ///

      ///complete shape

      // Construct original path once when animation starts
      if (animationPercent == 0.0) {
        _originalPath = PathDrawing(
            size: size,
            pathType: _pathType,
          radius: _radius,
          startingPercentage: _startingPercentage
        ).createPath();

      }

      final currentPath = DrawAnimationPath(
        animationDirection: AnimationDirection.clockwise,
        path:  _originalPath,
        percent: animationPercent,
      ).drawAnimation();

      canvas.drawPath(currentPath, line);

    }
  }

  @override
  bool shouldRepaint(PathPainters oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainters oldDelegate) => false;

}
