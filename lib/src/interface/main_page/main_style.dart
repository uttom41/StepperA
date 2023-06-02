
/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

import '../../../stepper_a.dart';
import '../../button/stepper_button.dart';
import '../../button/stepper_floating_button.dart';
import '../../page_helper/stepper_body.dart';
import '../../provider/stepper_index_handler.dart';
import '../../step_helper/stepper_step.dart';
import 'i_main_page.dart';

mixin MainStyle on IMainPage {

  @override
  Widget buildFloatingHorizontalStepper() {
    FloatingButton? prevBtn;
    FloatingButton? forWardBtn;
    if (StepperModel().notifier.currentIndex != 0 &&
        StepperModel().floatingPreviousButton != null){
      prevBtn = StepperModel().floatingPreviousButton;
    }
    if(StepperModel().floatingForwardButton != null){
      forWardBtn = StepperModel().floatingForwardButton;
    }

    return Stack(
      children: [
        Column(
          children: [
            StepperStep(),
            Expanded(
              child: StepperBody().build(),
            )
          ],
        ),

        if (prevBtn != null)
          StepperFloatingButton(
              position:  prevBtn.position,
              buttonColor:  prevBtn.backgroundColor,
              axis:  StepperModel().stepperAxis,
              buttonIconColor:  prevBtn.buttonIconColor,
              onTap: () {
                if(StepperIndex().back(StepperModel().notifier.currentIndex))prevBtn?.onTap(StepperModel().notifier.currentIndex);
              },
              heroTag: "tag1",
              buttonIcon: Icons.arrow_back_ios_sharp),
        if ( forWardBtn != null)
          StepperFloatingButton(
            position:  forWardBtn.position,
            buttonColor: forWardBtn.backgroundColor,
            axis:  StepperModel().stepperAxis,
            buttonIconColor:  forWardBtn.buttonIconColor,
            onTap: () {
              if(StepperIndex().next(StepperModel().notifier.currentIndex,
                  StepperModel().totalSteps - 1))forWardBtn?.onTap(StepperModel().notifier.currentIndex);
            },
            heroTag: "tag2",
            buttonIcon: StepperModel().notifier.currentIndex != StepperModel().notifier.getTotalSteps - 1
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
             Expanded(
              child: StepperBody().build(),
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
                StepperIndex().back(StepperModel().notifier.currentIndex);
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
              StepperIndex()
                  .next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon: StepperModel().notifier.currentIndex != StepperModel().notifier.getTotalSteps - 1
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
    StepperAButton? prevBtn;
    StepperAButton? forwardBtn;
    if ( StepperModel().forwardButton != null){
      forwardBtn =  StepperModel().forwardButton!(StepperModel().notifier.currentIndex);
    }
    if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null){
      prevBtn = StepperModel().previousButton!(StepperModel().notifier.currentIndex);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StepperStep(),
         Expanded(
          child: StepperBody().build(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (prevBtn != null)
              StepperAButtonWidget(
                onTap: () {
                  if(StepperIndex().back(StepperModel().notifier.currentIndex)) {
                    prevBtn?.onTap(StepperModel().notifier.currentIndex);
                  }
                },
                stepperAButton:  prevBtn,
                child:  prevBtn.buttonWidget,
              ),
            Container(),
            if ( forwardBtn != null)
              StepperAButtonWidget(
                onTap: () {
                  if(StepperIndex().next(StepperModel().notifier.currentIndex,  StepperModel().totalSteps - 1)){
                    forwardBtn?.onTap(StepperModel().notifier.currentIndex);
                    }
                },
                stepperAButton:  forwardBtn,
                child: forwardBtn.buttonWidget
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
    StepperAButton? prevBtn;
    StepperAButton? forwardBtn;
    if ( StepperModel().forwardButton != null){
      forwardBtn =  StepperModel().forwardButton!(StepperModel().notifier.currentIndex);
    }
    if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null){
       prevBtn = StepperModel().previousButton!(StepperModel().notifier.currentIndex);
    }
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(prevBtn !=null)
              StepperAButtonWidget(
                onTap: () {
                  if(StepperIndex().back(StepperModel().notifier.currentIndex)) prevBtn?.onTap(StepperModel().notifier.currentIndex);
                  //StepperIndex(notifier: StepperModel().notifier).back(StepperModel().notifier.currentIndex);
                },
                stepperAButton:  prevBtn,
                child:  prevBtn.buttonWidget,
              ),
            //if (StepperModel().notifier.currentIndex != 0 &&  StepperModel().previousButton != null)
            //  const SizedBox(height: 8),
            StepperStep(),
            //if ( StepperModel().forwardButton != null)
             // const SizedBox(height: 8),
            if (forwardBtn != null)
              StepperAButtonWidget(
                onTap: () {
                  if(StepperIndex().next(StepperModel().notifier.currentIndex,
                      StepperModel().totalSteps - 1))prevBtn?.onTap(StepperModel().notifier.currentIndex);
                },
                stepperAButton:  StepperModel().forwardButton!(StepperModel().notifier.currentIndex),
                child: forwardBtn.buttonWidget
                // StepperModel().notifier.currentIndex != StepperModel().notifier.totalIndex - 1
                //     ?  StepperModel().forwardButton!.buttonWidget
                //     :  StepperModel().forwardButton!.completeButtonWidget,
              ),
          ],
        ),
         Expanded(
          child: StepperBody().build(),
        )
      ],
    );
  }

}