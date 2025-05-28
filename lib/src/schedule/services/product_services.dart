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
          id: data['id'] as String? ?? 'default_id',
          title: data['title'] as String? ?? 'Untitled',
          description: data['description'] as String? ?? 'No description',
          imageUrl:
              data['imageUrl'] != null ? data['imageUrl'] as String : null,
          price:
              (data['price'] is num) ? (data['price'] as num).toDouble() : 0.0,
          minPrice: data['minPrice'] != null
              ? (data['minPrice'] is num)
                  ? (data['minPrice'] as num).toDouble()
                  : data['minPrice'] as double
              : null,
          maxPrice: data['maxPrice'] != null
              ? (data['maxPrice'] is num)
                  ? (data['maxPrice'] as num).toDouble()
                  : data['maxPrice'] as double
              : null,
          category: data['category'] as String? ?? 'Uncategorized',
          subCategory: data['subCategory'] as String? ?? 'Uncategorized',
          isBidding: data['isBidding'] as bool? ?? false,
          biddingStartTime: data['biddingStartTime'] != null
              ? DateTime.parse(data['biddingStartTime'] as String)
              : null,
          biddingEndTime: data['biddingEndTime'] != null
              ? DateTime.parse(data['biddingEndTime'] as String)
              : null,
          isScheduled: data['isScheduled'] as bool? ?? false,
          scheduleTime: data['scheduleTime'] != null
              ? DateTime.parse(data['scheduleTime'] as String)
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
      await FirebaseFirestore.instance
          .collection('bidding_products')
          .doc(productId)
          .delete();
      await FirebaseFirestore.instance
          .collection('scheduled_products')
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
          id: data['id'] as String? ?? 'default_id',
          title: data['title'] as String? ?? 'Untitled',
          description: data['description'] as String? ?? 'No description',
          imageUrl:
              data['imageUrl'] != null ? data['imageUrl'] as String : null,
          price:
              (data['price'] is num) ? (data['price'] as num).toDouble() : 0.0,
          minPrice: data['minPrice'] != null
              ? (data['minPrice'] is num)
                  ? (data['minPrice'] as num).toDouble()
                  : data['minPrice'] as double
              : null,
          maxPrice: data['maxPrice'] != null
              ? (data['maxPrice'] is num)
                  ? (data['maxPrice'] as num).toDouble()
                  : data['maxPrice'] as double
              : null,
          category: data['category'] as String? ?? 'Uncategorized',
          subCategory: data['subCategory'] as String? ?? 'Uncategorized',
          isBidding: data['isBidding'] as bool? ?? true,
          biddingStartTime: data['biddingStartTime'] != null
              ? DateTime.parse(data['biddingStartTime'] as String)
              : null,
          biddingEndTime: data['biddingEndTime'] != null
              ? DateTime.parse(data['biddingEndTime'] as String)
              : null,
          isScheduled: data['isScheduled'] as bool? ?? false,
          scheduleTime: data['scheduleTime'] != null
              ? DateTime.parse(data['scheduleTime'] as String)
              : null,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load bidding products: $e');
    }
  }

  static Future<List<Product>> fetchScheduledProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('scheduled_products')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Product(
          id: data['id'] as String? ?? 'default_id',
          title: data['title'] as String? ?? 'Untitled',
          description: data['description'] as String? ?? 'No description',
          imageUrl:
              data['imageUrl'] != null ? data['imageUrl'] as String : null,
          price:
              (data['price'] is num) ? (data['price'] as num).toDouble() : 0.0,
          minPrice: data['minPrice'] != null
              ? (data['minPrice'] is num)
                  ? (data['minPrice'] as num).toDouble()
                  : data['minPrice'] as double
              : null,
          maxPrice: data['maxPrice'] != null
              ? (data['maxPrice'] is num)
                  ? (data['maxPrice'] as num).toDouble()
                  : data['maxPrice'] as double
              : null,
          category: data['category'] as String? ?? 'Uncategorized',
          subCategory: data['subCategory'] as String? ?? 'Uncategorized',
          isBidding: data['isBidding'] as bool? ?? false,
          biddingStartTime: data['biddingStartTime'] != null
              ? DateTime.parse(data['biddingStartTime'] as String)
              : null,
          biddingEndTime: data['biddingEndTime'] != null
              ? DateTime.parse(data['biddingEndTime'] as String)
              : null,
          isScheduled: data['isScheduled'] as bool? ?? true,
          scheduleTime: data['scheduleTime'] != null
              ? DateTime.parse(data['scheduleTime'] as String)
              : null,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load scheduled products: $e');
    }
  }
}
