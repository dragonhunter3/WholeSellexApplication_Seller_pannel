import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_colors.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  colorScheme(context).onPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) => ResponsiveLayout(
            mobileLayout: Container(),
            tabletLayout: Container(),
            desktopLayout: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColor.appGreen,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {}, child: Text("Move To Next Screen")),
                  Text(
                    "Shahid",
                    style: textTheme(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme(context).secondary),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
