import 'package:flutter/material.dart';

class SwitchController with ChangeNotifier {
  final Map<String, bool> _switches = {
    'switch1': false, // Bidding
    'switch2': false, // Schedule
    'switch3': false, // Add new category
  };

  bool getSwitchValue(String key) => _switches[key] ?? false;

  void toggleSwitch(String key, bool value) {
    _switches[key] = value;
    notifyListeners();
  }
}
