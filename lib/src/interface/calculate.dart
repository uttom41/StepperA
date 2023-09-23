/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';

import '../utils/stepper_model.dart';

mixin CalculateSize {
  Size stepperSizeCalculate() {
    double height = StepperModel().stepHeight + 10;
    double width = StepperModel().stepWidth + 10;
    if (StepperModel().stepperAxis == Axis.horizontal) {
      height = StepperModel().stepperSize.height > height
          ? StepperModel().stepperSize.height
          : height;
      width = StepperModel().stepperSize.width > 300
          ? StepperModel().stepperSize.width
          : 300;
    } else {
      height = StepperModel().stepperSize.height > 300
          ? StepperModel().stepperSize.height
          : 300;
      width = StepperModel().stepperSize.width > width
          ? StepperModel().stepperSize.width
          : width;
    }
    return Size(width, height);
  }
}
