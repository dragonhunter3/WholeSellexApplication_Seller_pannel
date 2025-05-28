import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier {
  String _selectedDate = 'All Dates';

  String get selectedDate => _selectedDate;

  void setSelectedDate(String newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  List<String> get dateList => [
        'All Dates',
        '2025-04-01',
        '2025-04-02',
        '2025-04-03',
        '2025-04-04',
      ];
}

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = 'All Categories';
  List<String> _categoryList = ['All Categories'];
  bool _isLoading = false;

  String get selectedCategory => _selectedCategory;
  List<String> get categoryList => _categoryList;
  bool get isLoading => _isLoading;

  Future<void> fetchCategoryNames() async {
    try {
      _isLoading = true;
      notifyListeners();

      print('Fetching categories...');
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('categories').get();

      _categoryList = [
        'All Categories',
        ...snapshot.docs.map((doc) => doc['name'] as String).toList(),
      ];

      print('Fetched categories: $_categoryList');

      // Reset selected if the current selection is gone
      if (!_categoryList.contains(_selectedCategory)) {
        _selectedCategory = 'All Categories';
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Error fetching category names: $e');
    }
  }

  void setSelectedCategory(String category) {
    if (_categoryList.contains(category)) {
      _selectedCategory = category;
      notifyListeners();
    }
  }
}
