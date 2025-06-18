import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/auth_services.dart';

class AuthProvide with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  AuthProvide() {
    _authService.authStateChanges.listen(_onAuthStateChanged);
  }

  Future<void> signUp(String email, String password) async {
    try {
      _user = await _authService.signUp(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _user = await _authService.signIn(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }
}
