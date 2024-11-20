import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LinearGauge extends StatelessWidget {
  final String name;
  final double value;
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;

  LinearGauge({
    required this.name,
    required this.value,
    required this.minimum,
    required this.maximum,
    required this.idealMinimum,
    required this.idealMaximum,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 30),
          Text(value.toStringAsFixed(1),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
        ]),
        SizedBox(height: 10),
        SfLinearGauge(
          axisTrackExtent: 25,
          ranges: [
            LinearGaugeRange(
              startValue: minimum,
              endValue: idealMinimum,
              color: Colors.blue.shade400,
            ),
            LinearGaugeRange(
              startValue: idealMinimum,
              endValue: idealMaximum,
              color: Colors.greenAccent.shade400,
            ),
            LinearGaugeRange(
              startValue: idealMaximum,
              endValue: maximum,
              color: Colors.red.shade400,
            ),
          ],
          axisTrackStyle: LinearAxisTrackStyle(
            thickness: 1,
            color: Colors.white,
          ),
          majorTickStyle: LinearTickStyle(
            color: Colors.grey[850],
          ),
          minorTickStyle: LinearTickStyle(
            color: Colors.grey[850],
            length: 7,
          ),
          axisLabelStyle: TextStyle(
              color: Colors.grey[850],
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.aboreto().fontFamily!),
          minimum: minimum,
          maximum: maximum,
          showLabels: true,
          markerPointers: [
            LinearShapePointer(
              value: value,
              width: 10,
              color: Colors.black,
              shapeType: LinearShapePointerType.invertedTriangle,
            )
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
