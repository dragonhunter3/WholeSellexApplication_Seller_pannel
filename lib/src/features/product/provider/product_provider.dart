import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool settingEnabled = false;
  
  void toggleSetting(bool value) {
    settingEnabled = value;
    notifyListeners();
  }}