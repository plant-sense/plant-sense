import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(id));
  }
}
