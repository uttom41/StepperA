import 'package:flutter/material.dart';

import 'border.dart';
import 'line.dart';

///Would you need current Step index please use this typedef.
typedef CurrentStep = void Function(int index);

///IF you need different Step border style
///default border style is [straight]
enum BorderType{
  straight,
  dotted
}

///If you need different BorderShape
///default borderShape is [circle]
enum BorderShape{
  circle,
  rectangle
}

///If need different Stepper line style
///default stepper line style is [straight]
enum LineType {
  straight,
  dotted,
}

///StepperA class is main class
class StepperA extends StatefulWidget {

  ///for define step complete border and shape[circle] color
  final Color stepCompleteColor;

  ///for define current step border and shape[circle] color
  final Color currentStepColor;

  ///for define inactive step border and shape[circle] color
  final Color inactiveColor;

  ///for define previous and forward button background color
  final Color buttonColor;

  ///for define previous and forward button icon color
  final Color buttonIconColor;

  ///for define stepper body list of page
  ///this list of page length is stepper length
  final List<Widget> stepperBodyWidget;

  ///if your need current step index use this field
  final CurrentStep? currentStep;

  ///for your need stepper line thickness use this field
  ///default thickness [2.0] double
  final double lineThickness;

  ///IF you need different Step border style
  ///default border style is [straight]
  final BorderType borderType;

  ///If need different Stepper line style
  ///default stepper line style is [straight]
  final LineType lineType;

  ///If you need different BorderShape
  ///default borderShape is [circle]
  final BorderShape borderShape;

  /// A circular array of dash offsets and lengths.
  ///
  /// For example, the array `[5, 10]` would result in dashes 5 pixels long
  /// default the array [3,5]
  final List<double> dashPattern;

  ///this field no need for [circle] type border.
  ///if your need [rectangle] type border shape all side radius.
  final Radius radius;

  ///this field are required for stepper width for[Horizontal Axis] and height for[Vertical Axis]
  final double stepperSize;

  ///this field stepper step width.
  ///default step width is 50.
  final double stepWidth;

  ///this field stepper step height.
  ///default step height is 50.
  final double stepHeight;

  ///If your need stepper padding
  final EdgeInsets padding;

  ///If your need stepper Axis wise build
  final Axis stepperAxis;

  const StepperA({
    Key? key,
    required this.stepCompleteColor,
    required this.inactiveColor,
    required this.currentStepColor,
    this.lineThickness =2,
    required this.stepperSize,
    required this.buttonColor,
    required this.buttonIconColor,
    required this.stepperBodyWidget,
    this.currentStep,
    this.padding = const EdgeInsets.all(5),
    this.radius = const Radius.circular(10),
    this.borderType= BorderType.straight,
    this.lineType = LineType.straight,
    this.borderShape = BorderShape.circle,
    this.dashPattern = const <double>[3, 5],
    this.stepHeight = 50,
    this.stepWidth = 50,
    this.stepperAxis = Axis.horizontal,
  })  : //assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  State<StepperA> createState() => _StepperAState();
}

class _StepperAState extends State<StepperA> {

  ///default set current step size in stepper.
   int curStep=1;

   ///default set total step size in stepper.
   int totalSteps=1;

   @override
  void initState() {
     ///total steps size update
     totalSteps=widget.stepperBodyWidget.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - (AppBar().preferredSize.height+20),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          child: widget.stepperAxis == Axis.horizontal?Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
               // width: double.infinity,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: widget.padding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _steps(),
                    ),
                  ),
                ),
              ),
            ),

            _stepperBodyWidget(top: widget.stepHeight+10, bottom: 0, left: 0, right: 0),

           _leftButton(bottom: 20, left: 20),

            _rightButton(bottom: 20, right: 20,),

          ],
        ):Stack(
          children: [
            Positioned(
              left: 5,
              child: Container(
                height:  MediaQuery.of(context).size.height - 100,
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Container(
                    padding: widget.padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _steps(),
                    ),
                  ),
                ),
              ),
            ),

            _stepperBodyWidget(top: 25,bottom: 0,right: 0,left: 60),

            _leftButton(top: 40,left: 8),

            _rightButton(bottom: 40,left: 8),
          ],
        ),
      ),
    ));
  }

  Widget _stepperBodyWidget({
     double? top,
     double? bottom,
     double? left,
     double? right,
  }){
     return Positioned (
       top: top,
       bottom: bottom,
       left: left,
       right: right,
       child: SizedBox(
         height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
         width: MediaQuery.of(context).size.width,
         child:  widget.stepperBodyWidget.isNotEmpty?widget.stepperBodyWidget[curStep-1]:const Center(child: Text("stepperBodyWidget is empty!"),),
       ),
     );
  }

  Widget _leftButton({
    double? top,
    double? bottom,
    double? left,
    double? right,
}){
     return  curStep!=1?Positioned(
       top: top,
       bottom: bottom,
       left: left,
       right: right,
       child: FloatingActionButton(
         mini: true,
         backgroundColor: widget.buttonColor,
         heroTag: "tag1",
         onPressed: (){

           setState((){
             curStep= _StepperIndex.back(curStep);
             widget.currentStep!=null?widget.currentStep!(curStep):null;
           });
         },
         child: widget.stepperAxis== Axis.horizontal? Icon(
           Icons.arrow_back_ios_sharp,
           color: widget.buttonIconColor,
           size: 26.0,
         ):Icon(
           Icons.keyboard_arrow_up,
           color: widget.buttonIconColor,
           size: 46.0,
         ),
       ),
     ):Container();
  }

  Widget _rightButton({
    double? top,
    double? bottom,
    double? left,
    double? right,
}){
     return Positioned(
       bottom: bottom,
       right: right,
       top: top,
       left: left,
       child: FloatingActionButton(
         mini: true,
         backgroundColor: widget.buttonColor,
         heroTag: "tag2",
         onPressed: (){
           setState((){
             curStep= _StepperIndex.next(curStep, totalSteps);
             widget.currentStep!=null?widget.currentStep!(curStep):null;
           });
         },
         child: curStep != totalSteps?Icon(
           widget.stepperAxis== Axis.horizontal?Icons.arrow_forward_ios_sharp:Icons.keyboard_arrow_down,
           color: widget.buttonIconColor,
           size: widget.stepperAxis== Axis.horizontal?26.0:46,
         ):Icon(
           Icons.check,
           color: widget.buttonIconColor,
           size: 26.0,
         ),
       ),
     );
  }

 Color _getCircleColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = widget.stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = widget.currentStepColor;
    } else {
      color = widget.inactiveColor;
    }
    return color;
  }

 Color _getBorderColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = widget.stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = widget.currentStepColor;
    } else {
      color = widget.inactiveColor;
    }
    return color;
  }

 Color _getLineColor(i) {
    Color color;
    if (i < curStep-2) {
      color = widget.stepCompleteColor;
    } else if (i  == curStep-2) {
      color = widget.currentStepColor;
    } else {
      color = widget.inactiveColor;
    }
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);
      // step circles
      list.add(
        Stack(children: [
          Positioned.fill(
            child: StepperBorder(
              borderShape: widget.borderShape,
              borderType: widget.borderType,
              dashPattern: widget.dashPattern,
              radius: widget.radius,
              borderColor: borderColor,
            ),
          ),
          Container(
            height: widget.stepHeight,
            width: widget.stepWidth,
            padding: widget.padding,
            child: _getInnerElementOfStepper(i),
          )
        ]),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          StepperLine(
            lineColor: lineColor,
            length: CalculateLength(
                size: widget.stepperSize,
                width: widget.stepWidth,
                height: widget.stepHeight,
                stepSize: totalSteps
              ).length(),
              lineThickness: widget.lineThickness,
              lineType: widget.lineType,
              axis: widget.stepperAxis,
            ),
        );
      }
    }

    return list;
  }

  Widget _getInnerElementOfStepper(index) {
    Color circleColor  = _getCircleColor(index);
    if (index + 1 < curStep) {
      return  Container(
        decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 16.0,
        ),
      );
    } else if (index + 1 == curStep) {
      return Container(
        decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            '$curStep',
            style: const TextStyle(fontSize: 12,color: Colors.white),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 12,color: widget.stepCompleteColor),
          ),
        ),
      );
    }
  }
}

/// this class for stepper index calculation
class _StepperIndex{
  /// this method  using  for stepper forward index update.
  static int next(int x, int y) {
    if (x < y) {
      return (x + 1);
    }
    return x;
  }

  /// this method using for stepper previous index update
  static int back(int x) {
    if (x > 1) {
      return (x - 1);
    }
    return x;
  }
}