/// /*** Uttam kumar mitra ***/
/// create date 11/04/2023; 06:41 PM
///
///
import 'package:flutter/cupertino.dart';

///This class ensure steps Color and IconData user provided or not.
///if IconData not provided than showed steps number ,
class StepA {
  ///It is use for current step widget and step border color.
  final Color currentStepColor;

  ///It is use for complete step widget and step border color.
  final Color completeStepColor;

  ///It is use for inactive step widget and step border color.
  final Color inactiveStepColor;

  ///It is use for complete step widget icon.
  ///If IconData is not provided which shows the number of steps,
  ///This field change number step complete step icon.
  final IconData? completeStepIcon;

  ///This feature helps to change the default number type step text style.
  final TextStyle? numberStepTextStyle;

  ///All style current step is loading widget that provide [loadingWidget].
  final Widget? loadingWidget;

  ///It is used for step icons and border margins,
  ///This field is required for border and widget spacing.
  final EdgeInsets margin;

  const StepA(
      {required this.currentStepColor,
        required this.completeStepColor,
        required this.inactiveStepColor,
        required this.margin,
        this.completeStepIcon,
        this.numberStepTextStyle,
        this.loadingWidget
      });
}
