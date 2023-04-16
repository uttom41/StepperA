import 'package:flutter/material.dart';
import '../provider/stepper_provider.dart';

class StepperBody extends StatelessWidget {
  final StepperNotifier notifier;
  final List<Widget> stepperBodyWidget;

  const StepperBody({
    Key? key,
    required this.notifier,
    required this.stepperBodyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: notifier.formKey,
      child: PageView.builder(
          controller: notifier.controller,
          scrollDirection: Axis.horizontal,
          itemCount: notifier.totalIndex,
          onPageChanged: (index) {
            notifier.currentIndex = index;
          },
          itemBuilder: (BuildContext context, int index) {
            return stepperBodyWidget[index];
          }),
    );
  }
}
