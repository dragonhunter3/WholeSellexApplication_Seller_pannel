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
}
