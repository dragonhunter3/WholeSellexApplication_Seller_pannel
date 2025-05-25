import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/auth_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/chat/controller/chat_controller.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/chat/controller/select_user.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/provider/dashboard_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/categoryprovider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/date_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/image_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/product_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/schduke_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/switch_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/conteroller/controller.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/conteroller/show_all_products_controller.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/settings/controller/notification_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/routes/go_route.dart';
import 'package:whole_sellex_selleradmin_pannel/src/schedule/provider/scheduleprovider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDyN1GuWumPgqhPQW-BY7666GGRmJidMvs",
      authDomain: "wholesellexapplication-542be.firebaseapp.com",
      projectId: "wholesellexapplication-542be",
      storageBucket: "wholesellexapplication-542be.firebasestorage.app",
      messagingSenderId: "206891758660",
      appId: "1:206891758660:web:ca52bb037750852655b811",
    ),
  );
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
        ChangeNotifierProvider<DateProvider>(
          create: (_) => DateProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductPro(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectUser(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductCategory(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvide(),
        ),
        ChangeNotifierProvider(
          create: (_) => DatePicker(),
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulePro(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImageController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SwitchController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShowAllProductsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
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
