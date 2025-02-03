import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/features/plant/widgets/plant_species_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantFormDialog extends StatelessWidget {
  final String? plantId;
  final Function(Plant) onPlantSubmitted;

  const PlantFormDialog(
      {super.key, this.plantId, required this.onPlantSubmitted});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    if (plantId == null) {
      return PlantFormDialogInitial(
        onPlantSubmitted: onPlantSubmitted,
      );
    }

    return FutureBuilder(
      future: context.watch<PlantProvider>().getPlantById(plantId!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final plant = snapshot.data as Plant;
            return PlantFormDialogInitial(
                onPlantSubmitted: onPlantSubmitted, plant: plant);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class PlantFormDialogInitial extends StatefulWidget {
  final Plant? plant;
  final Function(Plant) onPlantSubmitted;

  const PlantFormDialogInitial(
      {super.key, this.plant, required this.onPlantSubmitted});

  @override
  State<PlantFormDialogInitial> createState() => _PlantFormDialogInitialState();
}

class _PlantFormDialogInitialState extends State<PlantFormDialogInitial> {
  final nameController = TextEditingController();
  String? selectedFactSheetId;

  @override
  void initState() {
    super.initState();
    if (widget.plant != null) {
      nameController.text = widget.plant!.name;
      selectedFactSheetId = widget.plant!.factsheetId;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void onActionButtonPressed(BuildContext context) {
    if (nameController.text.isEmpty || selectedFactSheetId == null) {
      return;
    }
    widget.onPlantSubmitted(Plant(
      id: widget.plant?.id ?? "",
      gardenId: "",
      name: nameController.text,
      factsheetId: selectedFactSheetId!,
    ));
    nameController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var titleText = widget.plant == null ? 'Add Plant' : 'Edit Plant';
    var actionText = widget.plant == null ? 'Add' : 'Edit';

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(titleText),
        actions: [
          FilledButton(
            child: Text(actionText),
            onPressed: () => onActionButtonPressed(context),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16.0,
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Plant Name',
            border: OutlineInputBorder(),
          ),
        ),
        PlantSpeciesSearch(
          onSelectCallback: (factsheetId) {
            debugPrint("f $factsheetId");
            setState(() => selectedFactSheetId = factsheetId);
          },
        ),
      ],
    );
  }
}
