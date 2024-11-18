import 'package:app/components/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../models/time_series.dart';

class SparkChart extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final TimeSeries<num> timeSeries;
  final int maxPoints;

  const SparkChart({
    required this.title,
    required this.color,
    required this.timeSeries,
    this.maxPoints = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final windowedPoints =
        timeSeries.getWindowedPoints(const Duration(hours: 1));
    final downsampledPoints = TimeSeries<num>()
      ..addPoints(windowedPoints)
      ..downsample(maxPoints);

    return Card.outlined(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color[800]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SfSparkLineChart(
                axisLineColor: Colors.transparent,
                width: 1.5,
                labelStyle: TextStyle(
                  color: color.shade900,
                  fontWeight: FontWeight.bold,
                ),
                color: color,
                data: downsampledPoints.points
                    .map((point) => point.value.toDouble())
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // fontFamily: GoogleFonts.inter().fontFamily!,
                  ),
                ),
                Text(
                  timeSeries.latest?.value.toStringAsFixed(1) ?? 'N/A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: GoogleFonts.firaMono().fontFamily!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
