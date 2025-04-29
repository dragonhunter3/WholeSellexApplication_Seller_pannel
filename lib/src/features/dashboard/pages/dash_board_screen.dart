import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard/widgets/table_list.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => ResponsiveLayout(
        mobileLayout: Container(),
        tabletLayout: Container(),
        desktopLayout: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.33,
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
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  DataColumn(
                                      numeric: false,
                                      label: Text('Product Name',
                                          textAlign: TextAlign.start,
                                          style: textTheme(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  DataColumn(
                                      numeric: false,
                                      label: Text('Order Date',
                                          textAlign: TextAlign.start,
                                          style: textTheme(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  DataColumn(
                                      numeric: false,
                                      label: Text('Price',
                                          textAlign: TextAlign.start,
                                          style: textTheme(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  DataColumn(
                                      numeric: false,
                                      label: Text('Payment',
                                          textAlign: TextAlign.start,
                                          style: textTheme(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  DataColumn(
                                      numeric: false,
                                      label: Text('Status',
                                          textAlign: TextAlign.start,
                                          style: textTheme(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                ],
                                rows: tableList
                                    .map(
                                      (item) => DataRow(
                                        cells: [
                                          DataCell(Text(item.orderId,
                                              style: textTheme(context)
                                                  .labelMedium)),
                                          DataCell(Text(item.productName,
                                              style: textTheme(context)
                                                  .labelMedium)),
                                          DataCell(Text(item.orderDate,
                                              style: textTheme(context)
                                                  .labelMedium)),
                                          DataCell(Text("\$${item.price}",
                                              style: textTheme(context)
                                                  .labelMedium)),
                                          DataCell(Text(item.payment,
                                              style: textTheme(context)
                                                  .labelMedium)),
                                          DataCell(Text(item.status,
                                              style: textTheme(context)
                                                  .labelMedium)),
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
              ),
              AspectRatio(
                aspectRatio: 1 / 2,
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget customContainer(String text, Color colort1, Icon icon, String price,
      Color backgroundColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.26,
      padding: EdgeInsets.all(16),
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
                style: textTheme(context).labelMedium?.copyWith(color: colort1),
              ),
              Container(
                height: 35,
                width: 35,
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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(image),
      title: Text(
        title,
        style: textTheme(context)
            .labelMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme(context)
            .labelMedium
            ?.copyWith(color: colorScheme(context).onSurface.withOpacity(0.3)),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tralingtitle,
            style: textTheme(context)
                .labelMedium
                ?.copyWith(color: AppColor.appGreen),
          ),
          Text(
            tralingsubtitle,
            style: textTheme(context).labelSmall?.copyWith(
                fontSize: 10,
                color: colorScheme(context).onSurface.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
