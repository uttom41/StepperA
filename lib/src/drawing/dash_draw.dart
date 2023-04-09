/// /*** Uttam kumar mitra ***/
/// create date 10/04/2023; 1:41 AM
///
///
///
import 'dart:ui';

import 'calculate_perfect_size.dart';


class Dash{
  Path source;
  CircularIntervalList<double> dashArray;

  Dash({required this.source,required this.dashArray});

  Path dashDraw(){


    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

}
