import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  TextEditingController controller = TextEditingController(text: "Shahid");
  TextEditingController emailcontroller =
      TextEditingController(text: "s@gmail.com");
  TextEditingController biocontroller =
      TextEditingController(text: "I am from Bwp");
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    TextStyle? textStyle2;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
      textStyle2 = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
      textStyle2 = textTheme(context).bodyMedium;
    } else {
      textStyle = textTheme(context).labelLarge;
      textStyle2 = textTheme(context).bodySmall;
    }
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
              mobileLayout: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Information",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(AppImages.game),
                        ),
                        SizedBox(width: 30),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text("  Replace Picture",
                                  style: textStyle2?.copyWith(
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.3))),
                          child: Text("Remove", style: textStyle2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Display name", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: controller,
                      fillColor: Colors.white,
                      borderColor: Colors.black,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Email", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: emailcontroller,
                      borderColor: Colors.black,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Bio", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: biocontroller,
                      borderColor: Colors.black,
                      maxLines: 4,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
              tabletLayout: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Information",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(AppImages.game),
                        ),
                        SizedBox(width: 30),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              Text("  Replace Picture",
                                  style: textStyle2?.copyWith(
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.3))),
                          child: Text("Remove", style: textStyle2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Display name", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: controller,
                      fillColor: Colors.white,
                      borderColor: Colors.black,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Email", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: emailcontroller,
                      borderColor: Colors.black,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Bio", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: biocontroller,
                      borderColor: Colors.black,
                      maxLines: 4,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
              desktopLayout: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Information",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(AppImages.game),
                        ),
                        SizedBox(width: 30),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              Text("  Replace Picture",
                                  style: textStyle2?.copyWith(
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.3))),
                          child: Text("Remove", style: textStyle2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Display name", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: controller,
                      fillColor: Colors.white,
                      borderColor: Colors.black,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Email", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: emailcontroller,
                      borderColor: Colors.black,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 20),
                    Text("Bio", style: textStyle),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: biocontroller,
                      borderColor: Colors.black,
                      maxLines: 4,
                      fillColor: Colors.white,
                      borderRadius: 8,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
