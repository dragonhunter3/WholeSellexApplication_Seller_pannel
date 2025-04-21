import 'package:flutter/material.dart';
import 'package:go_shop_admin_panel/theme/app_text_theme.dart';
import 'package:go_shop_admin_panel/theme/color_scheme.dart';


class AppTheme {
  AppTheme._();

  factory AppTheme() {
    return instance;
  }

  static final AppTheme instance = AppTheme._();
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorSchemeLight,
      textTheme: appTextTheme(context), 
      
    );
  }
}
