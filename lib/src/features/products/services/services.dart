import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';

class AllProductServices {
  static Future<List<Product>> fetchAllProducts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Product(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: (data['price'] as num).toDouble(),
          minPrice: data['minPrice'] != null
              ? (data['minPrice'] as num).toDouble()
              : null,
          maxPrice: data['maxPrice'] != null
              ? (data['maxPrice'] as num).toDouble()
              : null,
          category: data['category'],
          isBidding: data['isBidding'] ?? false,
          biddingStartTime: data['biddingStartTime'] != null
              ? DateTime.parse(data['biddingStartTime'])
              : null,
          biddingEndTime: data['biddingEndTime'] != null
              ? DateTime.parse(data['biddingEndTime'])
              : null,
          isScheduled: data['isScheduled'] ?? false,
          scheduleTime: data['scheduleTime'] != null
              ? DateTime.parse(data['scheduleTime'])
              : null,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  static Future<void> deleteProduct(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();
    } catch (e) {
      throw Exception('Error deleting product: $e');
    }
  }

  static Future<List<Product>> fetchBiddingProducts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('bidding_products').get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Product(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: (data['price'] as num).toDouble(),
          minPrice: data['minPrice'] != null
              ? (data['minPrice'] as num).toDouble()
              : null,
          maxPrice: data['maxPrice'] != null
              ? (data['maxPrice'] as num).toDouble()
              : null,
          category: data['category'],
          isBidding: data['isBidding'] ?? true,
          biddingStartTime: data['biddingStartTime'] != null
              ? DateTime.parse(data['biddingStartTime'])
              : null,
          biddingEndTime: data['biddingEndTime'] != null
              ? DateTime.parse(data['biddingEndTime'])
              : null,
          isScheduled: data['isScheduled'] ?? false,
          scheduleTime: data['scheduleTime'] != null
              ? DateTime.parse(data['scheduleTime'])
              : null,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load bidding products: $e');
    }
  }
}
