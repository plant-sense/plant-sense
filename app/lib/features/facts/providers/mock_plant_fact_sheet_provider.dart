// import '../models/plant_fact_sheet.dart';
// import '../providers/plant_fact_sheet_provider.dart';

// class MockPlantFactSheetProvider extends PlantFactSheetProvider {
//   static final MockPlantFactSheetProvider _instance =
//       MockPlantFactSheetProvider._internal();
//   factory MockPlantFactSheetProvider() => _instance;
//   MockPlantFactSheetProvider._internal();

//   final List<PlantFactSheet> _factSheets = [
//     PlantFactSheet(
//       uuid: "0",
//       scientificName: 'Spathiphyllum wallisii',
//       commonName: 'Peace Lily',
//       imageUrl:
//           'https://images.unsplash.com/photo-1676628443324-6782e01aa4a8?q=80&w=2129&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds',
//       idealConditions: GrowingConditions(
//         minTemperature: 18,
//         maxTemperature: 30,
//         minSoilHumidity: 40,
//         maxSoilHumidity: 65,
//         minLightIntensity: 1000,
//         maxLightIntensity: 2500,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "1",
//       scientificName: 'Monstera deliciosa',
//       commonName: 'Swiss Cheese Plant',
//       imageUrl:
//           'https://images.unsplash.com/photo-1610491064924-bd5fa1c96640?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 20,
//         maxTemperature: 30,
//         minSoilHumidity: 50,
//         maxSoilHumidity: 70,
//         minLightIntensity: 1500,
//         maxLightIntensity: 3000,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "2",
//       scientificName: 'Ficus elastica',
//       commonName: 'Rubber Plant',
//       imageUrl:
//           'https://images.unsplash.com/photo-1597055181300-e3633a917c9c?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 16,
//         maxTemperature: 25,
//         minSoilHumidity: 40,
//         maxSoilHumidity: 60,
//         minLightIntensity: 2000,
//         maxLightIntensity: 3500,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "3",
//       scientificName: 'Zamioculcas zamiifolia',
//       commonName: 'ZZ Plant',
//       imageUrl:
//           'https://images.unsplash.com/photo-1714379773066-7ac70b36ed50?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 15,
//         maxTemperature: 28,
//         minSoilHumidity: 30,
//         maxSoilHumidity: 50,
//         minLightIntensity: 500,
//         maxLightIntensity: 2000,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "4",
//       scientificName: 'Phalaenopsis orchid',
//       commonName: 'Moth Orchid',
//       imageUrl:
//           'https://images.unsplash.com/photo-1692386960786-4c13a1061703?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8UGhhbGFlbm9wc2lzJTIwb3JjaGlkfGVufDB8fDB8fHww',
//       idealConditions: GrowingConditions(
//         minTemperature: 20,
//         maxTemperature: 29,
//         minSoilHumidity: 50,
//         maxSoilHumidity: 70,
//         minLightIntensity: 1000,
//         maxLightIntensity: 2000,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "5",
//       scientificName: 'Dracaena trifasciata',
//       commonName: 'Snake Plant',
//       imageUrl:
//           'https://images.unsplash.com/photo-1611264213923-c625a27ff966?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fERyYWNhZW5hJTIwdHJpZmFzY2lhdGF8ZW58MHx8MHx8fDA%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 15,
//         maxTemperature: 30,
//         minSoilHumidity: 30,
//         maxSoilHumidity: 50,
//         minLightIntensity: 500,
//         maxLightIntensity: 2500,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "6",
//       scientificName: 'Epipremnum aureum',
//       commonName: 'Pothos',
//       imageUrl:
//           'https://images.unsplash.com/photo-1660756723808-d85024a7e5d4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 18,
//         maxTemperature: 30,
//         minSoilHumidity: 40,
//         maxSoilHumidity: 60,
//         minLightIntensity: 1000,
//         maxLightIntensity: 2500,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "7",
//       scientificName: 'Calathea orbifolia',
//       commonName: 'Prayer Plant',
//       imageUrl:
//           'https://images.unsplash.com/photo-1667395941567-9892435d0240?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Q2FsYXRoZWElMjBvcmJpZm9saWF8ZW58MHx8MHx8fDA%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 18,
//         maxTemperature: 26,
//         minSoilHumidity: 50,
//         maxSoilHumidity: 70,
//         minLightIntensity: 1000,
//         maxLightIntensity: 2000,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "8",
//       scientificName: 'Strelitzia reginae',
//       commonName: 'Bird of Paradise',
//       imageUrl:
//           'https://images.unsplash.com/photo-1629984618634-de2a311c078f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHN0cmVsaXR6aWElMjByZWdpbmFlJTIwYWl0b258ZW58MHx8MHx8fDA%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 18,
//         maxTemperature: 30,
//         minSoilHumidity: 40,
//         maxSoilHumidity: 60,
//         minLightIntensity: 2000,
//         maxLightIntensity: 4000,
//       ),
//     ),
//     PlantFactSheet(
//       uuid: "9",
//       scientificName: 'Ficus benjamina',
//       commonName: 'Weeping Fig',
//       imageUrl:
//           'https://images.unsplash.com/photo-1616291279120-c9b3e82be58a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8RmljdXMlMjBiZW5qYW1pbmF8ZW58MHx8MHx8fDA%3D',
//       idealConditions: GrowingConditions(
//         minTemperature: 16,
//         maxTemperature: 28,
//         minSoilHumidity: 40,
//         maxSoilHumidity: 60,
//         minLightIntensity: 1500,
//         maxLightIntensity: 3000,
//       ),
//     ),
//   ];

//   List<PlantFactSheet> get factSheets => List.unmodifiable(_factSheets);

//   PlantFactSheet? getFactSheetById(String id) {
//     try {
//       return _factSheets.firstWhere((fs) => fs.uuid == id);
//     } catch (_) {
//       return null;
//     }
//   }
// }
