import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';

class TbaleProducts {
  final String image;
  final String productName;
  final String status;
  final String stock;
  final String price;
  final String date;
  TbaleProducts(
      {required this.image,
      required this.productName,
      required this.status,
      required this.stock,
      required this.price,
      required this.date});
}

List<TbaleProducts> product = [
  TbaleProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Panding ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024"),
  TbaleProducts(
      image: AppImages.game,
      productName: "Kid game",
      status: "complete ",
      stock: "in Stock",
      price: "200",
      date: "05-04-2024"),
  TbaleProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Panding ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024")
];
