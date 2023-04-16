import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/position.dart';

class Button {
  ///for define previous and forward button background color
  final Color backgroundColor;

  ///for define previous and forward button icon color
  final Color buttonIconColor;

  /// for indicate button position
  Position position;

  Button({
    required this.buttonIconColor,
    required this.backgroundColor,
    required this.position,
  });
}
