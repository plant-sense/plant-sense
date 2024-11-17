import 'package:app/components/spark_chart.dart';
import 'package:flutter/material.dart';

class SparkChartsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SparkChart(
                    title: "Temperature",
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: SparkChart(
                    title: "Soil moisture",
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:
                      SparkChart(title: "Light intensity", color: Colors.blue),
                ),
                Expanded(child: Container(color: Colors.yellow)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
