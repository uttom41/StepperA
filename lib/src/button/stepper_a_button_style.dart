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

  ///Button margin set
  final EdgeInsets? margin;

  /// Button onTap provide current index for build your functionality.
  final Function (int currentIndex) onTap;

  ///
  /// Button text for back and next
  final Widget buttonWidget;

  /// Button text EX: submit,complete state
  //final Widget completeButtonWidget;

  StepperAButton(
      {required this.width,
        required this.height,
        this.boxDecoration,
        this.margin,
        required this.buttonWidget,
        required this.onTap

        // required this.completeButtonWidget
      });
}
