import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/bidding/pages/bidding_screen.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard/pages/dash_board_screen.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/model/dashboard_model.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/provider/dashboard_provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/product_screen.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/earnings/pages/earning.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/products/pages/show_all_products.dart';
import 'package:whole_sellex_selleradmin_pannel/src/schedule/model/schedule.dart';
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
    const DashBoardScreen(), // 0: Dashboard
    ProductFormScreen(), // 1: Add Product
   Productsschedule() ,// 2: Schedule Product
    ShowAllProducts(), // 3: All Products
    BiddingScreen(), // 4: All Biddings
    EarningScreen(), // 5: Earnings
    Container(), // 6: Pending Order
    Container(), // 7: Cancel Orders
    Container(), // 8: Completed Orderaa
    Container(), // 9: Customers
    Container(), //10: Discount
    Container(), //11: Notification Settings
    Container(), //12: Payment Methods
    Container(), //13: Profile Settings
    Container(), //14: Change Password
    Container(), //15: Set Profile
    Container(), //16: Help and Supports
    Container(), //17: Logout
  ];

  String _getAppBarTitle(int index) {
    if (index == 0) return 'Dashboard';
    if (index >= 1 && index <= 5) return 'Products';
    if (index >= 6 && index <= 8) return 'Orders';
    if (index == 9) return 'Customers';
    if (index == 10) return 'Discount';
    if (index >= 11 && index <= 15) return 'Settings';
    if (index == 16) return 'Help and Supports';
    if (index == 17) return 'Logout';
    return 'Dashboard';
  }

  int _getIndexForEntry(String title) {
    switch (title) {
      case "Dashboard":
        return 0;
      case "Add Product":
        return 1;
      case "Schdule Product":
      case "Schedule Product":
        return 2;
      case "All Products":
        return 3;
      case "All Biddinngs":
        return 4;
      case "Earnings":
        return 5;
      case "Pending Order":
        return 6;
      case "Cancel Orders":
        return 7;
      case "Completed order":
        return 8;
      case "Customers":
        return 9;
      case "Discount":
        return 10;
      case "Notification Settings":
        return 11;
      case "Payment Methods":
        return 12;
      case "Profile Settings":
        return 13;
      case "Change Password":
        return 14;
      case "Set Profile":
        return 15;
      case "Help and Supports":
        return 16;
      case "Logout":
        return 17;
      default:
        return 0;
    }
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
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImages.logo),
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
                          ..._buildNavigationItems(context),
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
                                            fontWeight: FontWeight.w400));
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
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.menu),
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
                      ..._buildTabletNavigationItems(context),
                    ],
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
                    ),
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
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu),
                        const SizedBox(width: 10),
                        Text(
                          "WholeSellex",
                          style: textTheme(context).bodyMedium?.copyWith(
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
                        ..._buildMobileNavigationItems(context),
                      ],
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
                    SizedBox(width: width * 0.02),
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
                    SizedBox(width: width * 0.01),
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

  List<Widget> _buildNavigationItems(BuildContext context) {
    return data.map((entry) {
      if (entry.children!.isEmpty) {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            // You'll need to map these to the correct indices
            int index = _getIndexForEntry(entry.title!);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  color: provider.selectedIndex == index
                      ? colorScheme(context).primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text(
                  entry.title!,
                  style: textTheme(context).labelMedium?.copyWith(
                        color: provider.selectedIndex == index
                            ? colorScheme(context).onPrimary
                            : colorScheme(context).outlineVariant,
                      ),
                ),
              ),
              onTap: () {
                provider.setSelectedIndex(index);
              },
            );
          },
        );
      } else {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            return ExpansionTile(
              // tilePadding: EdgeInsets.zero,
              title: Text(
                entry.title!,
                style: textTheme(context).labelMedium?.copyWith(
                      color: colorScheme(context).outlineVariant,
                    ),
              ),
              children: entry.children!.map((childEntry) {
                int index = _getIndexForEntry(childEntry.title!);
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: provider.selectedIndex == index
                          ? colorScheme(context).primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Text(
                      childEntry.title!,
                      style: textTheme(context).labelMedium?.copyWith(
                            color: provider.selectedIndex == index
                                ? colorScheme(context).onPrimary
                                : colorScheme(context).outlineVariant,
                          ),
                    ),
                  ),
                  onTap: () {
                    provider.setSelectedIndex(index);
                  },
                );
              }).toList(),
            );
          },
        );
      }
    }).toList();
  }

  List<Widget> _buildMobileNavigationItems(BuildContext context) {
    return data.map((entry) {
      if (entry.children!.isEmpty) {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            int index = _getIndexForEntry(entry.title!);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  color: provider.selectedIndex == index
                      ? colorScheme(context).primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text(
                  entry.title!,
                  style: textTheme(context).bodyMedium?.copyWith(
                        color: provider.selectedIndex == index
                            ? colorScheme(context).onPrimary
                            : colorScheme(context).outlineVariant,
                      ),
                ),
              ),
              onTap: () {
                provider.setSelectedIndex(index);
                Navigator.pop(context); // Close the drawer
              },
            );
          },
        );
      } else {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            return ExpansionTile(
              title: Text(
                entry.title!,
                style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).outlineVariant,
                    ),
              ),
              children: entry.children!.map((childEntry) {
                int index = _getIndexForEntry(childEntry.title!);
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: provider.selectedIndex == index
                          ? colorScheme(context).primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Text(
                      childEntry.title!,
                      style: textTheme(context).bodyMedium?.copyWith(
                            color: provider.selectedIndex == index
                                ? colorScheme(context).onPrimary
                                : colorScheme(context).outlineVariant,
                          ),
                    ),
                  ),
                  onTap: () {
                    provider.setSelectedIndex(index);
                    Navigator.pop(context); // Close the drawer
                  },
                );
              }).toList(),
            );
          },
        );
      }
    }).toList();
  }

  List<Widget> _buildTabletNavigationItems(BuildContext context) {
    return data.map((entry) {
      if (entry.children!.isEmpty) {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            int index = _getIndexForEntry(entry.title!);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  color: provider.selectedIndex == index
                      ? colorScheme(context).primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text(
                  entry.title!,
                  style: textTheme(context).labelLarge?.copyWith(
                        color: provider.selectedIndex == index
                            ? colorScheme(context).onPrimary
                            : colorScheme(context).outlineVariant,
                      ),
                ),
              ),
              onTap: () {
                provider.setSelectedIndex(index);
                Navigator.pop(context);
              },
            );
          },
        );
      } else {
        return Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            return ExpansionTile(
              title: Text(
                entry.title!,
                style: textTheme(context).labelLarge?.copyWith(
                      color: colorScheme(context).outlineVariant,
                    ),
              ),
              children: entry.children!.map((childEntry) {
                int index = _getIndexForEntry(childEntry.title!);
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: provider.selectedIndex == index
                          ? colorScheme(context).primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Text(
                      childEntry.title!,
                      style: textTheme(context).labelLarge?.copyWith(
                            color: provider.selectedIndex == index
                                ? colorScheme(context).onPrimary
                                : colorScheme(context).outlineVariant,
                          ),
                    ),
                  ),
                  onTap: () {
                    provider.setSelectedIndex(index);
                    Navigator.pop(context); // Close the drawer
                  },
                );
              }).toList(),
            );
          },
        );
      }
    }).toList();
  }
}
