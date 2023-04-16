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
- Easily Customize Step


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
    stepperSize: const Size(300,90),
    // stepperSize: const Size(100,350),
    borderShape: BorderShape.diamond,
    borderType: BorderType.straight,
    stepperAxis: Axis.horizontal,
    stepperBackgroundColor: Colors.transparent,
    stepperAController: controller,
    stepHeight: 40,
    stepWidth: 40,
    stepBorder: true,
    floatingButton: false,
    previousButton: StepperAButton(
        width: 90,
        height: 40,
        buttonText: 'Back',
        completeButtonText: ''
    ),
    forwardButton: StepperAButton(
        width: 90,
        height: 40,
        buttonText: 'Next',
        completeButtonText: 'Complete'
    ),
    customSteps: const [
        CustomSteps(
        stepsIcon: Icons.login,
        title: "LogIn"),
        CustomSteps(
        stepsIcon: Icons.location_on,
        title: "Location"),
        CustomSteps(
        stepsIcon: Icons.home,
        title: "Home"),
        CustomSteps(
        stepsIcon: Icons.account_circle,
        title: "Account"),
    
    ],
    step: const StepA(
        currentStepColor: Colors.green,
        completeStepColor: Colors.indigo,
        inactiveStepColor: Colors.black12,
        margin: EdgeInsets.all(5)
    ),
    stepperBodyWidget: [
        StepOne(controller: controller),
        StepTwo(controller: controller,),
        StepThree(controller: controller,),
        StepFour(controller: controller,),
    ]
)
```

## ScreenShot

## FormKey validation
![formkey](https://user-images.githubusercontent.com/44666275/232333587-c807f95a-b8db-454e-865e-98dd26304b58.gif)

## Custom Steps
![custom_steps](https://user-images.githubusercontent.com/44666275/232333845-f29e33b6-8030-445d-9ee3-94130386736d.gif)

## vertical stepper
![vertical_circle](https://user-images.githubusercontent.com/44666275/232333904-d2f2cf64-e80b-45a5-b5ed-6cd3e268c0e4.gif)

## Others
![horizontal_circle](https://user-images.githubusercontent.com/44666275/232333995-0027ac88-519c-4eb0-b416-ccc4ec3d9f58.gif)

![horizontal_circle_border](https://user-images.githubusercontent.com/44666275/232334075-bef4e0d6-2645-4e06-ac09-1f0495ac18f2.gif)
![horizontal_circle_dash](https://user-images.githubusercontent.com/44666275/232334106-10b9c0d3-9a41-4cbf-bbb7-ee9e926ce040.gif)
![vertical custom step](https://user-images.githubusercontent.com/44666275/232334159-f293ab1b-cd41-4b92-acf6-19b720abb13d.gif)
![vertical_step_withbutton](https://user-images.githubusercontent.com/44666275/232334218-28dc3dca-56a7-42dd-8de5-0b7c1e76bb09.gif)
![Media_230415_221534](https://user-images.githubusercontent.com/44666275/232334295-466295cb-730a-4cf0-a708-5d3dccb58705.gif)
![](example/assets/pic/Media_230415_221243.gif)
![](example/assets/pic/Media_230415_221733.gif)
![](example/assets/pic/tringle.gif)
![](example/assets/pic/Media_230415_222245.gif)
![](example/assets/pic/Media_230415_222135.gif)



## Support
If this package was useful to you, helped you to easily deliver your app, saved you a lot of time, or you just want to
support the project, I would be grateful if you give us a rating.
