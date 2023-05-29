/// /*** Uttam kumar mitra ***/
/// create date 04/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';
import '../utils/stepper_model.dart';

class StepperBody  {

  Widget build() {
    return PageView.builder(
        physics: !StepperModel().pageSwipe?const NeverScrollableScrollPhysics():null,
        controller: StepperModel().notifier.controller,
        scrollDirection: Axis.horizontal,
        itemCount: StepperModel().notifier.getTotalSteps,
        onPageChanged: (index) {
          Future.delayed(Duration.zero,()=>StepperModel().notifier.currentIndex = index);
        },
        itemBuilder: (BuildContext context, int index) {
          return Form(
            key:StepperModel().notifier.globalKeyList[index] ,
              child: StepperModel().stepperBodyWidget[index]);
        });
  }
}
