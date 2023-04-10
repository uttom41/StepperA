/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///
///IF you need different Step border style
///default border style is [straight]
enum BorderType{
  dash,
  straight
}

///If you need different BorderShape
///default borderShape is [circle]
enum BorderShape {
  rect,
  rRect,
  circle,
  diamond,
  triangle
}

/// animation step border line
enum AnimationDirection {
  clockwise,
  anticlockwise,
}

///If need different Stepper line style
///default stepper line style is [straight]
enum LineType {
  straight,
  dotted,
}

///Task Type
enum TaskType{
  complete,
  pending,
  inProgress
}

/// Stepper animation static duration
const int durationTime = 300;