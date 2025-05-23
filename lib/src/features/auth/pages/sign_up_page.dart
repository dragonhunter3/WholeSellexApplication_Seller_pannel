import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/sign_up_auth.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';
import 'package:whole_sellex_selleradmin_pannel/src/routes/go_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              Text("Sign Up",
                  style: textTheme(context)
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                "Sign up with open account",
                style: textTheme(context).labelLarge,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ]),
                child: (Image.asset(
                  AppImages.google,
                  height: 25,
                  width: 25,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Or continue with email address",
                style: textTheme(context)
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    hint: "Enter your email",
                    fillColor: colorScheme(context).onPrimary,
                    controller: emailController,
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 75, 73, 73),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text("Continue",
                          style: textTheme(context)
                              .labelLarge
                              ?.copyWith(color: Colors.white))),
                ),
                onTap: () {
                  context.pushNamed(AppRoute.signauth);
                },
              ),
            ],
          ),
        ),
        tabletLayout: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.logo,
                height: height * 0.5,
                width: width * 0.4,
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
                  SizedBox(height: 20),
                  Text(
                    "Sign up with open account",
                    style: textTheme(context).labelMedium,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ]),
                    child: (Image.asset(
                      AppImages.google,
                      height: 25,
                      width: 25,
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Or continue with email address",
                    style: textTheme(context)
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: CustomTextFormField(
                        hint: "Enter your email",
                        fillColor: colorScheme(context).onPrimary,
                        controller: emailController,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 75, 73, 73),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text("Continue",
                              style: textTheme(context)
                                  .labelMedium
                                  ?.copyWith(color: Colors.white))),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpAthenticate())));
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
                  Text("Sign Up",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text(
                    "Sign up with open account",
                    style: textTheme(context).labelMedium,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 1,
                          ),
                        ]),
                    child: (Image.asset(
                      AppImages.google,
                      height: 25,
                      width: 25,
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Or continue with email address",
                    style: textTheme(context)
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: CustomTextFormField(
                        hint: "Enter your email",
                        fillColor: colorScheme(context).onPrimary,
                        controller: emailController,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 75, 73, 73),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text("Continue",
                              style: textTheme(context)
                                  .labelMedium
                                  ?.copyWith(color: Colors.white))),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpAthenticate())));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
