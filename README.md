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
- Customized Stepper step Shape [Rectangle, Circle]
- Smooth sliding with Animation
- Easily Customize UI Color


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
    stepCompleteColor: Colors.blueAccent,
    inactiveColor: Colors.black38,
    currentStepColor: Colors.green,
    stepperSize: const Size(350,70),
    borderShape: BorderShape.rectangle,
    stepperAxis: Axis.horizontal,
    formKey: formKey,
    previousButton: Button(
        buttonIconColor: Colors.white,
        backgroundColor:  Colors.blueAccent,
        position: Position(
        left: 10,
        bottom: 20)
    ),
    forwardButton: Button(
        buttonIconColor: Colors.white,
        backgroundColor:  Colors.blueAccent,
        position: Position(
        right: 10,
        bottom: 20)
    ),
    stepperBodyWidget: [
        const StepOne(),
        const StepTwo(),
        Container(
        color: Colors.white,
        child: const Center(
        child: Text("Step four",style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700),)),)
    ]
    )

```

## Support
If this package was useful to you, helped you to easily deliver your app, saved you a lot of time, or you just want to
support the project, I would be grateful if you give us a rating.
