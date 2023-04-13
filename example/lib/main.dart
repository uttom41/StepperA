import 'package:example/step_two.dart';
import 'package:example/step_one.dart';
import 'package:flutter/material.dart';
import 'package:stepper_a/stepper_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey =  GlobalKey<FormState>();
  final StepperAController controller = StepperAController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize( preferredSize: const Size.fromHeight(72),
      child: AppBar(title: const Text("Stepper Example"),)),),
      Positioned(
        top: 75,
        left: 0,
        right: 0,
        bottom: 0,
        child: StepperA(
                stepperSize: const Size(350,70),
                borderShape: BorderShape.rRect,
                borderType: BorderType.dash,
                stepperAxis: Axis.horizontal,
                stepperBackgroundColor: Colors.transparent,
               stepperAController: controller,
              stepBorder: false,
              floatingButton: false,
              // formKey: formKey,
              //   floatingPreviousButton: FloatingButton(
              //       buttonIconColor: Colors.white,
              //       backgroundColor:  Colors.blueAccent,
              //       position: Position(
              //         left: 10,
              //         bottom: 20
              //       )
              //   ),
              //   floatingForwardButton: FloatingButton(
              //       buttonIconColor: Colors.white,
              //       backgroundColor:  Colors.blueAccent,
              //       position: Position(
              //           right: 10,
              //           bottom: 20
              //       )
              //   ),
            // previousButton: StepperAButton(
            //     width: 90,
            //     height: 40,
            //     buttonText: 'Back',
            //     completeButtonText: ''
            // ),
            // forwardButton: StepperAButton(
            //     width: 90,
            //     height: 40,
            //     buttonText: 'Next',
            //     completeButtonText: 'Complete'
            // ),
            step: const StepA(
                currentStepColor: Colors.green,
                completeStepColor: Colors.blueAccent,
                inactiveStepColor: Colors.purple,
                margin: EdgeInsets.all(5)
            ),
                stepperBodyWidget: [
                  StepOne(controller: controller),
                   StepTwo(controller: controller,),
                   StepTwo(controller: controller,),
                   StepTwo(controller: controller,),
                   StepTwo(controller: controller,),
                  Container(
                    color: Colors.white,
                    child: const Center(
                        child: Text("Step four",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        )
                    ),
                  )
                ]
            ),
      ),
      ],
    );
  }
}
