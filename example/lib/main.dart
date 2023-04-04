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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Stepper Example"),),
      body: StepperA(
          stepCompleteColor: Colors.blueAccent,
          inactiveColor: Colors.black38,
          currentStepColor: Colors.green,
          stepperSize: const Size(500,70),
          borderShape: BorderShape.rectangle,
          stepperAxis: Axis.horizontal,
          formKey: formKey,
          stepperBodyWidget: [
            StepOne(),
            StepTwo(),
            Container(color: Colors.yellow,child: const Text("Step three"),),
            Container(color: Colors.pink,child: const Text("Step four"),),
            Container(color: Colors.purple,child: const Text("Step five"),),]
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.red ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Step one"),
          TextFormField(
            validator: (String? value){
              if(value !=null && value.isEmpty) return "is empty";
              return null;
            },
          ),
          ElevatedButton(
              onPressed: (){},
              child: SizedBox(
                  width: double.infinity,
                  child: Text("click Me")
              ))

        ],
      ),
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Text("Step two"),

    );
  }
}
