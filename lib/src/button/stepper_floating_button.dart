/// /*** Uttam kumar mitra ***/
/// create date 13/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/position.dart';


///Stepper floating button design
class StepperFloatingButton extends StatelessWidget {
  /// Floating button position set
  final Position position;

  ///Floating button background color
  final Color buttonColor;

  ///Floating button icon color
  final Color buttonIconColor;

  ///internal state management
  final Axis axis;

  ///button click handle
  final Function onTap;

  ///floating button identify
  final String heroTag;

  ///floating button icon
  final IconData buttonIcon;

  const StepperFloatingButton({
    Key? key,
    required this.position,
    required this.buttonColor,
    required this.axis,
    required this.buttonIconColor,
    required this.onTap,
    required this.heroTag,
    required this.buttonIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: position.bottom,
      right: position.right,
      top: position.top,
      left: position.left,
      child: FloatingActionButton(
        mini: true,
        backgroundColor: buttonColor,
        heroTag: heroTag,
        onPressed: (){onTap();},
        child: Icon(buttonIcon,
          color: buttonIconColor,
          size: axis== Axis.horizontal?26.0:40.0,
        ),
      ),
    );
  }
}
