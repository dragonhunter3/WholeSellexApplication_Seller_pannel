import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/settings/controller/notification_provider.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  List<String> items = [
    "Product updates and community announcement",
    "Market Newsletter",
    "Comments",
    "Purchases",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
              mobileLayout: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notificatons",
                      style: textTheme(context)
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Consumer<NotificationProvider>(
                      builder: (context, switchProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customTile(
                                items[index],
                                switchProvider.getSwitchValue(index),
                                (value) {
                                  switchProvider.toggleSwitch(index, value);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              tabletLayout: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notificatons",
                      style: textTheme(context)
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Consumer<NotificationProvider>(
                      builder: (context, switchProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customTile(
                                items[index],
                                switchProvider.getSwitchValue(index),
                                (value) {
                                  switchProvider.toggleSwitch(index, value);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              desktopLayout: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notificatons",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Consumer<NotificationProvider>(
                      builder: (context, switchProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customTile(
                                items[index],
                                switchProvider.getSwitchValue(index),
                                (value) {
                                  switchProvider.toggleSwitch(index, value);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget customTile(String title, bool value, ValueChanged<bool> onChanged) {
    final width = MediaQuery.of(context).size.width;
    TextStyle? textStyle;
    double? size;
    if (width < 600) {
      textStyle = textTheme(context).bodySmall;
      size = 0.5;
    } else if (width < 1024) {
      textStyle = textTheme(context).labelLarge;
      size = 0.5;
    } else {
      textStyle = textTheme(context).labelMedium;
      size = 0.7;
    }
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: textStyle?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Transform.scale(
          scale: size,
          child: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
