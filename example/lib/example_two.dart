import 'package:example/step_four.dart';
import 'package:example/step_one.dart';
import 'package:example/step_three.dart';
import 'package:example/step_two.dart';
import 'package:flutter/material.dart';
import 'package:stepper_a/stepper_a.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  final formKey = GlobalKey<FormState>();
  final StepperAController controller = StepperAController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(82),
              child: AppBar(
                title: const Text("Stepper Example Two"),
              )),
        ),
        Positioned(
          //top: 115,
          top: 90,
          left: 0,
          right: 0,
          bottom: 0, //MediaQuery.of(context).size.height-240
          child: StepperA(
              stepperSize: const Size(300, 90),
              // stepperSize: const Size(100,350),
              borderShape: BorderShape.diamond,
              borderType: BorderType.straight,
              stepperAxis: Axis.horizontal,
              lineType:  LineType.dotted ,
              stepperBackgroundColor: Colors.transparent,
              stepperAController: controller,
              stepHeight: 40,
              stepWidth: 40,
              stepBorder: true,
              floatingButton: false,
              // formKey: formKey,
              //   floatingPreviousButton: FloatingButton(
              //       buttonIconColor: Colors.white,
              //       backgroundColor:  Colors.blueAccent,
              //       position: Position(
              //         left: 10,
              //         top: 10
              //       )
              //   ),
              //   floatingForwardButton: FloatingButton(
              //       buttonIconColor: Colors.white,
              //       backgroundColor:  Colors.blueAccent,
              //       position: Position(
              //           left: 10,
              //           bottom: 20
              //       )
              //   ),
              previousButton: StepperAButton(
                  width: 90,
                  height: 40,
                  buttonText: 'Back',
                  completeButtonText: ''),
              forwardButton: StepperAButton(
                  width: 90,
                  height: 40,
                  buttonText: 'Next',
                  completeButtonText: 'Complete'),
              customSteps: const [
                CustomSteps(stepsIcon: Icons.login, title: "LogIn"),
                CustomSteps(stepsIcon: Icons.location_on, title: "Location"),
                CustomSteps(stepsIcon: Icons.home, title: "Home"),
                CustomSteps(stepsIcon: Icons.account_circle, title: "Account"),
              ],
              step: const StepA(
                  currentStepColor: Colors.green,
                  completeStepColor: Colors.indigo,
                  inactiveStepColor: Colors.black12,
                  margin: EdgeInsets.all(5)),
              stepperBodyWidget: [
                StepOne(controller: controller),
                StepTwo(
                  controller: controller,
                ),
                StepThree(
                  controller: controller,
                ),
                StepFour(
                  controller: controller,
                ),
              ]),
        ),
      ],
    );
  }
}
