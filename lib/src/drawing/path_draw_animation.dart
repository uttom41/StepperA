/// Uttam kumar mitra
/// create date 10/04/2023; 12:21 AM
///
///
import 'dart:ui';
import 'drawing_helper.dart';

///This class provide animation path with percent wise.
class DrawAnimationPath {
  final Path _originalPath;
  final double _animationPercent;
  final AnimationDirection _animationDirection;

  const DrawAnimationPath(
      {required Path path,
      required double percent,
      required AnimationDirection animationDirection})
      : _originalPath = path,
        _animationPercent = percent,
        _animationDirection = animationDirection;

  Path drawAnimation() {
    /// ComputeMetrics can only be iterated once!
    final totalLength = _originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
    final currentLength = totalLength * _animationPercent;

    return _extractPathUntilLength(_originalPath, currentLength);
  }

  Path _extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = _animationDirection == AnimationDirection.clockwise
        ? originalPath.computeMetrics().iterator
        : originalPath.computeMetrics().toList().reversed.iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = _animationDirection == AnimationDirection.clockwise
            ? metric.extractPath(0.0, remainingLength)
            : metric.extractPath(
                metric.length - remainingLength, metric.length);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
