import 'package:flutter/material.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final String thing;
  final void Function() onConfirm;

  const ConfirmDeleteDialog({
    super.key,
    required this.thing,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete $thing"),
      content: Text(
          "Are you sure you want to delete $thing? This cannot be undone."),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text("Delete"),
        ),
      ],
    );
  }

  static Future<void> show(
      BuildContext context, String thing, void Function() onConfirm) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmDeleteDialog(
        thing: thing,
        onConfirm: onConfirm,
      ),
    );
  }
}
