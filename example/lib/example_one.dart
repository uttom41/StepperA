
import 'package:example/step_one.dart';
import 'package:example/step_three.dart';
import 'package:example/step_two.dart';
import 'package:flutter/material.dart';
import 'package:stepper_a/stepper_a.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  final StepperAController controller = StepperAController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: const Text("Stepper Example One"),),
          body: Stack(
            children: [
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                bottom: 0,
                child: StepperA(
                stepperSize: const Size(350, 70),
                stepperAxis: Axis.horizontal,
              //  borderShape: BorderShape.rRect,
              //  borderType: BorderType.straight,
                floatingButton: false,
                stepperBodyWidget: [
                  StepOne(controller: controller,),
                  StepTwo(controller: controller,),
                  StepThree(controller: controller,),
                ],
                stepBorder: true,
                step: const StepA(
                    currentStepColor: Colors.purpleAccent,
                    completeStepColor: Colors.green,
                    inactiveStepColor: Colors.black38,
                    margin: EdgeInsets.all(5)
                ),

              ),)
            ]
          ),
        );
  }
}
