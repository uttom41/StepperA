/// /*** Uttam kumar mitra ***/
/// create date 13/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';

///It is used to create stepper custom buttons Style,
///
class StepperAButton {
  ///Button width
  final double width;

  ///Button height
  final double height;

  ///Button custom decoration
  final BoxDecoration? boxDecoration;

  ///
  /// Button text for back and next
  final String buttonText;

  /// Button text EX: submit,complete state
  final String completeButtonText;

  ///Button text style
  final TextStyle textStyle;

  StepperAButton(
      {required this.width,
      required this.height,
      this.boxDecoration,
      this.textStyle = const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      required this.buttonText,
      required this.completeButtonText});
}
