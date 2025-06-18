import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/login.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/pages/dashboard_screen.dart';
import 'auth_provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvide>(context);
    return authProvider.user != null ? DashboardPage() : LoginScreen();
  }
}
