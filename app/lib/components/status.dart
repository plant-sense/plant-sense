import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  bool alerts = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: alerts ? Colors.red[50] : Colors.green[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            alerts
                ? Icons.sentiment_dissatisfied_rounded
                : Icons.sentiment_satisfied_rounded,
            color: alerts ? Colors.red : Colors.green,
            size: 60,
          ),
          SizedBox(width: 8),
          Text(
            alerts
                ? 'You need to take care of your plants!'
                : 'Your plants are growing wonderfully!',
            style: TextStyle(
                color: alerts ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ],
      ),
    );
  }
}
