import 'package:app/apis.dart';
import 'package:app/features/garden/providers/garden_images_provider.dart';
import 'package:app/gen/plants-db-openapi/lib/api.dart' as plantsDb;
import 'package:app/gen/user-data-openapi/lib/api.dart' as userData;

class ApiGardenImagesProvider extends GardenImagesProvider {
  final UserDataApi userDataApi;
  final PlantsDBApi plantsDbApi;

  ApiGardenImagesProvider(
      {required this.userDataApi, required this.plantsDbApi});

  @override
  Future<List<String>> getImagesForGarden(String gardenId) async {
    final List<userData.Plant>? plants =
        await userDataApi.gardensIdPlantsGet(gardenId);
    if (plants == null || plants.isEmpty) {
      return [];
    }
    List<Future<plantsDb.Factsheet?>> futures = [];
    for (var plant in plants) {
      futures.add(plantsDbApi.plantsIdGet(plant.factsheetId));
    }
    final results = await Future.wait(futures);
    return results
        .map((f) => f?.assets.defaultImageUrl)
        .whereType<String>()
        .where((e) => e.isNotEmpty)
        .toList();
  }
}
