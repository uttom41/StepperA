/// /*** Uttam kumar mitra ***/
/// create date 14/04/2023; 3:34 PM
///
///
///
///
import 'package:flutter/cupertino.dart';
import 'package:stepper_a/src/drawing/path_draw.dart';
import '../../stepper_a.dart';


class ShapePainter extends CustomPainter{

  ///It is only used for shape color.
  final  Color _shapeColor;

  /// A complex, one-dimensional subset of a plane.
  ///
  /// A path consists of a number of sub-paths, and a _current point_.
  ///
  /// Sub-paths consist of segments of various types, such as lines,
  /// arcs, or beziers. Sub-paths can be open or closed, and can
  /// self-intersect.
  ///
  /// Closed sub-paths enclose a (possibly discontinuous) region of the
  /// plane based on the current [fillType].

  late Path shape;

  ///It is only used for shape radius.
  /// A radius for either circular or elliptical shapes.
  final Radius _radius;

  ///If you need different BorderShape
  ///default borderShape is [circle]
  final BorderShape _pathType;


   ShapePainter({
    required shapeColor,
    required borderShape,
    required taskType,
    Radius radius = const Radius.circular(4.0),
  }):_radius = radius,
        _shapeColor = shapeColor,
        _pathType= borderShape;

  @override
  void paint(Canvas canvas, Size size) {
    ///background shape paint drawing.
    Paint line = Paint()
      ..color = _shapeColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round
      ..shader = null;

    shape = PathDrawing(
        size: size,
        pathType: _pathType,
        radius: _radius,
    ).createPath();

    canvas.drawPath(shape, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}