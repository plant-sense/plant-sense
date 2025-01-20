import 'package:app/features/metrics/screens/history.dart';
import 'package:flutter/material.dart';

class TimeRangeSegmentedButton extends StatefulWidget {
  final Function(HistoryChartTimeRange) onSelectionChanged;
  final HistoryChartTimeRange initialTimeRange;
  const TimeRangeSegmentedButton(
      {super.key,
      required this.onSelectionChanged,
      required this.initialTimeRange});

  @override
  State<TimeRangeSegmentedButton> createState() =>
      _TimeRangeSegmentedButtonState();
}

class _TimeRangeSegmentedButtonState extends State<TimeRangeSegmentedButton> {
  late HistoryChartTimeRange timeRange;

  @override
  void initState() {
    super.initState();
    timeRange = widget.initialTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<HistoryChartTimeRange>(
      segments: HistoryChartTimeRange.values
          .map(
            (t) => ButtonSegment(
              value: t,
              label: Text(
                t.label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
          .toList(),
      selected: {
        timeRange,
      },
      onSelectionChanged: (newTimeRange) {
        setState(() {
          timeRange = newTimeRange.first;
        });
        widget.onSelectionChanged(timeRange);
      },
      showSelectedIcon: false,
    );
  }
}
