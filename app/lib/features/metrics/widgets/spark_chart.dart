import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../models/time_series.dart';

class SparkChart extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final DeviceType deviceType;
  final TimeSeries<num> timeSeries;
  final int maxPoints;

  const SparkChart({
    required this.title,
    required this.color,
    required this.deviceType,
    required this.timeSeries,
    this.maxPoints = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final windowedPoints =
    //     timeSeries.getWindowedPoints(const Duration(hours: 10));
    // final downsampledPoints = TimeSeries<num>()
    //   ..addPoints(windowedPoints)
    //   ..downsample(maxPoints);

    final points = timeSeries;

    return Card.outlined(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade700,
          // color: color[800]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DeviceIcon(type: deviceType, color: color),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        // fontFamily: GoogleFonts.inter().fontFamily!,
                      ),
                    ),
                  ],
                ),
                Text(
                  timeSeries.latest?.value.toStringAsFixed(1) ?? 'N/A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SfSparkLineChart(
                axisLineColor: Colors.transparent,
                width: 1.5,
                labelStyle: TextStyle(
                  color: color.shade900,
                  fontWeight: FontWeight.bold,
                ),
                color: color,
                data: points.points
                    .map((point) => point.value.toDouble())
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
