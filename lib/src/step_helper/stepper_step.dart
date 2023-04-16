/// /*** Uttam kumar mitra ***/
/// create date 14/04/2023; 12:41 AM
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/step_helper/utils.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

import '../../stepper_a.dart';
import '../line.dart';

class StepperStep extends StatelessWidget {
  ///for define stepper background color
  final Color _backgroundColor;

  ///If your need stepper padding
  final EdgeInsets _padding;

  ///If your need stepper margin
  ///default margin all site 5
  final EdgeInsets _margin;

  ///It is Control Step color and icon.
  final StepA _step;

  ///Stepper Notifier for internal state management
  final StepperNotifier _notifier;

  ///this field no need for [circle] type border.
  ///if your need [rectangle] type border shape all side radius.
  final Radius _radius;

  ///for your need stepper line thickness use this field
  ///default thickness [2.0] double
  final double _lineThickness;

  ///this field are required for stepper width for[Horizontal Axis] and height for[Vertical Axis]
  final Size _stepperSize;

  ///this field stepper step width.
  ///default step width is 50.
  final double _stepWidth;

  ///this field stepper step height.
  ///default step height is 50.
  final double _stepHeight;

  ///Step border show or Not
  final bool _border;

  /// If your need stepper Axis wise build
  final Axis _axis;

  final List<CustomSteps>? customSteps;

  const StepperStep({
    Key? key,
    required backgroundColor,
    required padding,
    required notifier,
    required lineThickness,
    required stepHeight,
    required stepWidth,
    required stepperSize,
    required radius,
    required step,
    required margin,
    required border,
    required axis,
    this.customSteps,
  })  : _backgroundColor = backgroundColor,
        _padding = padding,
        _notifier = notifier,
        _lineThickness = lineThickness,
        _stepHeight = stepHeight,
        _stepWidth = stepWidth,
        _stepperSize = stepperSize,
        _radius = radius,
        _step = step,
        _margin = margin,
        _border = border,
        _axis = axis,
        super(key: key);

  Widget buildHorizontalStep() {
    return customSteps == null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
                    notifier: _notifier,
                    radius: _radius,
                    stepperSize: _stepperSize.width,
                    stepWidth: _stepWidth,
                    stepHeight: _stepHeight,
                    axis: _axis,
                    lineThickness: _lineThickness,
                    step: _step,
                    stepBorder: _border,
                    strokeWidth: 3.0)
                .steps(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
                    notifier: _notifier,
                    radius: _radius,
                    stepperSize: _stepperSize.width,
                    stepWidth: _stepWidth,
                    stepHeight: _stepHeight,
                    axis: _axis,
                    lineThickness: _lineThickness,
                    step: _step,
                    stepBorder: _border,
                    strokeWidth: 3.0)
                .customSteps(customSteps!),
          );
  }

  Widget buildVerticalStep() {
    return customSteps == null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
                    notifier: _notifier,
                    radius: _radius,
                    stepperSize: _stepperSize.height,
                    stepWidth: _stepWidth,
                    stepHeight: _stepHeight,
                    step: _step,
                    axis: _axis,
                    stepBorder: _border,
                    lineThickness: _lineThickness,
                    strokeWidth: 3.0)
                .steps(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils(
                    notifier: _notifier,
                    radius: _radius,
                    stepperSize: _stepperSize.height,
                    stepWidth: _stepWidth,
                    stepHeight: _stepHeight,
                    step: _step,
                    axis: _axis,
                    stepBorder: _border,
                    lineThickness: _lineThickness,
                    strokeWidth: 3.0)
                .customSteps(customSteps!),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      height: _stepperSize.height,
      width: _stepperSize.width,
      child: SingleChildScrollView(
        scrollDirection: _axis,
        controller: _notifier.getStepScrollController(
            itemWidth: _stepWidth,
            lineWidth: CalculateLength(
                    size: _stepperSize.width,
                    width: _stepWidth,
                    height: _stepHeight,
                    stepSize: _notifier.totalIndex)
                .length(),
            screenWidth: _axis == Axis.horizontal
                ? _stepperSize.width
                : _stepperSize.height),
        child: Container(
          padding: _padding,
          margin: _margin,
          alignment: Alignment.center,
          child: _axis == Axis.horizontal
              ? buildHorizontalStep()
              : buildVerticalStep(),
        ),
      ),
    );
  }
}
