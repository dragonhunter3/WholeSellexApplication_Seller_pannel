import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/provider/dashboard_provider.dart';

import 'package:whole_sellex_selleradmin_pannel/src/routes/go_route.dart';
import 'package:whole_sellex_selleradmin_pannel/src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

    
        ChangeNotifierProvider<DashboardProvider>(
          create: (_) => DashboardProvider(),

        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightTheme(context),
        routerDelegate: MyAppRouter.router.routerDelegate,
        routeInformationParser: MyAppRouter.router.routeInformationParser,
        routeInformationProvider: MyAppRouter.router.routeInformationProvider,
      ),
    );
  }
}
