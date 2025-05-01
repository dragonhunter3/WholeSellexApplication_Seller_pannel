import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/earnings/model/earning_model.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/earnings/widgets/bar_chart.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
              mobileLayout: Container(),
              tabletLayout: Container(),
              desktopLayout: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customContainer(
                              AppColor.appOrange,
                              SvgPicture.asset(AppIcons.text),
                              "Earnings",
                              "RS 128k"),
                          customContainer(
                              AppColor.appRed,
                              SvgPicture.asset(AppIcons.disk),
                              "Balance",
                              "RS 512K"),
                          customContainer(
                              AppColor.appGreen,
                              SvgPicture.asset(AppIcons.trolley),
                              "Total value of sales",
                              "RS 64K"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height * 0.5,
                            width: width * 0.55,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColor.appWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product views",
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 30),
                                SizedBox(
                                    height: height * 0.3,
                                    width: width,
                                    child: CustomBarChart())
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.5,
                            width: width * 0.2,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColor.appWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Top Cities",
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text("Lahore",
                                          style:
                                              textTheme(context).labelMedium),
                                      trailing: Text("RS 50000",
                                          style:
                                              textTheme(context).labelMedium),
                                    );
                                  },
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: height * 0.5,
                        width: width,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.appWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product Record",
                                style: textTheme(context)
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            SizedBox(
                                height: height * 0.35,
                                width: width,
                                child: SingleChildScrollView(
                                    child: customTable())),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget customContainer(Color color, Widget icon, String text1, String price) {
    return Container(
      height: height * 0.26,
      width: width * 0.25,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(text1, style: textTheme(context).labelMedium),
              SizedBox(width: 10),
              Icon(Icons.info_outline, size: 14)
            ],
          ),
          SizedBox(height: 10),
          Text(
            price,
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget customTable() {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    return SizedBox(
      height: height * 0.5,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
          columnSpacing: 200,
          columns: [
            DataColumn(
                label: Text("Date",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Status",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Product sales count",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Earning",
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold))),
          ],
          rows: mylist.map((product) {
            return DataRow(cells: [
              DataCell(Text(product.date, style: textStyle)),
              DataCell(Text(product.status, style: textStyle)),
              DataCell(Text(product.productSaleCount, style: textStyle)),
              DataCell(Text(product.earning, style: textStyle)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
