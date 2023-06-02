/// /*** Uttam kumar mitra ***/
/// create date 12/04/2023; 06:41 PM
///
///
import 'package:stepper_a/src/provider/stepper_index_handler.dart';
import 'package:stepper_a/src/utils/stepper_model.dart';

///[StepperAController] class helps user to
/// switch previous and forward page on button press.
///
class StepperAController {

  void next({required Function(int currentIndex) onTap}) {
    if(StepperIndex().next(StepperModel().notifier.currentIndex, StepperModel().notifier.getTotalSteps)) onTap(StepperModel().notifier.currentIndex);
  }

  void back({required Function(int currentIndex) onTap}) {
    if(StepperIndex().back(StepperModel().notifier.currentIndex))onTap(StepperModel().notifier.currentIndex);
  }
}
