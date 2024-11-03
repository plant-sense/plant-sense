import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  final String name;
  final double value;
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;

  RadialGauge({
    required this.name,
    required this.value,
    required this.minimum,
    required this.maximum,
    required this.idealMinimum,
    required this.idealMaximum,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: minimum, maximum: maximum, ranges: <GaugeRange>[
        GaugeRange(
            startValue: minimum,
            endValue: idealMinimum,
            color: Colors.red.shade300),
        GaugeRange(
            startValue: idealMinimum,
            endValue: idealMaximum,
            color: Colors.green.shade400),
        GaugeRange(
            startValue: idealMaximum,
            endValue: maximum,
            color: Colors.red.shade300)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: value),
      ], annotations: <GaugeAnnotation>[
        (GaugeAnnotation(
            widget: Text('$value',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5))
      ]),
    ], title: GaugeTitle(text: name));
  }
}
