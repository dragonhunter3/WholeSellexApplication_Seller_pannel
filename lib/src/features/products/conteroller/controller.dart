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
  final List<String> _categoryList = [
    'All Categories',
    'Electronics',
    'Fashion',
    'Books',
    'Home & Kitchen',
    'Toys',
    'Sports',
  ];

  String get selectedCategory => _selectedCategory;
  List<String> get categoryList => _categoryList;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
