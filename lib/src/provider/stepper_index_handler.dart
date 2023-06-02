/// /*** Uttam kumar mitra ***/
/// create date 04/04/2023; 11:41 PM
///
///
///
///
///

import 'package:stepper_a/src/utils/stepper_model.dart';

/// this class for stepper index calculation
class StepperIndex {

  /// this method  using  for stepper forward index update.
  bool next(int x, int y) {
    if (x < y) {
     StepperModel().notifier.currentIndex = (x + 1);
      return true;
    } else {
      StepperModel().notifier.currentIndex = x;
      return false;
    }
  }

  /// this method using for stepper previous index update
  bool back(int x) {
    if (x > 0) {
       StepperModel().notifier.currentIndex = (x - 1);
      return true;
    } else {
     StepperModel().notifier.currentIndex = x;
      return false;
    }
  }
}
