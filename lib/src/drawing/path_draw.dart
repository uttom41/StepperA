
/// Uttam kumar mitra
/// create date 10/04/2023; 12:46 AM
///
///
import 'dart:ui';

import 'drawing_helper.dart';

class PathDrawing{
  final Size _size;
  final PathType _pathType;
  final double _strokeWidth;
  final int _startingPercentage;
  final Radius _radius;

  const PathDrawing({
    required Size size,
    required PathType pathType,
    double strokeWidth = 2.0,
    Radius radius = const Radius.circular(4.0),
    int startingPercentage = 0,
  }):_size = size,
        _pathType= pathType,
        _strokeWidth = strokeWidth,
        _radius = radius,
        _startingPercentage = startingPercentage;


  Path createPath() {
    switch (_pathType) {
      case PathType.rect:
        return _createOriginalPathRect();
      case PathType.rRect:
        return _createOriginalPathRRect();
      case PathType.circle:
        return _createOriginalPathCircle();
      case PathType.diamond:
        return _createOriginalPathCircle();
      case PathType.triangle:
        return _createOriginalPathCircle();
    }
  }

  Path _createOriginalPathRect() {
    Path originalPath = Path()
      ..addRect(
        Rect.fromLTWH(0, 0, _size.width, _size.height),
      )
      ..lineTo(0, -(_strokeWidth / 2));
    if (_startingPercentage > 0 && _startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath);
    }
    return originalPath;
  }

  Path _createOriginalPathRRect() {
    Path originalPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, _size.width, _size.height),
          _radius,
        ),
      );
    if (_startingPercentage > 0 && _startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath);
    }
    return originalPath;
  }

  Path _createOriginalPathCircle() {
    Path originalPath = Path()
      ..addOval(
        Rect.fromLTWH(0, 0, _size.width, _size.height),
      );
    if (_startingPercentage > 0 && _startingPercentage < 100) {
      return _createPathForStartingPercentage(originalPath);
    }
    return originalPath;
  }

  Path _createPathForStartingPercentage(Path originalPath) {
    // Assumes that original path consists of one sub path only
    final pathMetrics = originalPath.computeMetrics().first;
    final pathCutoffPoint = (_startingPercentage / 100) * pathMetrics.length;
    final firstSubPath = pathMetrics.extractPath(0, pathCutoffPoint);
    final secondSubPath =
    pathMetrics.extractPath(pathCutoffPoint, pathMetrics.length);
    if (_pathType == PathType.rect) {
      Path path = Path()
        ..addPath(secondSubPath, Offset.zero)
        ..lineTo(0, -(_strokeWidth / 2))
        ..addPath(firstSubPath, Offset.zero);
      switch (_startingPercentage) {
        case 25:
          path.lineTo(_size.width + _strokeWidth / 2, 0);
          break;
        case 50:
          path.lineTo(_size.width - _strokeWidth / 2, _size.height);
          break;
        case 75:
          path.lineTo(0, _size.height + _strokeWidth / 2);
          break;
        default:
      }
      return path;
    }
    return Path()
      ..addPath(secondSubPath, Offset.zero)
      ..addPath(firstSubPath, Offset.zero);
  }

}