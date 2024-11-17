import 'package:flutter/material.dart';

class StatusPlaceholderWidget extends StatefulWidget {
  @override
  State<StatusPlaceholderWidget> createState() =>
      _StatusPlaceholderWidgetState();
}

class _StatusPlaceholderWidgetState extends State<StatusPlaceholderWidget> {
  bool alerts = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
