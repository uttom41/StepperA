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
  late final ExampleNotifier _notifier = ExampleNotifier();


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _notifier,
        builder: (BuildContext context, child) {
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
                    stepperSize: const Size(70, 300),
                   // stepperSize: const Size(300, 95),
                    borderShape: BorderShape.circle,
                    borderType: BorderType.straight,
                    stepperAxis: Axis.vertical,
                    lineType: LineType.straight,
                    stepperBackgroundColor: Colors.transparent,
                    stepperAController: _notifier.controller,
                    stepHeight: 40,
                    stepWidth: 40,
                    stepBorder: true,
                    pageSwipe: true,
                    formValidation: false,

                    // floatingPreviousButton: FloatingButton(
                    //     buttonIconColor: Colors.white,
                    //     backgroundColor:  Colors.blueAccent,
                    //     position: Position(//
                    //         left: 10,
                    //         bottom: 10
                    //     ),
                    //     onTap: (int currentIndex) {
                    //       print("Previous Button $currentIndex");
                    //     }
                    // ),
                    // floatingForwardButton: FloatingButton(
                    //     buttonIconColor: Colors.white,
                    //     backgroundColor:  Colors.blueAccent,
                    //     position: Position(
                    //         right: 10,
                    //         bottom: 20
                    //     ),
                    //     onTap: (int currentIndex) {
                    //       print("Forward button $currentIndex");
                    // }
                    // ),

                    previousButton: (int index) => StepperAButton(
                      width: 40,
                      height: 40,
                      buttonWidget: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onTap: (int currentIndex){
                        print("Previous Button $currentIndex");
                      },
                        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12)
                    ),
                    forwardButton: (index) => StepperAButton(
                      width: 40,
                    //  width: index == 0 ? MediaQuery.of(context).size.width-24 : 40,
                      height: 40, buttonWidget: const Icon(Icons.arrow_forward, color: Colors.white),
                      onTap: (int currentIndex){
                        print("Forward button $currentIndex");
                      },
                      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12)
                      // index == 3
                      //     ? const Text('Complete', style: TextStyle(fontSize: 14, color: Colors.white))
                      //     : const Text('Next', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                    customSteps: [
                      const CustomSteps(stepsIcon: Icons.login, title: "LogIn"),
                      const CustomSteps(stepsIcon: Icons.home, title: "Home sdsfdsfdsf"),
                      const CustomSteps(stepsIcon: Icons.account_circle, title: "Account"),
                      CustomSteps(image: Image.asset("assets/pic/pay.png",color: Colors.white,), title: "Payment"),
                      CustomSteps(image: Image.asset("assets/pic/pay.png",color: Colors.white,), title: "Payment"),
                      CustomSteps(image: Image.asset("assets/pic/pay.png",color: Colors.white,), title: "Payment"),
                      CustomSteps(image: Image.asset("assets/pic/pay.png",color: Colors.white,), title: "Payment"),
                    ],
                    step: const StepA(
                        currentStepColor: Colors.green,
                        completeStepColor: Colors.indigo,
                        inactiveStepColor: Colors.black45,
                        // loadingWidget: CircularProgressIndicator(color: Colors.green,),
                        margin: EdgeInsets.all(5)),
                    stepperBodyWidget: [
                      StepOne(controller: _notifier.controller,notifier: _notifier,),
                      StepTwo(controller: _notifier.controller),
                      StepThree(controller: _notifier.controller),
                      StepFour(controller: _notifier.controller),
                      StepFour(controller: _notifier.controller),
                      StepFour(controller: _notifier.controller),
                      StepFour(controller: _notifier.controller),

                    ]),
              ),
            ],
          );
        });


  }
}

class ExampleNotifier extends ChangeNotifier{
  final StepperAController controller = StepperAController();
  bool index = false;
  void onUpdate(){
    index = !index;
    notifyListeners();
  }

}
