import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantSpeciesSearch extends StatelessWidget {
  final Function(String factsheetId) onSelectCallback;

  static void _defaultCallback(String factsheetId) {}

  const PlantSpeciesSearch(
      {super.key, this.onSelectCallback = _defaultCallback});

  @override
  Widget build(BuildContext context) {
    final factsheetProvider = context.watch<PlantFactSheetProvider>();
    return SearchAnchor(
      builder: (context, controller) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Plant species',
            suffixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
        );
      },
      viewConstraints: BoxConstraints(
        minHeight: 0,
        maxHeight: 200,
      ),
      viewElevation: 0,
      isFullScreen: false,
      viewShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      viewHintText: "Type at least 3 letters to search",
      viewBuilder: (suggestions) {
        if (suggestions.isEmpty) {
          return SizedBox(width: 10, height: 10);
        }
        return Container(
          color: Colors.white,
          child: ListView.builder(
            // shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return suggestions.elementAt(index);
            },
          ),
        );
      },
      suggestionsBuilder:
          (BuildContext context, SearchController controller) async {
        if (controller.text.length < 3) {
          return [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            )
          ];
        }
        var plants = await factsheetProvider.searchByName(controller.text);
        var list = List<ListTile>.generate(plants.length, (int index) {
          final item = plants[index];
          return ListTile(
            title: Text(item.taxonomy.scientificName),
            onTap: () {
              onSelectCallback(item.id);
              controller.closeView(item.taxonomy.scientificName);
            },
          );
        });
        return list;
      },
    );
  }
}
