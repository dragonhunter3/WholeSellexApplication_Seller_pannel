import 'package:flutter/material.dart';

class DatePicker with ChangeNotifier {
  DateTime _currentDateTime = DateTime.now();
  DateTime? _selectedDate;

  DateTime get currentDateTime => _currentDateTime;
  DateTime? get selectedDate => _selectedDate;

  void setCurrentDateTime() {
    _currentDateTime = DateTime.now();
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
