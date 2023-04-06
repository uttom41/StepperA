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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize( preferredSize: const Size.fromHeight(72),
      child: AppBar(title: const Text("Stepper Example"),)),),
      Positioned(
        top: 95,
        left: 0,
        right: 0,
        bottom: 0,
        child: StepperA(
                stepCompleteColor: Colors.blueAccent,
                inactiveColor: Colors.black38,
                currentStepColor: Colors.green,
                stepperSize: const Size(350,70),
                borderShape: BorderShape.circle,
                stepperAxis: Axis.horizontal,
                stepperBackgroundColor: Colors.transparent,
                formKey: formKey,
                previousButton: Button(
                    buttonIconColor: Colors.white,
                    backgroundColor:  Colors.blueAccent,
                    position: Position(
                      left: 10,
                      bottom: 20
                    )
                ),
                forwardButton: Button(
                    buttonIconColor: Colors.white,
                    backgroundColor:  Colors.blueAccent,
                    position: Position(
                        right: 10,
                        bottom: 20
                    )
                ),
                stepperBodyWidget: [
                  const StepOne(),
                  const StepTwo(),
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
