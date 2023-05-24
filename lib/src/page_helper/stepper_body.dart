/// /*** Uttam kumar mitra ***/
/// create date 04/04/2023; 10:36 PM
///
///
///
import 'package:flutter/material.dart';
import '../utils/stepper_model.dart';

class StepperBody extends StatelessWidget {

  const StepperBody({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: StepperModel().notifier.formKey,
      child: PageView.builder(
          controller: StepperModel().notifier.controller,
          scrollDirection: Axis.horizontal,
          itemCount: StepperModel().notifier.totalIndex,
          onPageChanged: (index) {
            StepperModel().notifier.currentIndex = index;
          },
          itemBuilder: (BuildContext context, int index) {
            return StepperModel().stepperBodyWidget[index];
          }),
    );
  }
}
