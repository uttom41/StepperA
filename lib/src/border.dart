import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stepper_a/src/stepper_a.dart';


class StepperBorder extends StatelessWidget {
  final BorderType borderType;
  final BorderShape borderShape;
  final List<double> dashPattern;
  final Radius radius;
  final Color borderColor;

  const StepperBorder({
    Key? key,
    required this.borderType,
    required this.borderShape,
    required this.dashPattern,
    required this.radius,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BorderTypeStyle(
          borderShape: borderShape,
          borderType: borderType,
        dashPattern: dashPattern,
        radius: radius,
        borderColor: borderColor
      ),
    );
  }
}


class _BorderTypeStyle extends CustomPainter{

  final BorderType borderType;
  final BorderShape borderShape;
  final List<double> dashPattern;
  final Radius radius;
  final Paint p = Paint();
  final StrokeCap strokeCap;
  final Color borderColor;

  _BorderTypeStyle({
    required this.borderShape,
    required this.borderType,
    required this.dashPattern,
    required this.radius,
    this.strokeCap = StrokeCap.butt,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {

    p.strokeWidth = 2;
    p.color = borderColor;
    p.style = PaintingStyle.stroke;
    p.strokeCap = strokeCap;

    Path borderPath ;
    if(borderShape == BorderShape.circle){
      borderPath = _getCirclePath(size);
    }else{
      borderPath = _getRRectPath(size, radius);
    }

    if(borderType != BorderType.straight){
      borderPath = dashPath(borderPath, dashArray: CircularIntervalList(dashPattern));
    }

    canvas.drawPath(borderPath, p);
  }


  @override
  bool shouldRepaint(_BorderTypeStyle oldDelegate) {
    return true;
  }

  /// Returns a circular path of [size]
  Path _getCirclePath(Size size) {
    double w = size.width;
    double h = size.height;
    double s = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w > s ? (w - s) / 2 : 0,
            h > s ? (h - s) / 2 : 0,
            s,
            s,
          ),
          Radius.circular(s / 2),
        ),
      );
  }
  
  /// Returns a Rounded Rectangular Path with [radius] of [size]
  Path _getRRectPath(Size size, Radius radius) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          radius,
        ),
      );
  }

  Path dashPath(
      Path source, {
        required CircularIntervalList<double> dashArray,
        DashOffset? dashOffset,
      }) {
    assert(dashArray != null); // ignore: unnecessary_null_comparison

    dashOffset = dashOffset ?? const DashOffset.absolute(0.0);

    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = dashOffset._calculate(metric.length);
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
        }
        distance += len;
        draw = !draw;
      }
    }

    return dest;
  }

}

enum _DashOffsetType { Absolute, Percentage }


class DashOffset {
  /// Create a DashOffset that will be measured as a percentage of the length
  /// of the segment being dashed.
  ///
  /// `percentage` will be clamped between 0.0 and 1.0.
  DashOffset.percentage(double percentage)
      : _rawVal = percentage.clamp(0.0, 1.0),
        _dashOffsetType = _DashOffsetType.Percentage;

  /// Create a DashOffset that will be measured in terms of absolute pixels
  /// along the length of a [Path] segment.
  const DashOffset.absolute(double start)
      : _rawVal = start,
        _dashOffsetType = _DashOffsetType.Absolute;

  final double _rawVal;
  final _DashOffsetType _dashOffsetType;

  double _calculate(double length) {
    return _dashOffsetType == _DashOffsetType.Absolute
        ? _rawVal
        : length * _rawVal;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is DashOffset &&
        other._rawVal == _rawVal &&
        other._dashOffsetType == _dashOffsetType;
  }

  @override
  int get hashCode => Object.hash(_rawVal, _dashOffsetType);
}


/// A circular array of dash offsets and lengths.
///
/// For example, the array `[5, 10]` would result in dashes 5 pixels long
/// followed by blank spaces 10 pixels long.  The array `[5, 10, 5]` would
/// result in a 5 pixel dash, a 10 pixel gap, a 5 pixel dash, a 5 pixel gap,
/// a 10 pixel dash, etc.
///
/// Note that this does not quite conform to an [Iterable<T>], because it does
/// not have a moveNext.
class CircularIntervalList<T> {
  CircularIntervalList(this._vals);

  final List<T> _vals;
  int _idx = 0;

  T get next {
    if (_idx >= _vals.length) {
      _idx = 0;
    }
    return _vals[_idx++];
  }
}

