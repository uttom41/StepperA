/// /*** Uttam kumar mitra ***/
/// create date 25/05/2023; 10:36 PM
///
///
///
///
import 'package:flutter/cupertino.dart';
import 'package:stepper_a/src/interface/step_page/style_mixin.dart';

abstract class IWidget with StyleMixin {
  Widget buildBorder(int index);
  Widget buildLine(int index, double size, Color color);
  Widget buildWidget(int index, Widget child);
}
