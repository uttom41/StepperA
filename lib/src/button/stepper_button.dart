import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/position.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';


///Stepper button design
class StepperButton extends StatelessWidget {
  final Position position;
  final Color buttonColor;
  final Color buttonIconColor;
  final StepperNotifier notifier;
  final Function onTap;
  final String heroTag;
  final IconData buttonIcon;
  const StepperButton({
    Key? key,
    required this.position,
    required this.buttonColor,
    required this.notifier,
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
          size: notifier.stepperAxis== Axis.horizontal?26.0:40.0,
        ),
      ),
    );
  }
}
