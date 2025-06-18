import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class SignUpAthenticate extends StatefulWidget {
  const SignUpAthenticate({super.key});

  @override
  State<SignUpAthenticate> createState() => _SignUpAthenticateState();
}

class _SignUpAthenticateState extends State<SignUpAthenticate> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) => ResponsiveLayout(
                  mobileLayout: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign Up",
                            style: textTheme(context)
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "We are sending you a verify code.Check \n your inbox to check him",
                            style: textTheme(context).bodyMedium),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Or continue with email address",
                          style: textTheme(context).bodySmall,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: colorScheme(context).onPrimary,
                          styles: [
                            textTheme(context).bodySmall,
                            textTheme(context).bodySmall,
                            textTheme(context).bodySmall,
                            textTheme(context).bodySmall,
                          ],
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Verification Code",
                                      style: textTheme(context).bodyMedium,
                                    ),
                                    content: Text(
                                        'Code entered is $verificationCode',
                                        style: textTheme(context).bodySmall),
                                  );
                                });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 46,
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 75, 73, 73),
                          ),
                          child: Center(
                              child: Text("Continue",
                                  style: textTheme(context)
                                      .bodySmall
                                      ?.copyWith(color: Colors.white))),
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
                            Text("Sign Up",
                                style: textTheme(context)
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "We are sending you a verify code.Check \n your inbox to check him",
                                style: textTheme(context).bodySmall),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Or continue with email address",
                              style: textTheme(context).labelLarge,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            OtpTextField(
                              numberOfFields: 4,
                              borderColor: colorScheme(context).onPrimary,
                              styles: [
                                textTheme(context).labelLarge,
                                textTheme(context).labelLarge,
                                textTheme(context).labelLarge,
                                textTheme(context).labelLarge,
                              ],
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {},
                              onSubmit: (String verificationCode) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Verification Code",
                                          style: textTheme(context).bodySmall,
                                        ),
                                        content: Text(
                                            'Code entered is $verificationCode',
                                            style:
                                                textTheme(context).labelLarge),
                                      );
                                    });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 46,
                              width: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 75, 73, 73),
                              ),
                              child: Center(
                                  child: Text("Continue",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(color: Colors.white))),
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
                            Text("Sign Up",
                                style: textTheme(context)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "We are sending you a verify code.Check \n your inbox to check him",
                                style: textTheme(context).labelLarge),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Or continue with email address",
                              style: textTheme(context).labelMedium,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            OtpTextField(
                              numberOfFields: 4,
                              borderColor: colorScheme(context).onPrimary,
                              styles: [
                                textTheme(context).labelMedium,
                                textTheme(context).labelMedium,
                                textTheme(context).labelMedium,
                                textTheme(context).labelMedium,
                              ],
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {},
                              onSubmit: (String verificationCode) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Verification Code",
                                          style: textTheme(context).labelLarge,
                                        ),
                                        content: Text(
                                            'Code entered is $verificationCode',
                                            style:
                                                textTheme(context).labelMedium),
                                      );
                                    });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 46,
                              width: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 75, 73, 73),
                              ),
                              child: Center(
                                  child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
