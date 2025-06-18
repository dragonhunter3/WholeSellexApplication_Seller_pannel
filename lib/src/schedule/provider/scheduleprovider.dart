import 'package:flutter/foundation.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';
import 'package:whole_sellex_selleradmin_pannel/src/schedule/services/product_services.dart';

class ScheduleProvider with ChangeNotifier {
  List<Product> _products = [];
  List<bool> _selections = [];
  bool _isLoading = false;
  bool _hasMore = false;
  String? _error;

  List<Product> get visibleProducts => _products;
  List<bool> get selections => _selections;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;

  Future<void> fetchScheduledProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetched = await AllProductServices.fetchScheduledProducts();
      _products = fetched;
      _selections = List.generate(_products.length, (_) => false);
      _hasMore = false;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleSelection(int index, bool selected) {
    _selections[index] = selected;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    _selections.removeAt(index);
    notifyListeners();
  }

  void loadMore() {}
}
