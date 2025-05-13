// chat_provider.dart

import 'package:flutter/material.dart';

class SelectUser with ChangeNotifier {
  String? _selectedUser;

  String? get selectedUser => _selectedUser;

  void selectUser(String userName) {
    _selectedUser = userName;
    notifyListeners();
  }

  void clearUser() {
    _selectedUser = null;
    notifyListeners();
  }
}
