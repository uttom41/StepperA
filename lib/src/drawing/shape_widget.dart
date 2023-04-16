/// /*** Uttam kumar mitra ***/
/// create date 14/04/2023; 3:44 PM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/shape_painter.dart';

import '../../stepper_a.dart';

class ShapeWidget extends StatelessWidget {
  ///It is steps child widget.
  final Widget _child;

  ///It is only used for shape color.
  final Color _shapeColor;

  ///If you need different BorderShape
  ///default borderShape is [circle]
  final BorderShape _borderShape;

  ///It is only used for shape radius.
  /// A radius for either circular or elliptical shapes.
  final Radius _radius;

  ///If you need different BorderShape
  ///default borderShape is [circle]
  final TaskType _taskType;

  const ShapeWidget({
    Key? key,
    required child,
    required shapeColor,
    required borderShape,
    required radius,
    required taskType,
  })  : _child = child,
        _shapeColor = shapeColor,
        _borderShape = borderShape,
        _radius = radius,
        _taskType = taskType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(
        shapeColor: _shapeColor,
        radius: _radius,
        borderShape: _borderShape,
        taskType: _taskType,
      ),
      child: _child,
    );
  }
}
