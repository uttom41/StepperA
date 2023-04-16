/// /*** Uttam kumar mitra ***/
/// create date 5/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/position.dart';

class FloatingButton {
  ///for define previous and forward button background color
  final Color backgroundColor;

  ///for define previous and forward button icon color
  final Color buttonIconColor;

  /// for indicate button position
  /// if only need for floating button
  Position position;

  FloatingButton({
    required this.buttonIconColor,
    required this.backgroundColor,
    required this.position,
  });
}
