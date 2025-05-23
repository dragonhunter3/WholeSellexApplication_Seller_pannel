import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';
import 'package:whole_sellex_selleradmin_pannel/src/routes/go_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => ResponsiveLayout(
        mobileLayout: Container(
          padding: const EdgeInsets.all(16),
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Text("Forgot your password?",
                    style: textTheme(context)
                        .bodySmall
                        ?.copyWith(decoration: TextDecoration.underline)),
                onTap: () {
                  context.pushNamed(AppRoute.forget);
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 250,
                  child: CustomTextFormField(
                    controller: emailController,
                    hint: "Enter your email",
                    fillColor: colorScheme(context).onPrimary,
                  )),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 250,
                  child: CustomTextFormField(
                    controller: passwordController,
                    hint: "Enter your password",
                    obscureText: true,
                    fillColor: colorScheme(context).onPrimary,
                  )),
              SizedBox(height: 50),
              InkWell(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 75, 73, 73),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Login",
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
                onTap: () {
                  context.pushNamed(AppRoute.signup);
                },
              ),
              SizedBox(
                height: 20,
              ),
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
                  Text("Login",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Text("Forgot your password?",
                        style: textTheme(context)
                            .labelLarge
                            ?.copyWith(decoration: TextDecoration.underline)),
                    onTap: () {
                      context.pushNamed(AppRoute.forget);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 250,
                      child: CustomTextFormField(
                        controller: emailController,
                        hint: "Enter your email",
                        fillColor: colorScheme(context).onPrimary,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 250,
                      child: CustomTextFormField(
                        controller: passwordController,
                        hint: "Enter your password",
                        obscureText: true,
                        fillColor: colorScheme(context).onPrimary,
                      )),
                  SizedBox(height: 50),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 75, 73, 73),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Login",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),
                    onTap: () {
                      context.pushNamed(AppRoute.signup);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                  Text("Login",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Text("Forgot your password?",
                        style: textTheme(context)
                            .labelMedium
                            ?.copyWith(decoration: TextDecoration.underline)),
                    onTap: () {
                      context.pushNamed(AppRoute.forget);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: CustomTextFormField(
                        controller: emailController,
                        hint: "Enter your email",
                        fillColor: colorScheme(context).onPrimary,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 300,
                      child: CustomTextFormField(
                        controller: passwordController,
                        hint: "Enter your password",
                        obscureText: true,
                        fillColor: colorScheme(context).onPrimary,
                      )),
                  SizedBox(height: 50),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 75, 73, 73),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Login",
                            style: textTheme(context)
                                .labelMedium
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),
                    onTap: () {
                      context.pushNamed(AppRoute.signup);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
