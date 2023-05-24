import 'package:flutter/cupertino.dart';

import '../../provider/stepper_provider.dart';

abstract class IMainPage {

  Widget buildFloatingHorizontalStepper();
  Widget buildFloatingVerticalStepper();
  Widget buildNormalHorizontalStepper();
  Widget buildNormalVerticalStepper();

}