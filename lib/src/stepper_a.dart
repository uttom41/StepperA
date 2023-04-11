import 'package:flutter/material.dart';
import 'package:stepper_a/src/button/button.dart';
import 'package:stepper_a/src/page_helper/stepper_body.dart';
import 'package:stepper_a/src/step_helper/step.dart';
import 'package:stepper_a/src/step_helper/stepper_step.dart';
import 'package:stepper_a/src/provider/stepper_index_handler.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';
import 'package:stepper_a/src/stepper_a_controller.dart';
import 'button/stepper_button.dart';
import 'drawing/drawing_helper.dart';



///Would you need current Step index please use this typedef.
typedef CurrentStepCallBack = void Function(int index);

///StepperA class is main class
class StepperA extends StatefulWidget {

  ///for define stepper background color
  final Color stepperBackgroundColor;

  ///for define stepper body list of page
  ///this list of page length is stepper length
  final List<Widget> stepperBodyWidget;

  ///if your need current step index use this field
 // final CurrentStepCallBack? currentStepCallBack;

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
  ///StepperSize must be minimum [stepWidth] and [stepHeight]
  final Size stepperSize;

  ///this field stepper step width.
  ///default step width is 50.
  final double stepWidth;

  ///this field stepper step height.
  ///default step height is 50.
  final double stepHeight;

  ///If your need stepper padding
  final EdgeInsets padding;

  ///If you need stepper margin
  ///default margin all site 5
  final EdgeInsets margin;

  ///If you need stepper step padding
  final EdgeInsets stepPadding;

  ///If you need stepper Axis wise build
  final Axis stepperAxis;

  ///It is Control Step color and icon.
  final StepA step;


  ///If  you need widget form validation
  final GlobalKey<FormState> ? formKey;

  final Button? forwardButton;
  final Button? previousButton;
  final StepperAController? stepperAController;

  const StepperA({
    Key? key,
    this.lineThickness =2,
    required this.stepperSize,
    required this.stepperBodyWidget,
    this.stepperBackgroundColor = Colors.white,
  //  this.currentStepCallBack,
    this.padding = const EdgeInsets.all(5),
    this.margin = const EdgeInsets.all(5),
    this.stepPadding = const EdgeInsets.all(5),
    this.radius = const Radius.circular(10),
    this.borderType= BorderType.straight,
    this.lineType = LineType.straight,
    this.borderShape = BorderShape.circle,
    this.dashPattern = const <double>[3, 5],
    this.stepHeight = 50,
    this.stepWidth = 50,
    this.stepperAxis = Axis.horizontal,
    this.formKey,
    this.forwardButton,
    this.previousButton,
    this.stepperAController,
    required this.step
  })  :super(key: key);

  @override
  State<StepperA> createState() => _StepperAState();
}

class _StepperAState extends State<StepperA> with TickerProviderStateMixin{

  ///default set total step size in stepper.
  int totalSteps=0;

  ///Stepper Notifier for internal state management
  late StepperNotifier notifier;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  late PageController _pageController;


  @override
  void initState() {
    ///total steps size update
    totalSteps=widget.stepperBodyWidget.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _pageController = PageController();
    ///init StepperNotifier
    notifier = StepperNotifier(
     // stepCompleteColor: widget.stepCompleteColor,
     // currentStepColor: widget.currentStepColor,
    //  inactiveColor: widget.inactiveColor,
      borderType: widget.borderType,
      lineType: widget.lineType,
      borderShape: widget.borderShape,
      dashPattern: widget.dashPattern,
      stepperAxis: widget.stepperAxis,
      initialPage: 0,
      length: totalSteps,
      controller: _pageController,
      vsync: this,
      formKey: widget.formKey,
      onPageChangeCallback: (int activePageIndex) {
       // widget.currentStepCallBack!=null?widget.currentStepCallBack!(activePageIndex):null;
      },
    );
    if(widget.stepperAController != null) widget.stepperAController?.setNotifier=notifier;
    return AnimatedBuilder(
        animation: notifier,
        builder: (BuildContext context,  child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body:widget.stepperAxis == Axis.horizontal?Stack(
              children: [
                Column(
                  children: [
                    StepperStep(
                      backgroundColor: widget.stepperBackgroundColor,
                      padding: widget.padding,
                      notifier: notifier,
                      stepHeight: widget.stepHeight,
                      stepperSize: stepperSizeCalculate(),
                      radius: widget.radius,
                      lineThickness: widget.lineThickness,
                      stepWidth: widget.stepWidth,
                     // stepPadding: widget.stepPadding,
                      margin: widget.margin,
                      step: widget.step,
                    ),
                    Expanded(
                      child: StepperBody(
                        notifier: notifier,
                        stepperBodyWidget: widget.stepperBodyWidget,
                      ),
                    )
                  ],
                ),
                if(notifier.currentIndex != 0
                    && widget.previousButton != null
                )
                  StepperButton(
                      position: widget.previousButton!.position,
                      buttonColor: widget.previousButton!.backgroundColor,
                      notifier: notifier,
                      buttonIconColor:  widget.previousButton!.buttonIconColor,
                      onTap: (){
                        StepperIndex(notifier:notifier).back(notifier.currentIndex);
                        //  widget.currentStep!=null?widget.currentStep!(notifier.currentIndex):null;
                      },
                      heroTag: "tag1",
                      buttonIcon: widget.stepperAxis== Axis.horizontal
                          ?Icons.arrow_back_ios_sharp
                          :Icons.keyboard_arrow_up
                  ),
                if(widget.forwardButton != null)
                  StepperButton(
                    position: widget.forwardButton!.position,
                    buttonColor: widget.forwardButton!.backgroundColor,
                    notifier: notifier,
                    buttonIconColor:  widget.forwardButton!.buttonIconColor,
                    onTap: (){
                      StepperIndex(notifier:notifier).next(notifier.currentIndex, totalSteps-1);
                      //  widget.currentStep!=null?widget.currentStep!(notifier.currentIndex):null;
                    },
                    heroTag: "tag2",
                    buttonIcon:notifier.currentIndex != notifier.totalIndex-1
                        ? widget.stepperAxis== Axis.horizontal
                        ?Icons.arrow_forward_ios_sharp
                        :Icons.keyboard_arrow_down
                        :Icons.check,
                  ),
              ],
            ):Stack(
              children: [
                Row(
                  children: [
                    StepperStep(
                      backgroundColor: widget.stepperBackgroundColor,
                      padding: widget.padding,
                      notifier: notifier,
                      stepHeight: widget.stepHeight,
                      stepperSize: stepperSizeCalculate(),
                      radius: widget.radius,
                      lineThickness: widget.lineThickness,
                      stepWidth: widget.stepWidth,
                      step: widget.step,
                      //stepPadding: widget.stepPadding,
                      margin: widget.margin,
                    ),
                    Expanded(
                      child: StepperBody(
                        notifier: notifier,
                        stepperBodyWidget: widget.stepperBodyWidget,
                      ),
                    )
                  ],
                ),
                if(notifier.currentIndex != 0
                    && widget.previousButton != null
                )
                  StepperButton(
                      position: widget.previousButton!.position,
                      buttonColor: widget.previousButton!.backgroundColor,
                      notifier: notifier,
                      buttonIconColor:  widget.previousButton!.buttonIconColor,
                      onTap: (){
                        StepperIndex(notifier:notifier).back(notifier.currentIndex);
                        //  widget.currentStep!=null?widget.currentStep!(notifier.currentIndex):null;
                      },
                      heroTag: "tag1",
                      buttonIcon: widget.stepperAxis== Axis.horizontal
                          ?Icons.arrow_back_ios_sharp
                          :Icons.keyboard_arrow_up
                  ),
                if(widget.forwardButton != null)
                  StepperButton(
                    position: widget.forwardButton!.position,
                    buttonColor: widget.forwardButton!.backgroundColor,
                    notifier: notifier,
                    buttonIconColor:  widget.forwardButton!.buttonIconColor,
                    onTap: (){
                      StepperIndex(notifier:notifier).next(notifier.currentIndex, totalSteps-1);
                      //  widget.currentStep!=null?widget.currentStep!(notifier.currentIndex):null;
                    },
                    heroTag: "tag2",
                    buttonIcon:notifier.currentIndex != notifier.totalIndex-1
                        ? widget.stepperAxis== Axis.horizontal
                        ?Icons.arrow_forward_ios_sharp
                        :Icons.keyboard_arrow_down
                        :Icons.check,
                  ),
              ],
            ),
          );
        });
  }



  ///Stepper width and height calculation
  Size stepperSizeCalculate(){
    double height = widget.stepHeight + 10;
    double width = widget.stepWidth + 10;
    if(widget.stepperAxis == Axis.horizontal){
      height = widget.stepperSize.height>height?widget.stepperSize.height:height;
      width = widget.stepperSize.width>300?widget.stepperSize.width:300;
    }else{
      height = widget.stepperSize.height>300?widget.stepperSize.height:300;
      width = widget.stepperSize.width>width?widget.stepperSize.width:width;
    }
    return Size(width,height);
  }
}

