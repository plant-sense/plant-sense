import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenFormDialog extends StatelessWidget {
  final String? gardenId;
  final Function(Garden) onGardenSubmitted;

  GardenFormDialog({
    super.key,
    required this.onGardenSubmitted,
    this.gardenId,
  });

  final TextEditingController _nameController = TextEditingController();

  void onActionButtonPressed(BuildContext context) {
    if (_nameController.text.isEmpty) {
      return;
    }

    onGardenSubmitted(Garden(id: gardenId ?? "", name: _nameController.text));
    _nameController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var titleText = gardenId == null ? 'Add Garden' : 'Edit Garden';
    var actionText = gardenId == null ? 'Add' : 'Edit';

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          title: Text(titleText),
          actions: [
            FilledButton(
              onPressed: () => onActionButtonPressed(context),
              child: Text(actionText),
            ),
            SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BreakpointContainer(child: _build(context)),
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    if (gardenId == null) {
      return _buildForm();
    }

    var f = context.watch<GardenProvider>().getGardenById(gardenId!);
    return FutureBuilder(
        future: f,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final garden = snapshot.data as Garden;
              _nameController.text = garden.name;
              return _buildForm();
            default:
              return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Garden Name',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
