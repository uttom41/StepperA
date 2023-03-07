import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stepper_a/stepper_a.dart';

void main() {
  test('provide all required field', () {
     StepperA(
        stepCompleteColor: Colors.blueAccent,
        inactiveColor: Colors.white54,
        currentStepColor: Colors.green,
        stepperSize: 600,
        buttonColor: Colors.blueAccent,
        buttonIconColor: Colors.white54,
        stepperBodyWidget: [
          Container(color: Colors.red,child: const Text("Step one"),),
          Container(color: Colors.green,child: const Text("Step two"),),
          Container(color: Colors.yellow,child: const Text("Step three"),),
          Container(color: Colors.pink,child: const Text("Step four"),),
          Container(color: Colors.purple,child: const Text("Step five"),),
        ]);

  });
}
