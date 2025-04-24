import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_shop_admin_panel/common/constants/app_images.dart';
// import 'package:go_shop_admin_panel/common/constants/global_variables.dart';
// import 'package:go_shop_admin_panel/common/widgets/custom_textfield.dart';
// import 'package:go_shop_admin_panel/features/analytics/pages/analytics_screen.dart';
// import 'package:go_shop_admin_panel/features/customers/pages/customers_screen.dart';
// import 'package:go_shop_admin_panel/features/dashboard_drawer/provider/dashboard_provider.dart';
// import 'package:go_shop_admin_panel/features/home_page/pages/home_page.dart';
// import 'package:go_shop_admin_panel/features/logout/pages/logout_page.dart';
// import 'package:go_shop_admin_panel/features/orders/pages/orders_screen.dart';
// import 'package:go_shop_admin_panel/features/promotion/pages/promotion_screen.dart';
// import 'package:go_shop_admin_panel/features/settings/pages/setting_page.dart';
// import 'package:go_shop_admin_panel/features/stores/pages/stores_screen.dart';
// import 'package:go_shop_admin_panel/features/user_query/pages/user_query_screen.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/provider/dashboard_provider.dart';
import '../../responsive_layout/responsive_layout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _mobileScaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _tabletScaffoldKey =
      GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    // const HomePage(),
    // const StoresScreen(),
    // const OrdersScreen(),
    // const CustomersScreen(),
    // const PromotionsScreen(),
    // const QueriesScreen(),
    // const AnalyticsScreen(),
    // const SettingPage(),
    // const LogoutPage(),
  ];
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Stores';
      case 2:
        return 'Store Category';
      case 3:
        return 'Customers';
      case 4:
        return 'Promotions';
      case 5:
        return 'User Queries';
      case 6:
        return 'Analytics';
      case 7:
        return 'Settings';
      case 8:
        return 'Logout';
      default:
        return 'Dashboard';
    }
  }

  static Widget _buildScreen(
      String text, Color bgColor, Color textColor, double fontSize) {
    return Container(
      color: bgColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ResponsiveLayout(
      desktopLayout: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: SvgPicture.asset(
                              AppIcons.drawerLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "WholeSellex",
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          const SizedBox(height: 10),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 0
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.dashboardIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 0
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Dashboard',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 0
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(0);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 1
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.storeIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 1
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Store',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 1
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(1);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 2
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.shoppingIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 2
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Store Category',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 2
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(2);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 3
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.customerIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 3
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Customers',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 3
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(3);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 4
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.promotionsIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 4
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Promotions',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 4
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(4);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 5
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.usersqueriesIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 5
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'User Queries',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 5
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(5);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 6
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.analyticsdIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 6
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Analytics',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 6
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(6);
                                },
                              );
                            },
                          ),
                          SizedBox(width: height * 0.1),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 7
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.settingsIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 7
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Settings',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 7
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(7);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 8
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.logoutIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 8
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Logout',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 8
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(8);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.11,
                    width: double.infinity,
                    color: colorScheme(context).surface,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<DashboardProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  _getAppBarTitle(provider.selectedIndex),
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(
                                          color: colorScheme(context).primary,
                                          fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            Consumer<DashboardProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                                  style: textTheme(context)
                                      .labelMedium
                                      ?.copyWith(
                                          color: colorScheme(context)
                                              .onSurface
                                              .withOpacity(0.66),
                                          fontWeight: FontWeight.w400),
                                );
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: height * 0.08,
                          width: width * 0.25,
                          child: CustomTextFormField(
                            textStyle: textTheme(context).labelMedium?.copyWith(
                                color: colorScheme(context).onSurface),
                            hint: "Search anything...",
                            controller: searchController,
                            borderRadius: 30,
                          ),
                        ),
                        SizedBox(width: width * 0.015),
                        IconButton(
                            onPressed: () {},
                            icon: Badge(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                backgroundColor: colorScheme(context).error,
                                child: Icon(
                                    color: colorScheme(context).outlineVariant,
                                    size: width * 0.02,
                                    Icons.notifications_none))),
                        SizedBox(width: width * 0.015),
                        CircleAvatar(
                          backgroundColor: colorScheme(context).outline,
                          radius: width * 0.015,
                          child: Center(
                              child: Icon(
                            Icons.person,
                            size: width * 0.015,
                          )),
                        ),
                        SizedBox(width: width * 0.01),
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.chevronDownIcon)),
                        SizedBox(width: width * 0.02),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<DashboardProvider>(
                      builder: (context, provider, child) {
                        return _screens[provider.selectedIndex];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      tabletLayout: Scaffold(
        key: _tabletScaffoldKey,
        drawer: Drawer(
          width: width * 0.4,
          child: Container(
            decoration: BoxDecoration(color: colorScheme(context).onPrimary),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: SvgPicture.asset(
                                  AppIcons.drawerLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "WholeSellex",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              const SizedBox(height: 10),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 0
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.dashboardIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 0
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Dashboard',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              0
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(0);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 1
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.storeIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 1
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Store',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              1
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(1);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 2
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons
                                                .storeIcon, // Add Orders icon
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 2
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Orders',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              2
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(2);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 3
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.customerIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 3
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Customers',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              3
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(3);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 4
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.promotionsIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 4
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Promotions',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              4
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(4);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 5
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.usersqueriesIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 5
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'User Queries',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              5
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(5);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 6
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.analyticsdIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 6
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Analytics',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              6
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(6);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              SizedBox(width: height * 0.1),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 7
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.settingsIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 7
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Settings',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              7
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(7);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 8
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.logoutIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 8
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Logout',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              8
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(8);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.11,
              width: double.infinity,
              color: colorScheme(context).surface,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _tabletScaffoldKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: colorScheme(context).onSurface,
                        size: width * 0.025,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            _getAppBarTitle(provider.selectedIndex),
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.66),
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.33,
                    child: CustomTextFormField(
                      textStyle: textTheme(context)
                          .labelLarge
                          ?.copyWith(color: colorScheme(context).onSurface),
                      hint: "Search anything...",
                      controller: searchController,
                      borderRadius: 30,
                    ),
                  ),
                  SizedBox(width: width * 0.015),
                  IconButton(
                      onPressed: () {},
                      icon: Badge(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          backgroundColor: colorScheme(context).error,
                          child: Icon(
                              color: colorScheme(context).outlineVariant,
                              size: width * 0.025,
                              Icons.notifications_none))),
                  SizedBox(width: width * 0.015),
                  CircleAvatar(
                    backgroundColor: colorScheme(context).outline,
                    radius: width * 0.02,
                    child: Center(
                        child: Icon(
                      Icons.person,
                      size: width * 0.02,
                    )),
                  ),
                  SizedBox(width: width * 0.01),
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(AppIcons.chevronDownIcon)),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DashboardProvider>(
                builder: (context, provider, child) {
                  return _screens[provider.selectedIndex];
                },
              ),
            ),
          ],
        ),
      ),
      mobileLayout: SafeArea(
        child: Scaffold(
          key: _mobileScaffoldKey,
          drawer: Drawer(
            width: width * 0.5,
            child: Container(
              decoration: BoxDecoration(color: colorScheme(context).onPrimary),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme(context).onPrimary,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.06,
                                  width: width * 0.11,
                                  child: SvgPicture.asset(
                                    AppIcons.drawerLogo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "WholeSellex",
                                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          color: colorScheme(context).primary,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              children: [
                                const SizedBox(height: 10),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 0
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.dashboardIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 0
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Dashboard',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            0
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(0);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 1
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.storeIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 1
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Store',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            1
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(1);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 2
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.storeIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 2
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Orders',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            2
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(2);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 3
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.customerIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 3
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Customers',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            3
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(3);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 4
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.promotionsIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 4
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Promotions',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            4
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(4);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 5
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.usersqueriesIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 5
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'User Queries',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            5
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(5);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 6
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.analyticsdIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 6
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Analytics',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            6
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(6);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 7
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.settingsIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 7
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Settings',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            7
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(7);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                                Consumer<DashboardProvider>(
                                  builder: (context, provider, child) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 8
                                              ? colorScheme(context).primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.logoutIcon,
                                              height: width * 0.023,
                                              colorFilter: ColorFilter.mode(
                                                provider.selectedIndex == 8
                                                    ? colorScheme(context)
                                                        .onPrimary
                                                    : colorScheme(context)
                                                        .outlineVariant,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Logout',
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: provider
                                                                .selectedIndex ==
                                                            8
                                                        ? colorScheme(context)
                                                            .onPrimary
                                                        : colorScheme(context)
                                                            .outlineVariant,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        provider.setSelectedIndex(8);
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.11,
                width: double.infinity,
                color: colorScheme(context).surface,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        _mobileScaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: colorScheme(context).onSurface,
                        size: width * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<DashboardProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              _getAppBarTitle(provider.selectedIndex),
                              style: textTheme(context).labelLarge?.copyWith(
                                  color: colorScheme(context).primary,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                        Consumer<DashboardProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                              style: textTheme(context).labelLarge?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.66),
                                  fontWeight: FontWeight.w400),
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: CustomTextFormField(
                        textStyle: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: colorScheme(context).onSurface),
                        hint: "Search anything...",
                        hintSize: width * 0.017,
                        controller: searchController,
                        borderRadius: 30,
                      ),
                    ),
                    SizedBox(width: width * 0.015),
                    InkWell(
                        onTap: () {},
                        child: Badge(
                            padding: const EdgeInsets.only(top: 5, right: 10),
                            backgroundColor: colorScheme(context).error,
                            child: Icon(
                                color: colorScheme(context).outlineVariant,
                                size: width * 0.03,
                                Icons.notifications_none))),
                    SizedBox(width: width * 0.015),
                    CircleAvatar(
                      backgroundColor: colorScheme(context).outline,
                      radius: width * 0.02,
                      child: Center(
                          child: Icon(
                        Icons.person,
                        size: width * 0.02,
                      )),
                    ),
                    SizedBox(width: width * 0.01),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            width: width * 0.025, AppIcons.chevronDownIcon)),
                    SizedBox(width: width * 0.02),
                  ],
                ),
              ),
              Expanded(
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, child) {
                    return _screens[provider.selectedIndex];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
