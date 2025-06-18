import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';

class ProductPro with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _biddingProducts = [];
  List<Product> _scheduledProducts = [];
  Map<String, List<String>> _categories = {
    'Electronics': ['Phones', 'Laptops', 'Accessories'],
    'Fashion': ['Men', 'Women', 'Kids'],
    'Home & Garden': ['Furniture', 'Decor'],
  };
  bool _settingEnabled = false;

  List<Product> get products => _products;
  List<Product> get biddingProducts => _biddingProducts;
  List<Product> get scheduledProducts => _scheduledProducts;
  Map<String, List<String>> get categories => _categories;
  bool get settingEnabled => _settingEnabled;

  ProductPro() {
    _fetchCategoriesAndProducts(); // Fetch categories and products on initialization
  }

  void toggleSetting(bool value) {
    _settingEnabled = value;
    notifyListeners();
  }

  Future<void> addCategory(String category) async {
    if (category.isNotEmpty && !_categories.containsKey(category)) {
      _categories[category] = [];
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(category)
          .set({'name': category, 'subCategories': []});
      notifyListeners();
    }
  }

  Future<void> addSubCategory(String category, String subCategory) async {
    if (category.isNotEmpty &&
        subCategory.isNotEmpty &&
        _categories.containsKey(category) &&
        !_categories[category]!.contains(subCategory)) {
      _categories[category]!.add(subCategory);
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(category)
          .update({
        'subCategories': FieldValue.arrayUnion([subCategory])
      });
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
    required String subCategory,
    bool isBidding = false,
    DateTime? biddingStartTime,
    DateTime? biddingEndTime,
    bool isScheduled = false,
    DateTime? scheduleTime,
  }) async {
    // Validate category and subCategory
    if (!_categories.containsKey(category)) {
      throw Exception('Category $category does not exist');
    }
    if (!_categories[category]!.contains(subCategory)) {
      throw Exception('Subcategory $subCategory does not exist in $category');
    }

    final product = Product(
      id: const Uuid().v4(),
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      minPrice: minPrice,
      maxPrice: maxPrice,
      category: category,
      subCategory: subCategory,
      isBidding: isBidding,
      biddingStartTime: biddingStartTime,
      biddingEndTime: biddingEndTime,
      isScheduled: isScheduled,
      scheduleTime: scheduleTime,
    );

    try {
      // Add to local lists
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
    } catch (e) {
      print('Error adding product: $e');
      // Rollback local changes if Firestore write fails
      _products.remove(product);
      if (isBidding) {
        _biddingProducts.remove(product);
      }
      if (isScheduled) {
        _scheduledProducts.remove(product);
      }
      rethrow;
    }
  }

  Future<void> _fetchCategoriesAndProducts() async {
    try {
      // Fetch categories and subcategories
      final categorySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      _categories = {
        for (var doc in categorySnapshot.docs)
          doc.data()['name'] as String:
              List<String>.from(doc.data()['subCategories'] ?? [])
      };

      // Fetch all products
      final productSnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      _products = productSnapshot.docs
          .map((doc) {
            try {
              return Product.fromMap(doc.data());
            } catch (e) {
              print('Error parsing product ${doc.id}: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<Product>()
          .toList();

      // Fetch bidding products
      final biddingSnapshot =
          await FirebaseFirestore.instance.collection('bidding_products').get();
      _biddingProducts = biddingSnapshot.docs
          .map((doc) {
            try {
              return Product.fromMap(doc.data());
            } catch (e) {
              print('Error parsing bidding product ${doc.id}: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<Product>()
          .toList();
      final scheduledSnapshot = await FirebaseFirestore.instance
          .collection('scheduled_products')
          .get();
      _scheduledProducts = scheduledSnapshot.docs
          .map((doc) {
            try {
              return Product.fromMap(doc.data());
            } catch (e) {
              print('Error parsing scheduled product ${doc.id}: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<Product>()
          .toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
