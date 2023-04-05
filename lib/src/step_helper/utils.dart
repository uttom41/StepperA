
import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

import '../../stepper_a.dart';
import '../border.dart';
import '../line.dart';

class Utils{
  ///for Stepper state management
 final StepperNotifier notifier;

 ///for Step border radius
 final Radius radius;

 ///for stepper height and width
 final double stepperSize;

 ///for step width
 final double stepWidth;

 ///for step height
 final double stepHeight;

 ///for step padding
 final EdgeInsets padding;

 ///for stepper line thickness
 final double lineThickness;

 const Utils({
   required this.notifier,
   required this.radius,
   required this.stepperSize,
   required this.stepWidth,
   required this.stepHeight,
   required this.padding,
   required this.lineThickness,
 });

 /// build all step
  List<Widget> steps(){
    var list = <Widget>[];
    for (int i = 0; i < notifier.totalIndex; i++) {
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);
      /// step circles
      list.add(
        Stack(children: [
          Positioned.fill(
            child: StepperBorder(
              borderShape: notifier.borderShape,
              borderType: notifier.borderType,
              dashPattern: notifier.dashPattern,
              radius: radius,
              borderColor: borderColor,
            ),
          ),
          Container(
            height: stepHeight,
            width: stepWidth,
            padding: padding,
            child: _getInnerElementOfStepper(i),
          )
        ]),
      );

      ///line between step circles
      if (i != notifier.totalIndex - 1) {
        list.add(
          StepperLine(
            lineColor: lineColor,
            length: CalculateLength(
                size: stepperSize,
                width: stepWidth,
                height: stepHeight,
                stepSize: notifier.totalIndex
            ).length(),
            lineThickness: lineThickness,
            lineType: notifier.lineType,
            axis: notifier.stepperAxis,
          ),
        );
      }
    }
    return list;
  }


  ///Set step circle color
 Color _getCircleColor(i) {
   Color color;
   if (i  < notifier.currentIndex) {
     color = notifier.stepCompleteColor;
   } else if (i  == notifier.currentIndex) {
     color = notifier.currentStepColor;
   } else {
     color = notifier.inactiveColor;
   }
   return color;
 }

 ///Set step border color
 Color _getBorderColor(i) {
   Color color;
   if (i  < notifier.currentIndex) {
     color = notifier.stepCompleteColor;
   } else if (i  == notifier.currentIndex) {
     color = notifier.currentStepColor;
   } else {
     color = notifier.inactiveColor;
   }
   return color;
 }

 ///set stepper line color
 Color _getLineColor(i) {
   Color color;
   if (i < notifier.currentIndex-1) {
     color = notifier.stepCompleteColor;
   } else if (i  == notifier.currentIndex-1) {
     color = notifier.currentStepColor;
   } else {
     color = notifier.inactiveColor;
   }
   return color;
 }

///set stepper text and icon
 Widget _getInnerElementOfStepper(index) {
   Color circleColor  = _getCircleColor(index);
   if (index < notifier.currentIndex) {
     return  AnimatedContainer(
       duration: Duration(milliseconds: DURATION_TIME),
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
   } else if (index == notifier.currentIndex) {
     return AnimatedContainer(
       duration: Duration(milliseconds: DURATION_TIME),
       decoration: BoxDecoration(
           color: circleColor,
           shape: BoxShape.circle
       ),
       child: Center(
         child: Text(
           '${notifier.currentIndex +1}',
           style: const TextStyle(fontSize: 12,color: Colors.white),
         ),
       ),
     );
   } else {
     return AnimatedContainer(
       duration: Duration(milliseconds: DURATION_TIME),
       decoration: BoxDecoration(
           color: circleColor,
           shape: BoxShape.circle
       ),
       child: Center(
         child: Text(
           '${index + 1}',
           style: const TextStyle(fontSize: 12,color:Colors.white),
         ),
       ),
     );
   }
 }
}