

import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/schedule/model/schedulemodel.dart';

class ScheduleProvider extends ChangeNotifier {
  final List<Productschedule> _allProducts = [];
  final int _pageSize = 10;
  int _currentPage = 1;

  List<Productschedule> get visibleProducts =>
      _allProducts.take(_currentPage * _pageSize).toList();

  void toggleSelection(int index, bool value) {
    final actualProduct = visibleProducts[index];
    final actualIndex = _allProducts.indexOf(actualProduct);

    if (actualIndex != -1) {
      _allProducts[actualIndex].isSelected = value;
      notifyListeners();
    }
  }

  void deleteProduct(int index) {
    final actualProduct = visibleProducts[index];
    _allProducts.remove(actualProduct);
    notifyListeners();
  }

  void loadMore() {
    if ((_currentPage * _pageSize) < _allProducts.length) {
      _currentPage++;
      notifyListeners();
    }
  }

  void initializeProducts(List<Productschedule> products) {
    _allProducts.clear();
    _allProducts.addAll(products);
    _currentPage = 1;
    notifyListeners();
  }

  bool get hasMore => (_currentPage * _pageSize) < _allProducts.length;
}
