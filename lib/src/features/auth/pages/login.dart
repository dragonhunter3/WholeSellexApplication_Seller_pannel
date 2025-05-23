import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/auth_provider.dart';
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

    final authProvider = Provider.of<AuthProvide>(context, listen: false);
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
                onTap: () async {
                  try {
                    await authProvider.signIn(
                        emailController.text, passwordController.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Failed: $e')));
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.signup);
                  },
                  child: Text("Crate New Account"))
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
                    onTap: () async {
                      try {
                        await authProvider.signIn(
                            emailController.text, passwordController.text);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed: $e')));
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoute.signup);
                      },
                      child: Text("Crate New Account"))
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
                    onTap: () async {
                      try {
                        await authProvider.signIn(
                            emailController.text, passwordController.text);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed: $e')));
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoute.signup);
                      },
                      child: Text("Crate New Account"))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
