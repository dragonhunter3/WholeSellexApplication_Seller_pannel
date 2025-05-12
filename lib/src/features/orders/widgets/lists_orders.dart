import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';

class PandingProducts {
  final String image;
  final String productName;
  final String status;
  final String stock;
  final String price;
  final String date;
  PandingProducts(
      {required this.image,
      required this.productName,
      required this.status,
      required this.stock,
      required this.price,
      required this.date});
}

List<PandingProducts> panding = [
  PandingProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Panding ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024"),
  PandingProducts(
      image: AppImages.game,
      productName: "Kid game",
      status: "panding",
      stock: "in Stock",
      price: "200",
      date: "05-04-2024"),
  PandingProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Panding ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024")
];

class CancelProducts {
  final String image;
  final String productName;
  final String status;
  final String stock;
  final String price;
  final String date;
  CancelProducts(
      {required this.image,
      required this.productName,
      required this.status,
      required this.stock,
      required this.price,
      required this.date});
}

List<CancelProducts> cancel = [
  CancelProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Cancel ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024"),
  CancelProducts(
      image: AppImages.game,
      productName: "Kid game",
      status: "Cancel",
      stock: "in Stock",
      price: "200",
      date: "05-04-2024"),
  CancelProducts(
      image: AppImages.shose,
      productName: "Shoes For men",
      status: "Cancel ",
      stock: "in Stock",
      price: "500",
      date: "05-04-2024")
];
