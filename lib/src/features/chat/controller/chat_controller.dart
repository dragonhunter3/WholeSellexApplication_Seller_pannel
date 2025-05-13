import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _messages = [];

  List<Map<String, dynamic>> get messages => _messages;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    _messages.add({'text': text, 'isMe': true});
    notifyListeners();

    // Simulate user response
    Future.delayed(const Duration(seconds: 1), () {
      _messages.add({'text': "This is a reply", 'isMe': false});
      notifyListeners();
    });
  }
}
