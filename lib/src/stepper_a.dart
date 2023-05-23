import 'package:flutter/material.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';
import '../stepper_a.dart';
import 'interface/main_page/i_main_page.dart';
import 'interface/main_page/main_style.dart';

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

  /// If you need a floating button than use this.
  final FloatingButton? floatingForwardButton;

  /// If you need a floating button than use this.
  final FloatingButton? floatingPreviousButton;

  /// If you need a custom button than use this.
  final StepperAButton? previousButton;

  /// If you need a custom button than use this.
  final StepperAButton? forwardButton;

  /// If you need a own button than use this.
  /// and control your button click
  final StepperAController? stepperAController;

  ///
  final List<CustomSteps>? customSteps;

  final bool _floatingButton;
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
      : _floatingButton = floatingButton??false,
        super(key: key);

   @override
   State<StepperA> createState() => _StepperAStateModel();
}


abstract class _StepperAState <TWidget extends StepperA> extends State<TWidget> implements IMainPage{}

class _StepperAStateModel  extends _StepperAState with TickerProviderStateMixin,MainStyle{
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

    StepperModel.init(
        lineThickness: widget.lineThickness,
        stepperSize:  widget.stepperSize,
        stepperBodyWidget:  widget.stepperBodyWidget,
        stepperBackgroundColor:  widget.stepperBackgroundColor,
        padding:  widget.padding,
        margin:  widget.margin,
        stepPadding:  widget.stepPadding,
        radius:  widget.radius,
        borderType:  widget.borderType,
        lineType:  widget.lineType,
        borderShape:  widget.borderShape,
        dashPattern:  widget.dashPattern,
        stepHeight:  widget.stepHeight,
        stepWidth:  widget.stepWidth,
        stepperAxis:  widget.stepperAxis,
        formKey: widget.formKey,
        floatingForwardButton: widget.floatingForwardButton,
        floatingPreviousButton: widget.floatingPreviousButton,
        forwardButton: widget.forwardButton,
        previousButton: widget.previousButton,
        stepperAController: widget.stepperAController,
        floatingButton:  widget._floatingButton,
        stepBorder:  widget.stepBorder,
        customSteps: widget.customSteps,
        step:  widget.step,
        totalSteps: totalSteps
    );
    super.initState();
  }

  Widget buildHorizontalStepper() {
    if (widget._floatingButton == true) {
      return buildFloatingHorizontalStepper(_notifier);
    } else {
      return buildNormalHorizontalStepper(_notifier);
    }
  }

  Widget buildVerticalStepper() {
    if (widget._floatingButton == true) {
      return buildFloatingVerticalStepper(_notifier);
    } else {
      return buildNormalVerticalStepper(_notifier);
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
    if (widget.stepperAController != null) {
      widget.stepperAController?.setNotifier = _notifier;
    }

    return AnimatedBuilder(
        animation: _notifier,
        builder: (BuildContext context, child) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: (widget.customSteps != null &&
                      widget.stepperBodyWidget.length !=
                          widget.customSteps?.length)
                  ? throw ("customSteps and stepperBodyWidget length must be provide equals")
                  : buildStepper());
        });
  }

  ///Has been separated into horizontal and vertical stepper.
  Widget buildStepper() {
    return widget.stepperAxis == Axis.horizontal
        ? buildHorizontalStepper()
        : buildVerticalStepper();
  }

}
