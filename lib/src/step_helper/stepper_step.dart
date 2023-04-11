import 'package:flutter/material.dart';
import 'package:stepper_a/src/step_helper/utils.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

class StepperStep extends StatelessWidget {

  ///for define stepper background color
  final Color backgroundColor;

  ///If your need stepper padding
  final EdgeInsets padding;

  ///If your need stepper margin
  ///default margin all site 5
  final EdgeInsets margin;

  ///If your need stepper step padding
  final EdgeInsets stepPadding;

  ///Stepper Notifier for internal state management
  final StepperNotifier notifier;

  ///this field no need for [circle] type border.
  ///if your need [rectangle] type border shape all side radius.
  final Radius radius;

  ///for your need stepper line thickness use this field
  ///default thickness [2.0] double
  final double lineThickness;

  ///this field are required for stepper width for[Horizontal Axis] and height for[Vertical Axis]
  final Size stepperSize;

  ///this field stepper step width.
  ///default step width is 50.
  final double stepWidth;

  ///this field stepper step height.
  ///default step height is 50.
  final double stepHeight;

  const StepperStep({
    Key? key,
    required this.backgroundColor,
    required this.padding,
    required this.notifier,
    required this.lineThickness,
    required this.stepHeight,
    required this.stepWidth,
    required this.stepperSize,
    required this.radius,
    required this.stepPadding,
    required this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: stepperSize.height,
      width: stepperSize.width,
      child: SingleChildScrollView(
        scrollDirection: notifier.stepperAxis,
        child: Container(
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          child:notifier.stepperAxis == Axis.horizontal? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
              notifier: notifier,
              radius: radius,
              stepperSize: stepperSize.width,
              stepWidth: stepWidth,
              stepHeight: stepHeight,
              padding: stepPadding,
              lineThickness: lineThickness,
              strokeWidth: 3.0
            ).steps(),
          ):Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
              notifier: notifier,
              radius: radius,
              stepperSize: stepperSize.height,
              stepWidth: stepWidth,
              stepHeight: stepHeight,
              padding: stepPadding,
              lineThickness: lineThickness,
              strokeWidth: 3.0
            ).steps(),
          ),
        ),
      ),
    );
  }

}
