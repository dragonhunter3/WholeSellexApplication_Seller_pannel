import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) => ResponsiveLayout(
                  mobileLayout: Container(
                    padding: EdgeInsets.all(16),
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Text("Forgot",
                            style: textTheme(context)
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        Text(
                          "Password",
                          style: textTheme(context).bodyMedium,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "No worries,we'll send you\nreset instruction",
                          style: textTheme(context).bodySmall,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                            width: 250,
                            child: CustomTextFormField(
                              controller: emailController,
                              hint: "Enter your email",
                              fillColor: colorScheme(context).onPrimary,
                            )),
                        SizedBox(height: 20),
                        Container(
                          height: 46,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 75, 73, 73),
                          ),
                          child: Center(
                              child: Text("Reset Password",
                                  style: textTheme(context)
                                      .bodySmall
                                      ?.copyWith(color: Colors.white))),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          child: Text(
                            "Back to login",
                            style: textTheme(context).bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  tabletLayout: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppImages.logo,
                          height: height * 0.5,
                          width: width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 30,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 15),
                            Text("Forgot",
                                style: textTheme(context)
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              "Password",
                              style: textTheme(context).bodySmall,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "No worries,we'll send you\nreset instruction",
                              style: textTheme(context).labelLarge,
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                                width: 250,
                                child: CustomTextFormField(
                                  controller: emailController,
                                  hint: "Enter your email",
                                  fillColor: colorScheme(context).onPrimary,
                                )),
                            SizedBox(height: 20),
                            Container(
                              height: 46,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 75, 73, 73),
                              ),
                              child: Center(
                                  child: Text("Reset Password",
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(color: Colors.white))),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Text(
                                "Back to login",
                                style: textTheme(context).labelLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                context.pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  desktopLayout: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppImages.logo,
                          height: height * 0.6,
                          width: width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 50,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 15),
                            Text("Forgot",
                                style: textTheme(context)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              "Password",
                              style: textTheme(context).labelLarge,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "No worries,we'll send you\nreset instruction",
                              style: textTheme(context).labelMedium,
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                                width: 300,
                                child: CustomTextFormField(
                                  controller: emailController,
                                  hint: "Enter your email",
                                  fillColor: colorScheme(context).onPrimary,
                                )),
                            SizedBox(height: 20),
                            Container(
                              height: 46,
                              width: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 75, 73, 73),
                              ),
                              child: Center(
                                  child: Text("Reset Password",
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(color: Colors.white))),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Text(
                                "Back to login",
                                style: textTheme(context).labelMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                context.pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
