import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SparkChart extends StatelessWidget {
  final String title;
  final MaterialColor color;

  const SparkChart({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SfSparkLineChart(
                axisLineColor: Colors.transparent,
                width: 2.0,
                labelStyle: TextStyle(
                  color: color.shade900,
                  fontWeight: FontWeight.bold,
                ),
                color: color,
                data: List.generate(20, (index) => Random().nextInt(100)),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: color.shade900,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "20",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: color.shade900,
                    fontSize: 15,
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
