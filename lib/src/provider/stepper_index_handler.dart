import 'package:stepper_a/src/provider/stepper_provider.dart';

/// this class for stepper index calculation
class StepperIndex{
  final StepperNotifier notifier;
  StepperIndex({required this.notifier});

  /// this method  using  for stepper forward index update.
  void next(int x, int y) {
    if (x < y) {
      notifier.currentIndex = (x + 1);
      return;
    }
    notifier.currentIndex = x;
    return;
  }

  /// this method using for stepper previous index update
  void back(int x) {
    if (x > 0) {
      notifier.currentIndex = (x - 1);
      return;
    }
    notifier.currentIndex = x;
    return;
  }
}