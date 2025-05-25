import 'package:flutter/foundation.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/services/services.dart';

class ShowAllProductsController with ChangeNotifier {
  List<Product> _products = [];
  List<bool> _selections = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get visibleProducts => _products;
  List<bool> get selections => _selections;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    notifyListeners();

    try {
      final fetched = await AllProductServices.fetchAllProducts();
      _products = fetched;
      _selections = List.generate(_products.length, (_) => false);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int index) async {
    try {
      final product = _products[index];
      await AllProductServices.deleteProduct(product.id);
      _products.removeAt(index);
      _selections.removeAt(index);
      notifyListeners();
    } catch (e) {
      _error = 'Failed to delete product: $e';
      notifyListeners();
    }
  }
}
