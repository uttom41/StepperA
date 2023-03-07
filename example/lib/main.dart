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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stepper Example"),),
      body: StepperA(
        stepCompleteColor: Colors.blueAccent,
        inactiveColor: Colors.white54,
        currentStepColor: Colors.green,
        stepperSize: 400,
        buttonColor: Colors.blueAccent,
        buttonIconColor: Colors.white54,
        stepperBodyWidget: [
        Container(color: Colors.red,child: const Text("Step one"),),
      Container(color: Colors.green,child: const Text("Step two"),),
      Container(color: Colors.yellow,child: const Text("Step three"),),
      Container(color: Colors.pink,child: const Text("Step four"),),
      Container(color: Colors.purple,child: const Text("Step five"),),]
      ),
    );
  }
}


