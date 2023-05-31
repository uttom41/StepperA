/// /*** Uttam kumar mitra ***/
/// create date 04/03/2023; 10:41 PM
///
///

import 'package:flutter/material.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

import '../../stepper_a.dart';

class StepperNotifier extends ChangeNotifier {

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  PageController controller;

  /// An object that can be used to control the position to which this Stepper
  /// view is scrolled.
  final ScrollController _stepController = ScrollController();

  ///Active page index
  ///default index is 0
  int _currentIndex = 0;

  bool loadingPage = true;

  ///Step animation direction
  AnimationDirection _direction = AnimationDirection.clockwise;

  ///next Page index
  ///default set next page index is 0
  int nextPageIndex = 0;

  ///Total page length
  ///default page index set is 1
  int _totalIndex = 0;

  List<GlobalKey<FormState>> globalKeyList =[];

  ///Ticker Provider from [StepperA], cause need to use it in [AnimationSlide]
  late TickerProviderStateMixin singleTickerProviderStateMixin;

  late AnimationController stepperController;
  late Animation<double> animation;

  StepperNotifier({
    required this.controller,
    required int initialPage,
    required TickerProviderStateMixin vsync,
  }) {
    _currentIndex = initialPage;
    nextPageIndex = initialPage;
    singleTickerProviderStateMixin = vsync;
    stepperController = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(stepperController);
  }

  bool checkFormKeyValidation(int index) {
    if (_currentIndex > index) return true;

    if (!StepperModel().formValidation) return true;

     globalKeyList[_currentIndex].currentState?.save();

    if (globalKeyList[_currentIndex].currentState != null && globalKeyList[_currentIndex].currentState!.validate()) {
      return true;
    }

    return false;
  }

  Animation<double> getAnimation() {
    stepperController.reset();
    stepperController.forward();
    return animation;
  }

  ///Getter for [_currentIndex]
  int get currentIndex => _currentIndex;

  ///Getter for [_direction]
  AnimationDirection get direction => _direction;

  ///Setter for [_currentIndex]
  set currentIndex(int index) {
    if (_currentIndex > index) {
      _direction = AnimationDirection.anticlockwise;
    } else {
      _direction = AnimationDirection.clockwise;
    }
    loadingPage = true;
    if(checkFormKeyValidation(index)){
      _currentIndex = index;
      controller.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: durationTime),
          curve: Curves.easeOut);
      notifyListeners();
    }else {
      controller.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: durationTime),
          curve: Curves.easeOut);
      notifyListeners();
    }
  }

  ScrollController getStepScrollController(
      {required double itemWidth,
        required double lineWidth,
        required double screenWidth}) {
    loadingPage = true;
     double scrollAmount =
        ((_currentIndex + 1) * (lineWidth + lineWidth  +16+ itemWidth)) - screenWidth;
    if (scrollAmount < 0) scrollAmount=0.0;

    if(_currentIndex > 0){
      _stepController.animateTo(scrollAmount,
          duration: const Duration(milliseconds: durationTime),
          curve: Curves.easeIn);}

    return _stepController;
  }

  void keyList(){
    for(int i =1;i <= getTotalSteps; i++){
      globalKeyList.add(GlobalKey<FormState>());
    }
  }

  int get getTotalSteps {
    if(StepperModel().totalSteps == _totalIndex) {
      return _totalIndex;
    } else {
      _totalIndex =StepperModel().totalSteps;
      if(globalKeyList.isEmpty) {
        keyList();
      }else{
        keyList();
       // notifyListeners();
      }
      return _totalIndex;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    stepperController.dispose();
    super.dispose();
  }
}
