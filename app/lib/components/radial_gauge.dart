import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    double range = maximum - minimum;
    double idealMinStop = (idealMinimum - minimum) / range;
    double idealMaxStop = (idealMaximum - minimum) / range;

    debugPrint(Theme.of(context).textTheme.bodyMedium!.fontFamily!);

    return SfRadialGauge(
      axes: [
        RadialAxis(
          axisLineStyle: AxisLineStyle(
            thickness: 0.05,
            thicknessUnit: GaugeSizeUnit.factor,
            color: Colors.white,
            gradient: SweepGradient(
              colors: [
                Colors.red.shade400,
                Colors.red.shade400,
                Colors.greenAccent.shade400,
                Colors.greenAccent.shade400,
                Colors.red.shade400,
                Colors.red.shade400,
              ],
              stops: [
                0,
                idealMinStop,
                idealMinStop,
                idealMaxStop,
                idealMaxStop,
                1,
              ],
            ),
          ),
          majorTickStyle: MajorTickStyle(
            color: Colors.grey[850],
          ),
          minorTickStyle: MinorTickStyle(
            color: Colors.grey[850],
            length: 7,
          ),
          axisLabelStyle: GaugeTextStyle(
              color: Colors.grey[850],
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.aboreto().fontFamily!),
          minimum: minimum,
          maximum: maximum,
          showLastLabel: true,
          pointers: [
            MarkerPointer(
                value: value,
                color: Colors.black,
                markerHeight: 25,
                markerWidth: 20),
          ],
          annotations: [
            GaugeAnnotation(
              widget: Text('$value',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        ),
      ],
      title: GaugeTitle(
        text: name,
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
