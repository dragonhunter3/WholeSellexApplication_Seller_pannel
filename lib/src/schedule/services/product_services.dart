import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/model/product_model.dart';

class ProductService {
  static Future<List<Product>> fetchScheduledProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('scheduled_products')
          .get();

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
      throw Exception('Failed to load scheduled products: $e');
    }
  }
}
