/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 11:41 PM
///
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';
import '../../stepper_a.dart';
import '../drawing/path_widget.dart';
import '../drawing/shape_widget.dart';
import '../line.dart';
import '../utils/stepper_model.dart';

class Utils {
  ///for Stepper state management
  final StepperNotifier _notifier;

  ///for stepper strokeWidth
  final double _strokeWidth;


  const Utils(
      {required notifier,
      required strokeWidth})
      : _notifier = notifier,
        _strokeWidth = strokeWidth;

  /// build all step
  List<Widget> steps() {
    var list = <Widget>[];
    for (int i = 0; i < _notifier.totalIndex; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);

      /// step circles
      list.add(
        Stack(children: [
          if (StepperModel().stepBorder)
            Positioned.fill(
                child: PathWidget(
              notifier: _notifier,
              borderShape: _notifier.borderShape,
              borderType: _notifier.borderType,
              dashPattern: _notifier.dashPattern,
              radius: StepperModel().radius,
              pathColor: borderColor,
              strokeWidth: _strokeWidth,
              taskType: i == _notifier.currentIndex
                  ? TaskType.inProgress
                  : TaskType.pending,
              animationDirection: _notifier.direction,
            )),
          SizedBox(
            height: StepperModel().stepHeight,
            width: StepperModel().stepWidth,
            child: _getInnerElementOfStepper(i),
          )
        ]),
      );

      ///line between step circles
      if (i != _notifier.totalIndex - 1) {
        list.add(
          StepperLine(
            lineColor: lineColor,
            length: CalculateLength(
                    size: StepperModel().stepperSize.height,//////////////////////
                    width: StepperModel().stepWidth,
                    height: StepperModel().stepHeight,
                    stepSize: _notifier.totalIndex)
                .length(),
            lineThickness: StepperModel().lineThickness,
            lineType: _notifier.lineType,
            axis: StepperModel().stepperAxis,
          ),
        );
      }
    }
    return list;
  }

  List<Widget> customSteps(List<CustomSteps> stepsList) {
    List<Widget> widgetList = [];
    for (int i = 0; i < stepsList.length; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);
      Widget steps = StepperModel().stepperAxis == Axis.horizontal
          ?
      Column(
              children: [
                Row(
                  children: [
                    Stack(children: [
                      if (StepperModel().stepBorder)
                        Positioned.fill(
                            child: PathWidget(
                          notifier: _notifier,
                          borderShape: _notifier.borderShape,
                          borderType: _notifier.borderType,
                          dashPattern: _notifier.dashPattern,
                          radius: StepperModel().radius,
                          pathColor: borderColor,
                          strokeWidth: _strokeWidth,
                          taskType: i == _notifier.currentIndex
                              ? TaskType.inProgress
                              : TaskType.pending,
                          animationDirection: _notifier.direction,
                        )),
                      SizedBox(
                        height: StepperModel().stepHeight,
                        width: StepperModel().stepWidth,
                        child: buildChild(stepsList[i].stepsIcon!, i),
                      )
                    ]),
                    if (i != _notifier.totalIndex - 1)
                      StepperLine(
                        lineColor: lineColor,
                        length: CalculateLength(
                                size: StepperModel().stepperSize.height,///////////////////////////
                                width: StepperModel().stepWidth,
                                height: StepperModel().stepHeight,
                                stepSize: _notifier.totalIndex)
                            .length(),
                        lineThickness: StepperModel().lineThickness,
                        lineType: _notifier.lineType,
                        axis: StepperModel().stepperAxis,
                      ),
                  ],
                ),
                Center(
                  child: Text(
                    stepsList[i].title??"",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: i == _notifier.currentIndex ? 14 : 12,
                        color: i == _notifier.currentIndex
                            ? borderColor
                            : StepperModel().step.inactiveStepColor),
                  ),
                )
              ],
            )
          :
      Row(
              children: [
                Column(
                  children: [
                    Stack(children: [
                      if (StepperModel().stepBorder)
                        Positioned.fill(
                            child: PathWidget(
                          notifier: _notifier,
                          borderShape: _notifier.borderShape,
                          borderType: _notifier.borderType,
                          dashPattern: _notifier.dashPattern,
                          radius: StepperModel().radius,
                          pathColor: borderColor,
                          strokeWidth: _strokeWidth,
                          taskType: i == _notifier.currentIndex
                              ? TaskType.inProgress
                              : TaskType.pending,
                          animationDirection: _notifier.direction,
                        )),
                      SizedBox(
                        height: StepperModel().stepHeight,
                        width: StepperModel().stepWidth,
                        child: buildChild(stepsList[i].stepsIcon!, i),
                      )
                    ]),
                    if (i != _notifier.totalIndex - 1)
                      StepperLine(
                        lineColor: lineColor,
                        length: CalculateLength(
                                size: StepperModel().stepperSize.height,////////////////////////
                                width: StepperModel().stepWidth,
                                height: StepperModel().stepHeight,
                                stepSize: _notifier.totalIndex)
                            .length(),
                        lineThickness: StepperModel().lineThickness,
                        lineType: _notifier.lineType,
                        axis: StepperModel().stepperAxis,
                      ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      stepsList[i].title??"",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: i == _notifier.currentIndex ? 14 : 12,
                          color: i == _notifier.currentIndex
                              ? borderColor
                              : StepperModel().step.inactiveStepColor),
                    ),
                  ),
                )
              ],
            );

      widgetList.add(steps);
    }
    return widgetList;
  }

  List<Widget> imageSteps(List<CustomSteps> imageStepList) {
    List<Widget> widgetList = [];
    for (int i = 0; i < imageStepList.length; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);
      Widget steps = StepperModel().stepperAxis == Axis.horizontal
          ? Column(
        children: [
          Row(
            children: [
              Stack(children: [
                if (StepperModel().stepBorder)
                  Positioned.fill(
                      child: PathWidget(
                        notifier: _notifier,
                        borderShape: _notifier.borderShape,
                        borderType: _notifier.borderType,
                        dashPattern: _notifier.dashPattern,
                        radius: StepperModel().radius,
                        pathColor: borderColor,
                        strokeWidth: _strokeWidth,
                        taskType: i == _notifier.currentIndex
                            ? TaskType.inProgress
                            : TaskType.pending,
                        animationDirection: _notifier.direction,
                      )),
                SizedBox(
                  height: StepperModel().stepHeight,
                  width: StepperModel().stepWidth,
                  child: buildImageChild(imageStepList[i].image!, i),
                )
              ]),
              if (i != _notifier.totalIndex - 1)
                StepperLine(
                  lineColor: lineColor,
                  length: CalculateLength(
                      size: StepperModel().stepperSize.height,///////////////////////////
                      width: StepperModel().stepWidth,
                      height: StepperModel().stepHeight,
                      stepSize: _notifier.totalIndex)
                      .length(),
                  lineThickness: StepperModel().lineThickness,
                  lineType: _notifier.lineType,
                  axis: StepperModel().stepperAxis,
                ),
            ],
          ),
          Center(
            child: Text(
              imageStepList[i].title??"",
              softWrap: true,
              style: TextStyle(
                  fontSize: i == _notifier.currentIndex ? 14 : 12,
                  color: i == _notifier.currentIndex
                      ? borderColor
                      : StepperModel().step.inactiveStepColor),
            ),
          )
        ],
      )
          : Row(
        children: [
          Column(
            children: [
              Stack(children: [
                if (StepperModel().stepBorder)
                  Positioned.fill(
                      child: PathWidget(
                        notifier: _notifier,
                        borderShape: _notifier.borderShape,
                        borderType: _notifier.borderType,
                        dashPattern: _notifier.dashPattern,
                        radius: StepperModel().radius,
                        pathColor: borderColor,
                        strokeWidth: _strokeWidth,
                        taskType: i == _notifier.currentIndex
                            ? TaskType.inProgress
                            : TaskType.pending,
                        animationDirection: _notifier.direction,
                      )),
                SizedBox(
                  height: StepperModel().stepHeight,
                  width: StepperModel().stepWidth,
                  child: buildImageChild(imageStepList[i].image!, i),
                )
              ]),
              if (i != _notifier.totalIndex - 1)
                StepperLine(
                  lineColor: lineColor,
                  length: CalculateLength(
                      size: StepperModel().stepperSize.height,////////////////////////
                      width: StepperModel().stepWidth,
                      height: StepperModel().stepHeight,
                      stepSize: _notifier.totalIndex)
                      .length(),
                  lineThickness: StepperModel().lineThickness,
                  lineType: _notifier.lineType,
                  axis: StepperModel().stepperAxis,
                ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                imageStepList[i].title??"",
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: i == _notifier.currentIndex ? 14 : 12,
                    color: i == _notifier.currentIndex
                        ? borderColor
                        : StepperModel().step.inactiveStepColor),
              ),
            ),
          )
        ],
      );

      widgetList.add(steps);
    }
    return widgetList;
  }

  Widget buildImageChild(Image image, int i) {
    return _buildSteps(image, i);
  }

  Widget buildChild(IconData icon, int i) {
    return _buildSteps(
        Icon(
          icon,
          color: Colors.white,
          size: 16.0,
        ),
        i);
  }

  ///Set step circle color
  Color _getCircleColor(i) {
    Color color;
    if (i < _notifier.currentIndex) {
      color = StepperModel().step.completeStepColor;
    } else if (i == _notifier.currentIndex) {
      color = StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

  ///Set step border color
  Color _getBorderColor(i) {
    Color color;
    if (i < _notifier.currentIndex) {
      color = StepperModel().step.completeStepColor;
    } else if (i == _notifier.currentIndex) {
      color = StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

  ///set stepper line color
  Color _getLineColor(i) {
    Color color;
    if (i < _notifier.currentIndex - 1) {
      color = StepperModel().step.completeStepColor;
    } else if (i == _notifier.currentIndex - 1) {
      color = StepperModel().step.currentStepColor;
    } else {
      color = StepperModel().step.inactiveStepColor;
    }
    return color;
  }

  ///set stepper text and icon
  Widget _getInnerElementOfStepper(index) {
    if (index < _notifier.currentIndex) {
      return _buildSteps(
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 16.0,
          ),
          index);
    } else if (index == _notifier.currentIndex) {
      return _buildSteps(
          Center(
            child: Text(
              '${_notifier.currentIndex + 1}',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          index);
    } else {
      return _buildSteps(
          Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          index);
    }
  }

  Widget _buildSteps(Widget child, int index) {
    Color shapeColor = _getCircleColor(index);
    return AnimatedContainer(
      margin: StepperModel().stepBorder ? StepperModel().step.margin : null,
      duration: const Duration(milliseconds: durationTime),
      child: ShapeWidget(
        shapeColor: shapeColor,
        borderShape: _notifier.borderShape,
        radius: StepperModel().radius,
        taskType: index == _notifier.currentIndex
            ? TaskType.inProgress
            : TaskType.pending,
        child: child,
      ),
    );
  }
}
