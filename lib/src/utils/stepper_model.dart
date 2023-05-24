import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

import './../../stepper_a.dart';

class StepperModel {

  ///for define stepper background color
  Color stepperBackgroundColor;

  ///for define stepper body list of page
  ///this list of page length is stepper length
  List<Widget> stepperBodyWidget;

  ///for your need stepper line thickness use this field
  ///default thickness [2.0] double
  double lineThickness;

  ///IF you need different Step border style
  ///default border style is [straight]
  BorderType borderType;

  ///If need different Stepper line style
  ///default stepper line style is [straight]
  LineType lineType;

  ///If you need different BorderShape
  ///default borderShape is [circle]
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

  ///It is Control Step color and icon.
  StepA step;

  ///If  you need widget form validation
  GlobalKey<FormState>? formKey;

  /// If you need a floating button than use this.
  FloatingButton? floatingForwardButton;

  /// If you need a floating button than use this.
  FloatingButton? floatingPreviousButton;

  /// If you need a custom button than use this.
  StepperAButton? previousButton;

  /// If you need a custom button than use this.
  StepperAButton? forwardButton;

  /// If you need a own button than use this.
  /// and control your button click
  StepperAController? stepperAController;

  ///
  List<CustomSteps>? customSteps;

  int totalSteps;
  bool floatingButton;
  bool stepBorder;

  StepperNotifier notifier;

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
    this.formKey,
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
    required this.notifier
});

  factory StepperModel.init({
    required double lineThickness,
    required Size stepperSize,
    required List<Widget> stepperBodyWidget,
    required Color stepperBackgroundColor,
    required EdgeInsets padding,
    required EdgeInsets margin,
    required  EdgeInsets stepPadding,
    required Radius radius,
    required BorderType borderType,
    required LineType lineType,
    required BorderShape borderShape,
    required List<double> dashPattern,
    required double stepHeight,
    required double stepWidth,
    required Axis stepperAxis,
    required StepperNotifier notifier,
    GlobalKey<FormState>? formKey,
    FloatingButton? floatingForwardButton,
    FloatingButton? floatingPreviousButton,
    StepperAButton? forwardButton,
    StepperAButton? previousButton,
    StepperAController? stepperAController,
    required bool floatingButton,
    required bool stepBorder,
    List<CustomSteps>? customSteps,
    required StepA step,
    required int totalSteps
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
      formKey: formKey,
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
      notifier: notifier
    );

    return _instance!;
  }

  factory StepperModel(){

    if(_instance == null){
      throw UnInitializedUtilsException(
          "Your [Utils.dart] model is not initialized."
              "Please initialize it with proper value on application init state.");
    }

    return _instance!;
  }

}


class UnInitializedUtilsException implements Exception {
  String cause;
  UnInitializedUtilsException(this.cause);

  @override
  String toString() => 'UnInitializedUtilsException: $cause';
}