
/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

import '../../button/stepper_button.dart';
import '../../button/stepper_floating_button.dart';
import '../../page_helper/stepper_body.dart';
import '../../provider/stepper_index_handler.dart';
import '../../step_helper/stepper_step.dart';
import 'i_main_page.dart';

mixin MainStyle on IMainPage {

  @override
  Widget buildFloatingHorizontalStepper() {
    return Stack(
      children: [
        Column(
          children: [
            StepperStep(),
            const Expanded(
              child: StepperBody(),
            )
          ],
        ),
        if (StepperModel().notifier.currentIndex != 0 &&
            StepperModel().floatingPreviousButton != null)
          StepperFloatingButton(
              position:  StepperModel().floatingPreviousButton!.position,
              buttonColor:  StepperModel().floatingPreviousButton!.backgroundColor,
              axis:  StepperModel().stepperAxis,
              buttonIconColor:  StepperModel().floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier:StepperModel().notifier).back(StepperModel().notifier.currentIndex);
              },
              heroTag: "tag1",
              buttonIcon: Icons.arrow_back_ios_sharp),
        if ( StepperModel().floatingForwardButton != null)
          StepperFloatingButton(
            position:  StepperModel().floatingForwardButton!.position,
            buttonColor:  StepperModel().floatingForwardButton!.backgroundColor,
            axis:  StepperModel().stepperAxis,
            buttonIconColor:  StepperModel().floatingForwardButton!.buttonIconColor,
            onTap: () {
              StepperIndex(notifier: StepperModel().notifier)
                  .next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon: StepperModel().notifier.currentIndex != StepperModel().notifier.totalIndex - 1
                ? Icons.arrow_forward_ios_sharp
                : Icons.check,
          ),
      ],
    );
  }

  @override
  Widget buildFloatingVerticalStepper() {
    return Stack(
      children: [
        Row(
          children: [
            StepperStep(),
            const Expanded(
              child: StepperBody(),
            )
          ],
        ),
        if (StepperModel().notifier.currentIndex != 0 &&
            StepperModel().floatingPreviousButton != null)
          StepperFloatingButton(
              position:  StepperModel().floatingPreviousButton!.position,
              buttonColor:  StepperModel().floatingPreviousButton!.backgroundColor,
              axis:  StepperModel().stepperAxis,
              buttonIconColor:  StepperModel().floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier: StepperModel().notifier).back(StepperModel().notifier.currentIndex);
              },
              heroTag: "tag1",
              buttonIcon:  StepperModel().stepperAxis == Axis.horizontal
                  ? Icons.arrow_back_ios_sharp
                  : Icons.keyboard_arrow_up),
        if ( StepperModel().floatingForwardButton != null)
          StepperFloatingButton(
            position:  StepperModel().floatingForwardButton!.position,
            buttonColor:  StepperModel().floatingForwardButton!.backgroundColor,
            axis:  StepperModel().stepperAxis,
            buttonIconColor:  StepperModel().floatingForwardButton!.buttonIconColor,
            onTap: () {
              StepperIndex(notifier: StepperModel().notifier)
                  .next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon: StepperModel().notifier.currentIndex != StepperModel().notifier.totalIndex - 1
                ?  StepperModel().stepperAxis == Axis.horizontal
                ? Icons.arrow_forward_ios_sharp
                : Icons.keyboard_arrow_down
                : Icons.check,
          ),
      ],
    );
  }

  @override
  Widget buildNormalHorizontalStepper() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StepperStep(),
        const Expanded(
          child: StepperBody(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: StepperModel().notifier)
                      .back(StepperModel().notifier.currentIndex);
                },
                stepperAButton:  StepperModel().previousButton!(StepperModel().notifier.currentIndex),
                child:  StepperModel().previousButton!(StepperModel().notifier.currentIndex).buttonWidget,
              ),
            Container(),
            if ( StepperModel().forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: StepperModel().notifier)
                      .next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1);
                },
                stepperAButton:  StepperModel().forwardButton!(StepperModel().notifier.currentIndex),
                child: StepperModel().forwardButton!(StepperModel().notifier.currentIndex).buttonWidget
                // StepperModel().notifier.currentIndex != StepperModel().notifier.totalIndex - 1
                //     ?  StepperModel().forwardButton!.buttonWidget
                //     :  StepperModel().forwardButton!.completeButtonWidget,
              ),
          ],
        )
      ],
    );
  }

  @override
  Widget buildNormalVerticalStepper() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: StepperModel().notifier)
                      .back(StepperModel().notifier.currentIndex);
                },
                stepperAButton:  StepperModel().previousButton!(StepperModel().notifier.currentIndex),
                child:  StepperModel().previousButton!(StepperModel().notifier.currentIndex).buttonWidget,
              ),
            if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              const SizedBox(height: 8),
            StepperStep(),
            if ( StepperModel().forwardButton != null)
              const SizedBox(height: 8),
            if ( StepperModel().forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: StepperModel().notifier)
                      .next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1);
                },
                stepperAButton:  StepperModel().forwardButton!(StepperModel().notifier.currentIndex),
                child: StepperModel().forwardButton!(StepperModel().notifier.currentIndex).buttonWidget
                // StepperModel().notifier.currentIndex != StepperModel().notifier.totalIndex - 1
                //     ?  StepperModel().forwardButton!.buttonWidget
                //     :  StepperModel().forwardButton!.completeButtonWidget,
              ),
          ],
        ),
        const Expanded(
          child: StepperBody(),
        )
      ],
    );
  }

}