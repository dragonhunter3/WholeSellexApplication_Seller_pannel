class TableModel {
  final String orderId;
  final String productName;
  final String orderDate;
  final String price;
  final String payment;
  final String status;
  TableModel(
      {required this.orderId,
      required this.productName,
      required this.orderDate,
      required this.price,
      required this.payment,
      required this.status});
}

List<TableModel> tableList = [
  TableModel(
      orderId: "asdfg",
      productName: "Nike Sportswear",
      orderDate: "Jan 12 , 12:23 pm",
      price: "999",
      payment: "Transfer",
      status: "Processing"),
  TableModel(
      orderId: "5435DF",
      productName: "Acqua di Parma",
      orderDate: "May 01 , 01:13 pm",
      price: "1500",
      payment: "Credit Card",
      status: "Completed"),
  TableModel(
      orderId: "#9876XC",
      productName: "Allen Solly",
      orderDate: "Sep 20 , 09:08 am",
      price: "1400",
      payment: "Transfer",
      status: "Completed"),
];
