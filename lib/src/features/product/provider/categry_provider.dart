import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String selectedCategory = 'Purchase now';
  List<String> compatibilities = [
    'Sketch', 'Figma', 'WordPress', 'Procreate', 
    'Adobe XD', 'HTML', 'Illustrator', 'Photoshop',
    'Keynote', 'Framer', 'Cinema 4D', 'Maya', 
    'In Design', 'Blender', 'After Effect'
  ];

  List<String> selectedCompatibilities = [];

  void changeCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void toggleCompatibility(String item) {
    if (selectedCompatibilities.contains(item)) {
      selectedCompatibilities.remove(item);
    } else {
      selectedCompatibilities.add(item);
    }
    notifyListeners();
  }
}
