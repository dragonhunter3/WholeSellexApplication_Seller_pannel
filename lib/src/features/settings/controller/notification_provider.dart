import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier {
  List<bool> _switchValues = List.generate(4, (_) => false); // Initial values

  bool getSwitchValue(int index) => _switchValues[index];

  void toggleSwitch(int index, bool value) {
    _switchValues[index] = value;
    notifyListeners();
  }
}
