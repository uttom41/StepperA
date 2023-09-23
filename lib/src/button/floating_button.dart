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

  /// Button onTap provide current index for build your functionality.
  final Function(int currentIndex) onTap;

  ///This function only trigger [Forward Button] click when all step completed.
  final Function()? onComplete;

  FloatingButton(
      {
      ///for define previous and forward button icon color
      required this.buttonIconColor,

      ///for define previous and forward button background color
      required this.backgroundColor,

      /// for indicate button position
      /// if only need for floating button
      required this.position,

      /// Button onTap provide current index for build your functionality.
      required this.onTap,

      ///This function only trigger [Forward Button] click when all step completed.
      this.onComplete});
}
