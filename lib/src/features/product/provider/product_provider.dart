import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';

class ProductPro with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _biddingProducts = [];
  List<Product> _scheduledProducts = [];
  List<String> _categories = ['Electronics', 'Fashion', 'Home & Garden'];
  bool _settingEnabled = false;

  List<Product> get products => _products;
  List<Product> get biddingProducts => _biddingProducts;
  List<Product> get scheduledProducts => _scheduledProducts;
  List<String> get categories => _categories;
  bool get settingEnabled => _settingEnabled;

  void toggleSetting(bool value) {
    _settingEnabled = value;
    notifyListeners();
  }

  void addCategory(String category) {
    if (category.isNotEmpty && !_categories.contains(category)) {
      _categories.add(category);
      FirebaseFirestore.instance
          .collection('categories')
          .doc(category)
          .set({'name': category});
      notifyListeners();
    }
  }

  Future<void> addProduct({
    required String title,
    required String description,
    required String? imageUrl,
    required double price,
    double? minPrice,
    double? maxPrice,
    required String category,
    bool isBidding = false,
    DateTime? biddingStartTime,
    DateTime? biddingEndTime,
    bool isScheduled = false,
    DateTime? scheduleTime,
  }) async {
    final product = Product(
      id: const Uuid().v4(),
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      minPrice: minPrice,
      maxPrice: maxPrice,
      category: category,
      isBidding: isBidding,
      biddingStartTime: biddingStartTime,
      biddingEndTime: biddingEndTime,
      isScheduled: isScheduled,
      scheduleTime: scheduleTime,
    );

    _products.add(product);
    if (isBidding) {
      _biddingProducts.add(product);
    }
    if (isScheduled) {
      _scheduledProducts.add(product);
    }

    // Save to Firestore
    await FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .set(product.toMap());
    if (isBidding) {
      await FirebaseFirestore.instance
          .collection('bidding_products')
          .doc(product.id)
          .set(product.toMap());
    }
    if (isScheduled) {
      await FirebaseFirestore.instance
          .collection('scheduled_products')
          .doc(product.id)
          .set(product.toMap());
    }

    notifyListeners();
  }
}
