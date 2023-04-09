
import 'dart:math';

import 'package:flutter/material.dart';

import 'calculate_perfect_size.dart';
import 'dash_draw.dart';
import 'drawing_helper.dart';



class CirclePainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double strokeWidth;
  BorderType circleBorder;

  CirclePainter({
    required this.lineColor,
    required this.completeColor,
    required this.completePercent,
    required this.strokeWidth,
    required this.circleBorder
  });

  @override
  void paint(Canvas canvas, Size size) {
    ///background line paint drawing.
    Paint line = Paint()
      ..color = lineColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..shader = null
      ..strokeWidth = strokeWidth;

    ///complete line paint drawing.
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..shader = null
      ..strokeWidth = strokeWidth;

    ///calculate circle center and radius
    Offset center  = Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);

    /// calculate line angle
    double arcAngle = 2*pi* (completePercent/100);

    ///solid background line drawing
    if(BorderType.solid == circleBorder){
      canvas.drawCircle(
          center,
          radius,
          line
      );

      canvas.drawArc(
          Rect.fromCircle(center: center,radius: radius),
          -pi/2,
          arcAngle,
          false,
          complete
      );
    }else{
      final path = Path()
        ..addOval(Rect.fromCircle(center: center, radius: radius))
        ..close();

      canvas.drawPath(
        Dash(source: path,
            dashArray: CircularIntervalList<double>(<double>[10, 15])
        ).dashDraw(),
        line,
      );

      canvas.drawArc(
          Rect.fromCircle(center: center,radius: radius),
          -pi/2,
          arcAngle,
          false,
          complete
      );
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}