import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

import './../../stepper_a.dart';

class StepperModel {

  ///for define stepper background color.
  ///[stepperBackgroundColor] this attribute provide step build area background color.
  Color stepperBackgroundColor;

  ///for define stepper body list of page.
  ///this list of page length is stepper length.
  List<Widget> stepperBodyWidget;

  ///for your need stepper line thickness use this field.
  ///default thickness [2.0] double.
  double lineThickness;

  ///IF you need different Step border style.
  ///default border style is [straight].
  BorderType borderType;

  ///If need different Stepper line style.
  ///default stepper line style is [straight].
  LineType lineType;

  ///If you need different BorderShape.
  ///default borderShape is [circle].
  BorderShape borderShape;

  /// A circular array of dash offsets and lengths.
  ///
  /// For example, the array `[5, 10]` would result in dashes 5 pixels long
  /// default the array [3,5]
  List<double> dashPattern;

  ///this field no need for [circle] type border.
  ///if your need [rectangle] type border shape all side radius.
  Radius radius;

  ///this field are required for stepper width for[Horizontal Axis] and height for[Vertical Axis]
  ///StepperSize must be minimum [stepWidth] and [stepHeight]
  Size stepperSize;

  ///this field stepper step width.
  ///default step width is 50.
  double stepWidth;

  ///this field stepper step height.
  ///default step height is 50.
  double stepHeight;

  ///If your need stepper padding
  EdgeInsets padding;

  ///If you need stepper margin
  ///default margin all site 5
  EdgeInsets margin;

  ///If you need stepper step padding
  EdgeInsets stepPadding;

  ///If you need stepper Axis wise build
  Axis stepperAxis;

  ///[StepA] Default step Number type, this field provide step color is required.
  ///If you need number step text style then use testStyle.
  ///If your need change default step complete icon then you use completeStep Icon.
  ///It is Control Step color and icon.
  ///All style current step is loading widget that provide [loadingWidget].
  StepA step;

  ///If  you need widget form validation
  ///This uniquely identifies the Form, and allows validation of the form in a later step.
 // @Deprecated("This features not available")
 // GlobalKey<FormState>? formKey;

  /// If you need a floating button than use this.
  /// This Button pass all time provided traverse forward page.
  ///This button is shown on the page by provided  "[Position]".
  FloatingButton? floatingForwardButton;

  /// If you need a floating button than use this.
  /// This Button pass all time provided traverse previous page.
  /// This button is shown on the page by provided  "[Position]".
  FloatingButton? floatingPreviousButton;

  /// If you need a custom button than use this.
  /// This Button pass all time provided traverse previous page.
  ///This button is shown always left side on the page.
  final StepperAButton Function (int index)? previousButton;

  /// If you need a custom button than use this.
  /// This Button pass all time provided traverse forward page.
  /// This button is shown always right side on the page.
  final StepperAButton Function (int index)? forwardButton;

  /// If you need a own button than use this.
  /// and control your button click
  /// [StepperAController] method helps user to
  /// switch previous and forward page on button press.
  StepperAController? stepperAController;

  ///"[CustomSteps]" provide image,icon type step style.
  ///Our default step style is number type step.
  ///But [customSteps] allows you to change the default style. And helps to give your own style.
  List<CustomSteps>? customSteps;

  ///stepper total step size .
  int totalSteps;

  ///check floating button show or not .
  bool floatingButton;

  ///If you want to give step border.
  ///Then provide [stepBorder] = true.
  bool stepBorder;

  ///Stepper Notifier for internal state management.
  StepperNotifier notifier;

  ///Page left right swiped can be controlled with this parameter.
  ///[pageSwipe] = true that's mean swipe on.
  bool pageSwipe;

  List<GlobalKey<FormState>> globalKeyList =[];

  ///This Class current instance .
  static StepperModel? _instance;

  StepperModel._({
    required this.lineThickness,
    required this.stepperSize,
    required this.stepperBodyWidget,
    required this.stepperBackgroundColor,
    required this.padding,
    required this.margin,
    required this.stepPadding,
    required this.radius,
    required this.borderType,
    required this.lineType,
    required this.borderShape,
    required this.dashPattern,
    required this.stepHeight,
    required this.stepWidth,
    required this.stepperAxis,
    required this.pageSwipe,
   // this.formKey,
    this.floatingForwardButton,
    this.floatingPreviousButton,
    this.forwardButton,
    this.previousButton,
    this.stepperAController,
    required this.floatingButton,
    required this.stepBorder,
    this.customSteps,
    required this.step,
    required this.totalSteps,
    required this.notifier,
});

  factory StepperModel.init({

    ///for your need stepper line thickness use this field.
    ///default thickness [2.0] double.
    required double lineThickness,

    ///this field are required for stepper width for[Horizontal Axis] and height for[Vertical Axis]
    ///StepperSize must be minimum [stepWidth] and [stepHeight]
    required Size stepperSize,

    ///for define stepper body list of page.
    ///this list of page length is stepper length.
    required List<Widget> stepperBodyWidget,

    ///for define stepper background color.
    ///[stepperBackgroundColor] this attribute provide step build area background color.
    required Color stepperBackgroundColor,

    ///If your need stepper padding
    required EdgeInsets padding,

    ///If you need stepper margin
    ///default margin all site 5
    required EdgeInsets margin,

    ///If you need stepper step padding
    required  EdgeInsets stepPadding,

    ///this field no need for [circle] type border.
    ///if your need [rectangle] type border shape all side radius.
    required Radius radius,

    ///IF you need different Step border style.
    ///default border style is [straight].
    required BorderType borderType,

    ///If need different Stepper line style.
    ///default stepper line style is [straight].
    required LineType lineType,

    ///If you need different BorderShape.
    ///default borderShape is [circle].
    required BorderShape borderShape,

    /// A circular array of dash offsets and lengths.
    ///
    /// For example, the array `[5, 10]` would result in dashes 5 pixels long
    /// default the array [3,5]
    required List<double> dashPattern,

    ///this field stepper step height.
    ///default step height is 50.
    required double stepHeight,

    ///this field stepper step width.
    ///default step width is 50.
    required double stepWidth,

    ///If you need stepper Axis wise build
    required Axis stepperAxis,

    ///Stepper Notifier for internal state management.
    required StepperNotifier notifier,

    ///If  you need widget form validation
    ///This uniquely identifies the Form, and allows validation of the form in a later step.
    GlobalKey<FormState>? formKey,

    /// If you need a floating button than use this.
    /// This Button pass all time provided traverse forward page.
    ///This button is shown on the page by provided  "[Position]".
    FloatingButton? floatingForwardButton,

    /// If you need a floating button than use this.
    /// This Button pass all time provided traverse previous page.
    /// This button is shown on the page by provided  "[Position]".
    FloatingButton? floatingPreviousButton,

  /// If you need a custom button than use this.
  /// This Button pass all time provided traverse previous page.
  ///This button is shown always left side on the page.
  final StepperAButton Function (int index)? previousButton,

  /// If you need a custom button than use this.
  /// This Button pass all time provided traverse forward page.
  /// This button is shown always right side on the page.
  final StepperAButton Function (int index)? forwardButton,

    /// If you need a own button than use this.
    /// and control your button click
    /// [StepperAController] method helps user to
    /// switch previous and forward page on button press.
    StepperAController? stepperAController,

    ///check floating button show or not .
    required bool floatingButton,

    ///If you want to give step border.
    ///Then provide [stepBorder] = true.
    required bool stepBorder,

    ///"[CustomSteps]" provide image,icon type step style.
    ///Our default step style is number type step.
    ///But [customSteps] allows you to change the default style. And helps to give your own style.
    List<CustomSteps>? customSteps,

    ///[StepA] Default step Number type, this field provide step color is required.
    ///If you need number step text style then use testStyle.
    ///If your need change default step complete icon then you use completeStep Icon.
    ///It is Control Step color and icon.
    ///All style current step is loading widget that provide [loadingWidget].
    required StepA step,

    ///default set total step size in stepper.
    required int totalSteps,

    ///Page left right swiped can be controlled with this parameter.
    ///[pageSwipe] = true that's mean swipe on.
    required bool pageSwipe
  }) {

    _instance = StepperModel._(
      lineThickness: lineThickness,
      stepperSize:stepperSize,
      stepperBodyWidget: stepperBodyWidget,
      stepperBackgroundColor: stepperBackgroundColor,
      padding: padding,
      margin: margin,
      stepPadding: stepPadding,
      radius: radius ,
      borderType: borderType,
      lineType: lineType,
      borderShape: borderShape,
      dashPattern: dashPattern,
      stepHeight: stepHeight,
      stepWidth: stepWidth,
      stepperAxis: stepperAxis,
    //  formKey: formKey,
      floatingForwardButton: floatingForwardButton,
      floatingPreviousButton: floatingPreviousButton,
      forwardButton: forwardButton,
      previousButton: previousButton,
      stepperAController: stepperAController,
      floatingButton: floatingButton,
      stepBorder: stepBorder ,
      customSteps: customSteps,
      step: step,
      totalSteps: totalSteps,
      notifier: notifier,
      pageSwipe: pageSwipe,
    );
    _instance?.keyList();
    return _instance!;
  }

  void keyList(){
    for(int i =1;i <= totalSteps; i++){
      globalKeyList.add(GlobalKey<FormState>());
    }
  }

  factory StepperModel(){
    return _instance!;
  }

}