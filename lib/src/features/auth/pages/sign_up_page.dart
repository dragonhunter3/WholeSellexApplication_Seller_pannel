import 'package:flutter/material.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) => ResponsiveLayout(
            mobileLayout: Container(),
            tabletLayout: Container(),
            desktopLayout: Container(
              height : MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            
            )),
      ),
    );
  }
}
