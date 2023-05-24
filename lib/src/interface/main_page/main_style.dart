import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

import '../../button/stepper_button.dart';
import '../../button/stepper_floating_button.dart';
import '../../page_helper/stepper_body.dart';
import '../../provider/stepper_index_handler.dart';
import '../../provider/stepper_provider.dart';
import '../../step_helper/stepper_step.dart';
import 'i_main_page.dart';

mixin MainStyle on IMainPage {

  @override
  Widget buildFloatingHorizontalStepper(StepperNotifier notifier) {
    return Stack(
      children: [
        Column(
          children: [
            buildStep(notifier),
            Expanded(
              child: StepperBody(
                notifier: notifier,
                stepperBodyWidget:  StepperModel().stepperBodyWidget,
              ),
            )
          ],
        ),
        if (notifier.currentIndex != 0 &&
             StepperModel().floatingPreviousButton != null)
          StepperFloatingButton(
              position:  StepperModel().floatingPreviousButton!.position,
              buttonColor:  StepperModel().floatingPreviousButton!.backgroundColor,
              axis:  StepperModel().stepperAxis,
              buttonIconColor:  StepperModel().floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier:notifier).back(notifier.currentIndex);
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
              StepperIndex(notifier: notifier)
                  .next(notifier.currentIndex,  StepperModel().totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon: notifier.currentIndex != notifier.totalIndex - 1
                ? Icons.arrow_forward_ios_sharp
                : Icons.check,
          ),
      ],
    );
  }

  @override
  Widget buildFloatingVerticalStepper(StepperNotifier notifier) {
    return Stack(
      children: [
        Row(
          children: [
            buildStep(notifier),
            Expanded(
              child: StepperBody(
                notifier: notifier,
                stepperBodyWidget:  StepperModel().stepperBodyWidget,
              ),
            )
          ],
        ),
        if (notifier.currentIndex != 0 &&
             StepperModel().floatingPreviousButton != null)
          StepperFloatingButton(
              position:  StepperModel().floatingPreviousButton!.position,
              buttonColor:  StepperModel().floatingPreviousButton!.backgroundColor,
              axis:  StepperModel().stepperAxis,
              buttonIconColor:  StepperModel().floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier: notifier).back(notifier.currentIndex);
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
              StepperIndex(notifier: notifier)
                  .next(notifier.currentIndex,  StepperModel().totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon: notifier.currentIndex != notifier.totalIndex - 1
                ?  StepperModel().stepperAxis == Axis.horizontal
                ? Icons.arrow_forward_ios_sharp
                : Icons.keyboard_arrow_down
                : Icons.check,
          ),
      ],
    );
  }

  @override
  Widget buildNormalHorizontalStepper(StepperNotifier notifier) {
    return Column(
      children: [
        buildStep(notifier),
        Expanded(
          child: StepperBody(
            notifier: notifier,
            stepperBodyWidget:  StepperModel().stepperBodyWidget,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: notifier)
                      .back(notifier.currentIndex);
                },
                stepperAButton:  StepperModel().previousButton!,
                text:  StepperModel().previousButton!.buttonText,
              ),
            Container(),
            if ( StepperModel().forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: notifier)
                      .next(notifier.currentIndex,  StepperModel().totalSteps - 1);
                },
                stepperAButton:  StepperModel().forwardButton!,
                text: notifier.currentIndex != notifier.totalIndex - 1
                    ?  StepperModel().forwardButton!.buttonText
                    :  StepperModel().forwardButton!.completeButtonText,
              ),
          ],
        )
      ],
    );
  }

  @override
  Widget buildNormalVerticalStepper(StepperNotifier notifier) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: notifier)
                      .back(notifier.currentIndex);
                },
                stepperAButton:  StepperModel().previousButton!,
                text:  StepperModel().previousButton!.buttonText,
              ),
            if (notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
              const SizedBox(
                height: 8,
              ),
            buildStep(notifier),
            if ( StepperModel().forwardButton != null)
              const SizedBox(
                height: 8,
              ),
            if ( StepperModel().forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: notifier)
                      .next(notifier.currentIndex,  StepperModel().totalSteps - 1);
                },
                stepperAButton:  StepperModel().forwardButton!,
                text: notifier.currentIndex != notifier.totalIndex - 1
                    ?  StepperModel().forwardButton!.buttonText
                    :  StepperModel().forwardButton!.completeButtonText,
              ),
          ],
        ),
        Expanded(
          child: StepperBody(
            notifier: notifier,
            stepperBodyWidget:  StepperModel().stepperBodyWidget,
          ),
        )
      ],
    );
  }

  Widget buildStep(StepperNotifier notifier) {
    return StepperStep(notifier: notifier);
  }

  Size stepperSizeCalculate() {
    double height =  StepperModel().stepHeight + 10;
    double width =  StepperModel().stepWidth + 10;
    if ( StepperModel().stepperAxis == Axis.horizontal) {
      height =  StepperModel().stepperSize.height > height
          ?  StepperModel().stepperSize.height
          : height;
      width =  StepperModel().stepperSize.width > 300 ?  StepperModel().stepperSize.width : 300;
    } else {
      height =
       StepperModel().stepperSize.height > 300 ?  StepperModel().stepperSize.height : 300;
      width =
       StepperModel().stepperSize.width > width ?  StepperModel().stepperSize.width : width;
    }
    return Size(width, height);
  }
}