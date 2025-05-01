import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_button.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({super.key});

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  var height;
  var width;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
              mobileLayout: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    Container(
                      height: height,
                      width: width,
                      padding: EdgeInsets.all(16),
                      color: AppColor.appWhite,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: height * 0.07,
                                  width: width * 0.35,
                                  child: CustomTextFormField(
                                    controller: controller,
                                    hint: "Search product",
                                    borderRadius: 5,
                                    fillColor: colorScheme(context).onPrimary,
                                    textStyle: textTheme(context).bodySmall,
                                    hintColor: colorScheme(context)
                                        .onSurface
                                        .withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 40,
                                  width: 90,
                                  child: CustomButton(
                                      borderRadius: 5,
                                      textSize: 12,
                                      onTap: () {},
                                      text: "Search"),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Bidding Products",
                              style: textTheme(context)
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            customTile("Kidd Gamming", "Remaning Time ",
                                " 23 mint", () {}),
                            SizedBox(height: 15),
                            Text(
                              "Schdule Bidding Products",
                              style: textTheme(context)
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            customTile("Kidd Gamming", "Remaning Time ",
                                " 23 mint", () {}),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height,
                      width: width,
                      color: AppColor.appWhite,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Bidding history",
                            style: textTheme(context)
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(AppImages.shose),
                                ),
                                title: Text("Ahmed Khan",
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  "Ahmad Won the shoses at 12:30",
                                  style: textTheme(context).bodySmall,
                                ),
                                trailing: Text(
                                  "Rs 300",
                                  style: textTheme(context).bodySmall,
                                ),
                              );
                            },
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              tabletLayout: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height,
                    width: width * 0.6,
                    padding: EdgeInsets.all(16),
                    color: AppColor.appWhite,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: height * 0.07,
                                width: width * 0.35,
                                child: CustomTextFormField(
                                  controller: controller,
                                  hint: "Search product",
                                  borderRadius: 5,
                                  fillColor: colorScheme(context).onPrimary,
                                  textStyle: textTheme(context).labelLarge,
                                  hintColor: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.3),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 90,
                                child: CustomButton(
                                    borderRadius: 5,
                                    textSize: 12,
                                    onTap: () {},
                                    text: "Search"),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Bidding Products",
                            style: textTheme(context)
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          customTile("Kidd Gamming", "Remaning Time ",
                              " 23 mint", () {}),
                          SizedBox(height: 15),
                          Text(
                            "Schdule Bidding Products",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          customTile("Kidd Gamming", "Remaning Time ",
                              " 23 mint", () {}),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height,
                    width: width * 0.4,
                    color: AppColor.appWhite,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Bidding history",
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(AppImages.shose),
                              ),
                              title: Text("Ahmed Khan",
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                "Ahmad Won the shoses at 12:30",
                                style: textTheme(context).labelLarge,
                              ),
                              trailing: Text(
                                "Rs 300",
                                style: textTheme(context).labelLarge,
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  )
                ],
              ),
              desktopLayout: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height,
                    width: width * 0.54,
                    padding: EdgeInsets.all(16),
                    color: AppColor.appWhite,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: height * 0.07,
                                width: width * 0.2,
                                child: CustomTextFormField(
                                  controller: controller,
                                  hint: "Search product",
                                  borderRadius: 5,
                                  fillColor: colorScheme(context).onPrimary,
                                  textStyle: textTheme(context).labelMedium,
                                  hintColor: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.3),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 90,
                                child: CustomButton(
                                    borderRadius: 5,
                                    textSize: 12,
                                    onTap: () {},
                                    text: "Search"),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Bidding Products",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          customTile("Kidd Gamming", "Remaning Time ",
                              " 23 mint", () {}),
                          SizedBox(height: 15),
                          Text(
                            "Schdule Bidding Products",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          customTile("Kidd Gamming", "Remaning Time ",
                              " 23 mint", () {}),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height,
                    width: width * 0.25,
                    color: AppColor.appWhite,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Bidding history",
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
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(AppImages.shose),
                              ),
                              title: Text("Ahmed Khan",
                                  style: textTheme(context)
                                      .labelMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                "Ahmad Won the shoses at 12:30",
                                style: textTheme(context).labelMedium,
                              ),
                              trailing: Text(
                                "Rs 300",
                                style: textTheme(context).labelLarge,
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget customTile(
      String title, String subtitle, String time, VoidCallback ontap) {
    TextStyle? textStyle;
    if (width < 600) {
      textStyle = textTheme(context).bodySmall;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
    } else {
      textStyle = textTheme(context).labelMedium;
    }
    return SizedBox(
      height: height * 0.5,
      width: width,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              AppImages.game,
              cacheHeight: 50,
              cacheWidth: 50,
            ),
            title: Text(title,
                style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: RichText(
                text: TextSpan(
                    text: subtitle,
                    style: textStyle?.copyWith(color: AppColor.appGreen),
                    children: [
                  TextSpan(
                      text: time,
                      style: textStyle?.copyWith(color: AppColor.appDarkGrey))
                ])),
            trailing: GestureDetector(
                onTap: ontap, child: Icon(Icons.more_vert_outlined, size: 14)),
          );
        },
      ),
    );
  }
}
