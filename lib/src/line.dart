import 'package:flutter/material.dart';
import 'package:stepper_a/src/page_helper/enums.dart';


class StepperLine extends StatelessWidget {
  final double lineThickness;
  final double length;
  final Color lineColor;
  final double dotRadius;
  final double spacing;
  final LineType lineType;
  /// Line Axis.
  final Axis axis;

  const StepperLine({
    Key? key,
    required this.lineThickness,
    required this.lineColor,
    required this.length,
    required this.lineType,
    required this.axis,
    this.dotRadius = 1.5,
    this.spacing = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildLine ();
  }

  Widget buildLine(){
    return AnimatedContainer(
      duration:  Duration(milliseconds: DURATION_TIME),
      margin: EdgeInsets.only(top: lineType == LineType.dotted ? dotRadius : 0),
      width: axis == Axis.horizontal
          ? length
          : lineType == LineType.straight
          ? dotRadius * lineThickness
          : 0,
      height: axis == Axis.vertical
          ? length
          : lineType == LineType.straight
          ? dotRadius * lineThickness
          : 0,
      decoration: lineType == LineType.straight
          ? BoxDecoration(
        color: lineColor,
        borderRadius: BorderRadius.circular(100),
      )
          : null,
      child: lineType == LineType.dotted
          ? CustomPaint(
        painter: _LinePainter(
          brush: Paint()..color = lineColor..strokeWidth=20,
          length: length,
          dotRadius: dotRadius,
          spacing: lineType == LineType.straight ? 0.0 : spacing,
          axis: axis,
        ),
      )
          : null,
    );
  }
}


class _LinePainter extends CustomPainter {
  final double length;
  final double dotRadius;
  final double spacing;
  final Paint brush;
  final Axis axis;

  _LinePainter({
    this.length = 100,
    required this.brush,
    this.dotRadius = 2.0,
    this.spacing = 3.0,
    this.axis = Axis.horizontal,
  }) : assert(dotRadius > 0, 'dotRadius must be greater than 0');

  @override
  void paint(Canvas canvas, Size size) {
    double start = 0.0;

    // Length of the line is calculated by dividing the supplied length [to] by dotRadius * space.

    late final int calculatedLength;
    if (spacing == 0) {
      calculatedLength = length ~/ dotRadius;
    } else {
      calculatedLength = length ~/ (dotRadius * spacing);
    }

    for (int i = 1; i < calculatedLength; i++) {
      // New start becomes:
      if (spacing == 0) {
        start += dotRadius;
      } else {
        start += dotRadius * spacing;
      }

      canvas.drawCircle(
        Offset(
          axis == Axis.horizontal ? start : 0.0,
          axis == Axis.horizontal ? 0.0 : start,
        ),
        dotRadius,
        brush,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CalculateLength{
  int stepSize;
  double size;
  double width;
  double height;
  CalculateLength({
    required this.size,
    required this.width,
    required this.height,
    required this.stepSize
  });

  double length(){
    double stepSiz = width  * stepSize;
    double lineSize = size -stepSiz;
    return (lineSize /(stepSize-1))-10;
  }
}
