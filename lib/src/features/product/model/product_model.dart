class Product {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final double price;
  final double? minPrice;
  final double? maxPrice;
  final String category;
  final bool isBidding;
  final DateTime? biddingStartTime;
  final DateTime? biddingEndTime;
  final bool isScheduled;
  final DateTime? scheduleTime;

  Product({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.price,
    this.minPrice,
    this.maxPrice,
    required this.category,
    this.isBidding = false,
    this.biddingStartTime,
    this.biddingEndTime,
    this.isScheduled = false,
    this.scheduleTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'category': category,
      'isBidding': isBidding,
      'biddingStartTime': biddingStartTime?.toIso8601String(),
      'biddingEndTime': biddingEndTime?.toIso8601String(),
      'isScheduled': isScheduled,
      'scheduleTime': scheduleTime?.toIso8601String(),
    };
  }

  factory Product.fromFirestore(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'],
      price: (data['price'] ?? 0).toDouble(),
      minPrice: data['minPrice']?.toDouble(),
      maxPrice: data['maxPrice']?.toDouble(),
      category: data['category'] ?? '',
      isBidding: data['isBidding'] ?? false,
      biddingStartTime: data['biddingStartTime'] != null
          ? DateTime.tryParse(data['biddingStartTime'])
          : null,
      biddingEndTime: data['biddingEndTime'] != null
          ? DateTime.tryParse(data['biddingEndTime'])
          : null,
      isScheduled: data['isScheduled'] ?? false,
      scheduleTime: data['scheduleTime'] != null
          ? DateTime.tryParse(data['scheduleTime'])
          : null,
    );
  }
}
