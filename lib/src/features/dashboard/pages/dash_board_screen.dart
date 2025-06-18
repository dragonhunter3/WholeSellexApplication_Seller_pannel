import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard/widgets/pichart.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard/widgets/table_list.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => ResponsiveLayout(
        mobileLayout: SingleChildScrollView(
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Container(
                height: height,
                width: width,
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back Muhammad",
                          style: textTheme(context)
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Here’s Your Current Sales Overview",
                          style: textTheme(context).bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context)
                                  .onSecondary
                                  .withOpacity(0.3))),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customContainer(
                              "AVG Order Value",
                              colorScheme(context).onPrimary,
                              Icon(Icons.save_outlined, size: 15),
                              "Rs 500",
                              colorScheme(context).onSecondary),
                          customContainer(
                              "Total Orders",
                              colorScheme(context).onSecondary,
                              Icon(
                                Icons.paste_outlined,
                                size: 15,
                              ),
                              "Rs 500000",
                              colorScheme(context).onPrimary),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.48,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: colorScheme(context).onPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Selling Products",
                                  style: textTheme(context)
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.appWhite),
                                  child: Center(
                                      child: Text(
                                    "Show All",
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) => customTile(
                                    AppImages.shose,
                                    "Red Tape Sports Shoes for Men",
                                    "12,429 Sales",
                                    "Available",
                                    "135 Stocks Remaining"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorScheme(context).onPrimary,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columnSpacing: 40,
                              headingRowHeight: 70,
                              dataRowHeight: 70,
                              columns: [
                                DataColumn(
                                    numeric: false,
                                    label: Text('Order ID',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                                DataColumn(
                                    numeric: false,
                                    label: Text('Product Name',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                                DataColumn(
                                    numeric: false,
                                    label: Text('Order Date',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                                DataColumn(
                                    numeric: false,
                                    label: Text('Price',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                                DataColumn(
                                    numeric: false,
                                    label: Text('Payment',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                                DataColumn(
                                    numeric: false,
                                    label: Text('Status',
                                        textAlign: TextAlign.start,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))),
                              ],
                              rows: tableList
                                  .map(
                                    (item) => DataRow(
                                      cells: [
                                        DataCell(Text(item.orderId,
                                            style:
                                                textTheme(context).bodySmall)),
                                        DataCell(Text(item.productName,
                                            style:
                                                textTheme(context).bodySmall)),
                                        DataCell(Text(item.orderDate,
                                            style:
                                                textTheme(context).bodySmall)),
                                        DataCell(Text("\$${item.price}",
                                            style:
                                                textTheme(context).bodySmall)),
                                        DataCell(Text(item.payment,
                                            style:
                                                textTheme(context).bodySmall)),
                                        DataCell(Text(item.status,
                                            style:
                                                textTheme(context).bodySmall)),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Customers",
                              style: textTheme(context)
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            CustomPichart(),
                            SizedBox(height: 10),
                            customRow(AppColor.appYellow, "New Customers"),
                            SizedBox(height: 10),
                            customRow(AppColor.appRed, "Returning Customers")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Comments ",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.6,
                        width: width,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => customCard(
                              AppImages.shose,
                              "Muhammad Shahid",
                              "Apr 1",
                              "Greet Work 😊"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        tabletLayout: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height,
              width: width * 0.65,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back Muhammad",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Here’s Your Current Sales Overview",
                        style: textTheme(context).labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context)
                                .onSecondary
                                .withOpacity(0.3))),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customContainer(
                            "AVG Order Value",
                            colorScheme(context).onPrimary,
                            Icon(Icons.save_outlined, size: 15),
                            "Rs 500",
                            colorScheme(context).onSecondary),
                        SizedBox(width: 10),
                        customContainer(
                            "Total Orders",
                            colorScheme(context).onSecondary,
                            Icon(
                              Icons.paste_outlined,
                              size: 15,
                            ),
                            "Rs 500000",
                            colorScheme(context).onPrimary),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.48,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: colorScheme(context).onPrimary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Selling Products",
                                style: textTheme(context)
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.appWhite),
                                child: Center(
                                    child: Text(
                                  "Show All",
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.33,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) => customTile(
                                  AppImages.shose,
                                  "Red Tape Sports Shoes for Men",
                                  "12,429 Sales",
                                  "Available",
                                  "135 Stocks Remaining"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorScheme(context).onPrimary,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 40,
                            headingRowHeight: 70,
                            dataRowHeight: 70,
                            columns: [
                              DataColumn(
                                  numeric: false,
                                  label: Text('Order ID',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Product Name',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Order Date',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Price',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Payment',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Status',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                            ],
                            rows: tableList
                                .map(
                                  (item) => DataRow(
                                    cells: [
                                      DataCell(Text(item.orderId,
                                          style:
                                              textTheme(context).labelLarge)),
                                      DataCell(Text(item.productName,
                                          style:
                                              textTheme(context).labelLarge)),
                                      DataCell(Text(item.orderDate,
                                          style:
                                              textTheme(context).labelLarge)),
                                      DataCell(Text("\$${item.price}",
                                          style:
                                              textTheme(context).labelLarge)),
                                      DataCell(Text(item.payment,
                                          style:
                                              textTheme(context).labelLarge)),
                                      DataCell(Text(item.status,
                                          style:
                                              textTheme(context).labelLarge)),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height,
              width: width * 0.35,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Customers",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          CustomPichart(),
                          SizedBox(height: 10),
                          customRow(AppColor.appYellow, "New Customers"),
                          SizedBox(height: 10),
                          customRow(AppColor.appRed, "Returning Customers")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Comments ",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.6,
                      width: width,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => customCard(
                            AppImages.shose,
                            "Muhammad Shahid",
                            "Apr 1",
                            "Greet Work 😊"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        desktopLayout: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height,
              width: width * 0.55,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back Muhammad",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Here’s Your Current Sales Overview",
                        style: textTheme(context).labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context)
                                .onSecondary
                                .withOpacity(0.3))),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customContainer(
                            "AVG . Order Value",
                            colorScheme(context).onPrimary,
                            Icon(Icons.save_outlined),
                            "Rs 500",
                            colorScheme(context).onSecondary),
                        customContainer(
                            "Total Orders",
                            colorScheme(context).onSecondary,
                            Icon(Icons.paste_outlined),
                            "Rs 500000",
                            colorScheme(context).onPrimary),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.48,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: colorScheme(context).onPrimary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Selling Products",
                                style: textTheme(context)
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.appWhite),
                                child: Center(
                                    child: Text(
                                  "Show All",
                                  style: textTheme(context)
                                      .labelMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.33,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) => customTile(
                                  AppImages.shose,
                                  "Red Tape Sports Shoes for Men",
                                  "12,429 Sales",
                                  "Available",
                                  "135 Stocks Remaining"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorScheme(context).onPrimary,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 40,
                            headingRowHeight: 70,
                            dataRowHeight: 70,
                            columns: [
                              DataColumn(
                                  numeric: false,
                                  label: Text('Order ID',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Product Name',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Order Date',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Price',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Payment',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                              DataColumn(
                                  numeric: false,
                                  label: Text('Status',
                                      textAlign: TextAlign.start,
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))),
                            ],
                            rows: tableList
                                .map(
                                  (item) => DataRow(
                                    cells: [
                                      DataCell(Text(item.orderId,
                                          style:
                                              textTheme(context).labelMedium)),
                                      DataCell(Text(item.productName,
                                          style:
                                              textTheme(context).labelMedium)),
                                      DataCell(Text(item.orderDate,
                                          style:
                                              textTheme(context).labelMedium)),
                                      DataCell(Text("\$${item.price}",
                                          style:
                                              textTheme(context).labelMedium)),
                                      DataCell(Text(item.payment,
                                          style:
                                              textTheme(context).labelMedium)),
                                      DataCell(Text(item.status,
                                          style:
                                              textTheme(context).labelMedium)),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height,
              width: width * 0.23,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Customers",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          CustomPichart(),
                          SizedBox(height: 10),
                          customRow(AppColor.appYellow, "New Customers"),
                          SizedBox(height: 10),
                          customRow(AppColor.appRed, "Returning Customers")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Comments ",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.6,
                      width: width,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => customCard(
                            AppImages.shose,
                            "Muhammad Shahid",
                            "Apr 1",
                            "Greet Work 😊"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget customCard(
      String image, String ttext, String ttext2, String subtitle) {
    final width = MediaQuery.of(context).size.width;
    double? size;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodySmall;
      size = 15;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
      size = 15;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    return Card(
      child: Container(
        height: height * 0.25,
        width: width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              title: Row(
                children: [
                  Text(
                    ttext,
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ttext2,
                    style: textStyle?.copyWith(
                        fontSize: 12,
                        color: colorScheme(context).onSurface.withOpacity(0.3)),
                  )
                ],
              ),
              subtitle: Text(
                subtitle,
                style: textStyle,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.chat_outlined,
                  size: size,
                ),
                Icon(
                  Icons.favorite_outline,
                  size: size,
                ),
                Icon(
                  Icons.link_outlined,
                  size: size,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customContainer(String text, Color colort1, Icon icon, String price,
      Color backgroundColor) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    double containerWidth;
    if (width < 600) {
      containerWidth = width * 0.45;
    } else if (width > 1024) {
      containerWidth = width * 0.25;
    } else {
      containerWidth = width * 0.28;
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: containerWidth,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: textStyle?.copyWith(color: colort1),
              ),
              Container(
                height: height * 0.06,
                width: width * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorScheme(context).onPrimary),
                child: Center(
                  child: icon,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: textTheme(context).bodySmall?.copyWith(color: colort1),
          )
        ],
      ),
    );
  }

  Widget customTile(String image, String title, String subtitle,
      String tralingtitle, String tralingsubtitle) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    TextStyle? textStyle2;

    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
      textStyle2 = textTheme(context).labelLarge;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
      textStyle2 = textTheme(context).labelMedium;
    } else {
      textStyle = textTheme(context).labelMedium;
      textStyle2 = textTheme(context).labelSmall;
    }
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(image),
      title: Text(
        title,
        style: textStyle?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: textStyle?.copyWith(
            color: colorScheme(context).onSurface.withOpacity(0.3)),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tralingtitle,
            style: textStyle?.copyWith(color: AppColor.appGreen),
          ),
          Text(
            tralingsubtitle,
            style: textStyle2?.copyWith(
                fontSize: 10,
                color: colorScheme(context).onSurface.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }

  Widget customRow(Color color, String text) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).labelLarge;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelMedium;
    } else {
      textStyle = textTheme(context).labelSmall;
    }
    return Row(
      children: [
        Container(
          height: 17,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: textStyle?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    );
  }
}
