import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stepper_a/src/step_helper/step.dart';
import 'package:stepper_a/stepper_a.dart';

void main() {
  test('provide all required field', () {
    StepperA(
      stepperSize: const Size(400, 65),
      stepperBodyWidget: [
        Container(
          color: Colors.red,
          child: const Text("Step one"),
        ),
        Container(
          color: Colors.green,
          child: const Text("Step two"),
        ),
        Container(
          color: Colors.yellow,
          child: const Text("Step three"),
        ),
        Container(
          color: Colors.pink,
          child: const Text("Step four"),
        ),
        Container(
          color: Colors.purple,
          child: const Text("Step five"),
        ),
      ],
      step: const StepA(
          currentStepColor: Colors.green,
          completeStepColor: Colors.blueAccent,
          inactiveStepColor: Colors.white54,
          margin: EdgeInsets.all(8)),
    );
  });
}
