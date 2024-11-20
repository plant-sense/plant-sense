import 'package:flutter/material.dart';
import '../models/garden.dart';

class MockGardenProvider extends ChangeNotifier {
  final List<Garden> _gardens;

  MockGardenProvider() : _gardens = _initializeGardens();

  List<Garden> get gardens => List.unmodifiable(_gardens);

  static const _staticIds = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  static List<Garden> _initializeGardens() {
    const imageUrl =
        'https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return List.generate(
      10,
      (index) => Garden(
        id: _staticIds[index],
        name: 'Garden $index',
        imageUrl: imageUrl,
      ),
    );
  }

  Garden? getGardenById(String id) => _gardens.firstWhere(
        (garden) => garden.id == id,
      );

  void addGarden(String name) {
    const imageUrl =
        'https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    final newGarden = Garden(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      imageUrl: imageUrl,
    );

    _gardens.add(newGarden);
    notifyListeners();
  }
}
