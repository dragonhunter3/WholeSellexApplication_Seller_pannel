
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';

class Productschedule {
  final String productName;
  final String category;
  final String image;
  final String date;
  final double price;
  bool isSelected;

  Productschedule({
    required this.productName,
    required this.category,
    required this.image,
    required this.date,
    required this.price,
    this.isSelected = false,
  });
}

List<Productschedule> item = List.generate(25, (index) {
  return Productschedule(
    image: AppImages.shose,
    productName: "Shoes For men",
    category: "Footwear",
    date: '2024-05-01',
    price: 10.0 + index,
  );
});
