import 'package:flutter/material.dart';
import 'package:stepper_a/src/page_helper/stepper_body.dart';
import 'package:stepper_a/src/step_helper/stepper_step.dart';
import 'package:stepper_a/src/provider/stepper_index_handler.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';
import '../stepper_a.dart';
import 'button/stepper_button.dart';
import 'button/stepper_floating_button.dart';


///StepperA class is main class
class StepperA extends StatefulWidget {
  ///for define stepper background color
   final Color stepperBackgroundColor;

  ///for define stepper body list of page
  ///this list of page length is stepper length
  final List<Widget> stepperBodyWidget;

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
  final GlobalKey<FormState>? formKey;


  final FloatingButton? floatingForwardButton;
  final FloatingButton? floatingPreviousButton;
  final StepperAButton? previousButton;
  final StepperAButton? forwardButton;
  final StepperAController? stepperAController;
  final List<CustomSteps>? customSteps;

  final bool? _floatingButton;
  final bool stepBorder;

  const StepperA(
      {Key? key,
        this.lineThickness = 2,
        required this.stepperSize,
        required this.stepperBodyWidget,
        this.stepperBackgroundColor = Colors.white,
        this.padding = const EdgeInsets.all(5),
        this.margin = const EdgeInsets.all(5),
        this.stepPadding = const EdgeInsets.all(5),
        this.radius = const Radius.circular(10),
        this.borderType = BorderType.straight,
        this.lineType = LineType.straight,
        this.borderShape = BorderShape.circle,
        this.dashPattern = const <double>[3, 5],
        this.stepHeight = 50,
        this.stepWidth = 50,
        this.stepperAxis = Axis.horizontal,
        this.formKey,
        this.floatingForwardButton,
        this.floatingPreviousButton,
        this.forwardButton,
        this.previousButton,
        this.stepperAController,
        bool? floatingButton,
        required this.stepBorder,
        this.customSteps,
        required this.step})
      :
        _floatingButton = floatingButton,
        super(key: key);

  @override
  State<StepperA> createState() => _StepperAState();
}

class _StepperAState extends State<StepperA> with TickerProviderStateMixin {
  ///default set total step size in stepper.
  int totalSteps = 0;

  ///Stepper Notifier for internal state management
  late StepperNotifier _notifier;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  late PageController _pageController;

  @override
  void initState() {
    ///total steps size update
    ///
    totalSteps = widget.stepperBodyWidget.length;

    super.initState();
  }

  Widget buildFloatingHorizontalStepper(){
    return Stack(
      children: [
        Column(
          children: [
            buildStep(),
            Expanded(
              child: StepperBody(
                notifier: _notifier,
                stepperBodyWidget: widget.stepperBodyWidget,
              ),
            )
          ],
        ),
        if (_notifier.currentIndex != 0
            && widget.floatingPreviousButton != null)
          StepperFloatingButton(
              position: widget.floatingPreviousButton!.position,
              buttonColor: widget.floatingPreviousButton!.backgroundColor,
              axis: widget.stepperAxis,
              buttonIconColor: widget.floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier: _notifier).back(_notifier.currentIndex);
              },
              heroTag: "tag1",
              buttonIcon: Icons.arrow_back_ios_sharp),

        if (widget.floatingForwardButton != null)
          StepperFloatingButton(
            position: widget.floatingForwardButton!.position,
            buttonColor: widget.floatingForwardButton!.backgroundColor,
            axis: widget.stepperAxis,
            buttonIconColor: widget.floatingForwardButton!.buttonIconColor,
            onTap: () {
              StepperIndex(notifier: _notifier).next(_notifier.currentIndex, totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon:
            _notifier.currentIndex != _notifier.totalIndex - 1
                ? Icons.arrow_forward_ios_sharp
                : Icons.check,
          ),
      ],
    );
  }

  Widget buildFloatingVerticalStepper(){
    return Stack(
      children: [
        Row(
          children: [
            buildStep(),
            Expanded(
              child: StepperBody(
                notifier: _notifier,
                stepperBodyWidget: widget.stepperBodyWidget,
              ),
            )
          ],
        ),
        if (_notifier.currentIndex != 0 &&
            widget.floatingPreviousButton != null)
          StepperFloatingButton(
              position: widget.floatingPreviousButton!.position,
              buttonColor: widget.floatingPreviousButton!.backgroundColor,
              axis: widget.stepperAxis,
              buttonIconColor:
              widget.floatingPreviousButton!.buttonIconColor,
              onTap: () {
                StepperIndex(notifier: _notifier)
                    .back(_notifier.currentIndex);
              },
              heroTag: "tag1",
              buttonIcon: widget.stepperAxis == Axis.horizontal
                  ? Icons.arrow_back_ios_sharp
                  : Icons.keyboard_arrow_up),
        if (widget.floatingForwardButton != null)
          StepperFloatingButton(
            position: widget.floatingForwardButton!.position,
            buttonColor: widget.floatingForwardButton!.backgroundColor,
            axis: widget.stepperAxis,
            buttonIconColor:
            widget.floatingForwardButton!.buttonIconColor,
            onTap: () {
              StepperIndex(notifier: _notifier)
                  .next(_notifier.currentIndex, totalSteps - 1);
            },
            heroTag: "tag2",
            buttonIcon:
            _notifier.currentIndex != _notifier.totalIndex - 1
                ? widget.stepperAxis == Axis.horizontal
                ? Icons.arrow_forward_ios_sharp
                : Icons.keyboard_arrow_down
                : Icons.check,
          ),
      ],
    );
  }

  Widget buildNormalHorizontalStepper(){
    return Column(
      children: [
        buildStep(),
        Expanded(
          child:StepperBody(
            notifier: _notifier,
            stepperBodyWidget: widget.stepperBodyWidget,

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_notifier.currentIndex != 0 &&
                widget.previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: _notifier)
                      .back(_notifier.currentIndex);
                },
                stepperAButton: widget.previousButton!,
                text: widget.previousButton!.buttonText,
              ),
            Container(),
            if (widget.forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: _notifier).next(_notifier.currentIndex, totalSteps - 1);
                },
                stepperAButton:  widget.forwardButton!,
                text: _notifier.currentIndex != _notifier.totalIndex - 1
                    ? widget.forwardButton!.buttonText
                    : widget.forwardButton!.completeButtonText,
              ),
          ],
        )
      ],
    );
  }

  Widget buildNormalVerticalStepper(){
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_notifier.currentIndex != 0 &&
                widget.previousButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: _notifier)
                      .back(_notifier.currentIndex);
                },
                stepperAButton: widget.previousButton!,
                text: widget.previousButton!.buttonText,
              ),
            if (_notifier.currentIndex != 0 &&
                widget.previousButton != null)const SizedBox(height: 8,),
            buildStep(),
            if (widget.forwardButton != null)const SizedBox(height: 8,),
            if (widget.forwardButton != null)
              StepperAButtonWidget(
                onTap: () {
                  StepperIndex(notifier: _notifier).next(_notifier.currentIndex, totalSteps - 1);
                },
                stepperAButton:  widget.forwardButton!,
                text: _notifier.currentIndex != _notifier.totalIndex - 1
                    ? widget.forwardButton!.buttonText
                    : widget.forwardButton!.completeButtonText,
              ),
          ],
        ),
        Expanded(
          child: StepperBody(
            notifier: _notifier,
            stepperBodyWidget: widget.stepperBodyWidget,
          ),
        )
      ],
    );
  }

  Widget buildHorizontalStepper(){
    if(widget._floatingButton != null && widget._floatingButton == true) {
      return buildFloatingHorizontalStepper();
    }else {
      return buildNormalHorizontalStepper();
    }
  }

  Widget  buildVerticalStepper(){
    if(widget._floatingButton != null && widget._floatingButton == true) {
      return buildFloatingVerticalStepper();
    }else {
      return buildNormalVerticalStepper();
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController();

    ///init StepperNotifier
    _notifier = StepperNotifier(
      borderType: widget.borderType,
      lineType: widget.lineType,
      borderShape: widget.borderShape,
      dashPattern: widget.dashPattern,
      initialPage: 0,
      length: totalSteps,
      controller: _pageController,
      vsync: this,
      formKey: widget.formKey,
    );
    if (widget.stepperAController != null) widget.stepperAController?.setNotifier = _notifier;

    return AnimatedBuilder(
        animation: _notifier,
        builder: (BuildContext context, child) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: (widget.customSteps !=null && widget.stepperBodyWidget.length != widget.customSteps?.length)
                  ?throw("customSteps and stepperBodyWidget length must be provide equals")
                  :buildStepper()
          );
        }
    );
  }

  ///Has been separated into horizontal and vertical stepper.
  Widget  buildStepper(){
    return widget.stepperAxis == Axis.horizontal
        ?buildHorizontalStepper()
        :buildVerticalStepper();
  }

  Widget buildStep(){
    return StepperStep(
      backgroundColor: widget.stepperBackgroundColor,
      padding: widget.padding,
      notifier: _notifier,
      axis: widget.stepperAxis,
      stepHeight: widget.stepHeight,
      stepperSize: stepperSizeCalculate(),
      radius: widget.radius,
      lineThickness: widget.lineThickness,
      stepWidth: widget.stepWidth,
      margin: widget.margin,
      step: widget.step,
      border: widget.stepBorder,
      customSteps: widget.customSteps,
    );
  }

  ///Stepper width and height calculation
  Size stepperSizeCalculate() {
    double height = widget.stepHeight + 10;
    double width = widget.stepWidth + 10;
    if (widget.stepperAxis == Axis.horizontal) {
      height = widget.stepperSize.height > height
          ? widget.stepperSize.height
          : height;
      width = widget.stepperSize.width > 300 ? widget.stepperSize.width : 300;
    } else {
      height =
      widget.stepperSize.height > 300 ? widget.stepperSize.height : 300;
      width =
      widget.stepperSize.width > width ? widget.stepperSize.width : width;
    }
    return Size(width, height);
  }
}
