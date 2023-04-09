/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///
///
///
import 'package:flutter/material.dart';
import 'package:stepper_a/src/drawing/path_painter.dart';
import 'drawing_helper.dart';

class PathWidget extends StatefulWidget {
  const PathWidget({Key? key}) : super(key: key);

  @override
  State<PathWidget> createState() => _PathWidgetState();
}

class _PathWidgetState extends State<PathWidget> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
    _startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void _startAnimation() {
    controller.reset();
    controller.animateTo(1.0, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 200.0,
      width: 200.0,
      child:
      CustomPaint(
          foregroundPainter: PathPainters(
            lineColor: Colors.amber,
            completeColor: Colors.blueAccent,
            animation: controller,
            strokeWidth: 4,
            circleBorder: BorderType.dash,
            startingPercentage: 50,
            radius: const Radius.circular(12),
            pathType: PathType.rRect,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 50,
              alignment: Alignment.center,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
              child: const Text(""
                  "dash"),
            ),
          )
      ),
    );
  }
}
