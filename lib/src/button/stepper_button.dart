/// /*** Uttam kumar mitra ***/
/// create date 13/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/stepper_a_button_style.dart';

///It is used to create stepper custom buttons,
///
class StepperAButtonWidget extends StatelessWidget {
  ///It is used to create stepper custom buttons Style,
  ///
  final StepperAButton _stepperAButton;

  ///click event handle
  final Function onTap;

  ///button text
  ///
  final String text;

  const StepperAButtonWidget(
      {Key? key,
      required StepperAButton stepperAButton,
      required this.onTap,
      required this.text})
      : _stepperAButton = stepperAButton,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8,left: 8,right: 8),
        width: _stepperAButton.width,
        height: _stepperAButton.height,
        alignment: Alignment.center,
        decoration: _stepperAButton.boxDecoration ??
            const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
        child: Text(text, style: _stepperAButton.textStyle),
      ),
    );
  }
}
