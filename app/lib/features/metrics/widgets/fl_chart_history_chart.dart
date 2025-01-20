import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlChartHistoryChart extends StatefulWidget {
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;

  const FlChartHistoryChart({
    super.key,
    required this.minimum,
    required this.maximum,
    required this.idealMinimum,
    required this.idealMaximum,
  });

  @override
  State<FlChartHistoryChart> createState() => _FlChartHistoryChartState();
}

class _FlChartHistoryChartState extends State<FlChartHistoryChart> {
  late MetricsProvider _metricsProvider;
  final _dateFormat = DateFormat.yMMMEd().add_jms();

  @override
  void didChangeDependencies() {
    _metricsProvider = context.watch<MetricsProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: widget.minimum,
        maxY: widget.maximum,
        backgroundColor: Theme.of(context).canvasColor,
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            // tooltipBgColor: Colors.black87,
            tooltipRoundedRadius: 4,
            getTooltipColor: (spot) => Colors.black87,
            getTooltipItems: (List<LineBarSpot> spots) {
              return spots.map((spot) {
                final datetime =
                    DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                return LineTooltipItem(
                  '${_dateFormat.format(datetime)}\n',
                  const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: spot.y.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                );
              }).toList();
            },
          ),
        ),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5000 * 60 * 60,
              getTitlesWidget: (value, meta) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat.MMMd().add_Hm().format(date),
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: _metricsProvider.timeSeries.points
                .map((point) => FlSpot(
                    point.timestamp.millisecondsSinceEpoch.toDouble(),
                    point.value))
                .toList(),
            isCurved: false,
            color: Colors.black,
            dotData: FlDotData(
              show: false,
            ),
          ),
        ],
        rangeAnnotations: RangeAnnotations(
          horizontalRangeAnnotations: [
            HorizontalRangeAnnotation(
              y1: widget.idealMinimum,
              y2: widget.idealMaximum,
              color: Colors.green.shade400.withOpacity(0.25),
            ),
          ],
        ),
        // extraLinesData: ExtraLinesData(
        //   horizontalLines: [
        //     Horizonta1ne(
        //       y: (widget.idealMinimum + widget.idealMaximum) / 2,
        //       color: Colors.green.shade400.withOpacity(0.25),
        //       strokeWidth: widget.idealMaximum - widget.idealMinimum,`
        //     ),`
        //   ],
        // ),
      ),
    );
  }
}
