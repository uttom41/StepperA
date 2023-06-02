<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


##                                   Flutter StepperA

## Key Features

Stepper A can easily build Stepper facility of you any flutter app. 
- Form Validation with FormKey [GlobalKey<FormState>()]
- Support Horizontal and Vertical Stepper
- Customized Stepper step Shape [Rectangle, Circle,Diamond,Triangle]
- Customized Stepper step border [Dash, Straight]
- Customized Stepper line  [Dash, Straight]
- Smooth sliding with Animation
- Number step text style provision added.
- Stepper page swipe
- Easily Customize Step [Image, IconData]
- Forward and previous button custom style .


## package.yaml
```dart
stepper_a: <latest version>
```

## Import
```dart
import 'package:stepper_a/stepper_a.dart';
```
## Simple Example


```dart
 StepperA(
        stepperSize: const Size(300, 90),
        borderShape: BorderShape.rRect,
        borderType: BorderType.straight,
        stepperAxis: Axis.horizontal,
        lineType: LineType.dotted,
        stepperBackgroundColor: Colors.transparent,
        stepperAController: controller,
        stepHeight: 40,
        stepWidth: 40,
        stepBorder: true,
        pageSwipe: false,
        formValidation: true,

        // floatingPreviousButton: FloatingButton(
        //     buttonIconColor: Colors.white,
        //     backgroundColor:  Colors.blueAccent,
        //     position: Position(//
        //         left: 10,
        //         bottom: 10
        //     )
        // ),
        // floatingForwardButton: FloatingButton(
        //     buttonIconColor: Colors.white,
        //     backgroundColor:  Colors.blueAccent,
        //     position: Position(
        //         right: 10,
        //         bottom: 20
        //     )
        // ),
        previousButton: (int index) => StepperAButton(
            width: 90,
            height: 40,
            onTap: (int currentIndex){
            
            },
            buttonWidget: const Icon(
            Icons.arrow_back,
            color: Colors.white,
           ),
        ),
        forwardButton: (index) => StepperAButton(
            width: index == 0 ? 200 : 90,
            height: 40,
            onTap: (int currentIndex){
            
            },
            buttonWidget: index == 3
            ? const Text('Complete', style: TextStyle(fontSize: 14, color: Colors.white))
                : const Text('Next', style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
        customSteps: [
            const CustomSteps(stepsIcon: Icons.login, title: "LogIn"),
            const CustomSteps(stepsIcon: Icons.home, title: "Home"),
            const CustomSteps(stepsIcon: Icons.account_circle, title: "Account"),
            CustomSteps(image: Image.asset("assets/pic/pay.png",color: Colors.white,), title: "Payment"),
        ],
        step: const StepA(
            currentStepColor: Colors.green,
            completeStepColor: Colors.indigo,
            inactiveStepColor: Colors.black45,
            // loadingWidget: CircularProgressIndicator(color: Colors.green,),
            margin: EdgeInsets.all(5)
      ),
      stepperBodyWidget: [
            StepOne(controller: controller),
            StepTwo(controller: controller),
            StepThree(controller: controller),
            StepFour(controller: controller),
      ]
)
```

## ScreenShot

## FormKey validation
![Horizontal rectangle ](https://github.com/amit-hassan/Basic-Task/assets/23728430/b706bb85-5421-43ed-901a-f323a3a62dd0)

![Screenshot_20230602_233154](https://github.com/amit-hassan/BMIMeasure/assets/44666275/93235a6f-c706-41fb-874f-3eebda1ea93e)

## Custom Steps

![vertical circle](https://github.com/amit-hassan/Basic-Task/assets/23728430/3babe4f6-541c-4df7-964f-fe2b64b4d679)

## Others
![vertical circle](https://github.com/amit-hassan/Basic-Task/assets/23728430/1d788024-9a96-494e-9568-e44e062fbec5)

![Horizontal circle](https://github.com/amit-hassan/Basic-Task/assets/23728430/284ea3b1-7d8e-431a-8efa-fc29f93c5c60)

![Horizontal rectangle](https://github.com/amit-hassan/Basic-Task/assets/23728430/29347e50-7523-4f44-b88e-3892a83b07f6)





## Support
If this package was useful to you, helped you to easily deliver your app, saved you a lot of time, or you just want to
support the project, I would be grateful if you give us a rating.
