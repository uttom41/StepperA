/// /*** Uttam kumar mitra ***/
/// create date 12/04/2023; 06:41 PM
///
///
import 'package:stepper_a/src/provider/stepper_index_handler.dart';
import 'package:stepper_a/src/provider/stepper_provider.dart';

///[StepperAController] class helps user to
/// switch previous and forward page on button press.
///
class StepperAController {
  late StepperNotifier _notifier;
  set setNotifier(StepperNotifier notifier) {
    _notifier = notifier;
  }

  void next() {
    StepperIndex(notifier: _notifier)
        .next(_notifier.currentIndex, _notifier.getTotalSteps);
  }

  void back() {
    StepperIndex(notifier: _notifier).back(_notifier.currentIndex);
  }
}
