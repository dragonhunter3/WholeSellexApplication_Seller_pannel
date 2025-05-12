import 'package:flutter/material.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => ResponsiveLayout(
          mobileLayout: SingleChildScrollView(
              child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorScheme(context).primary,
                    child: Icon(Icons.notifications,
                        color: colorScheme(context).onPrimary),
                  ),
                  title: Text(
                    "First Notification",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Thanks For creating account",
                      style: textTheme(context).bodySmall),
                ),
              );
            },
          )),
          tabletLayout: SingleChildScrollView(
              child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorScheme(context).primary,
                    child: Icon(Icons.notifications,
                        color: colorScheme(context).onPrimary),
                  ),
                  title: Text(
                    "First Notification",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Thanks For creating account",
                      style: textTheme(context).bodySmall),
                ),
              );
            },
          )),
          desktopLayout: SingleChildScrollView(
              child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorScheme(context).primary,
                    child: Icon(Icons.notifications,
                        color: colorScheme(context).onPrimary),
                  ),
                  title: Text(
                    "First Notification",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Thanks For creating account",
                      style: textTheme(context).bodySmall),
                ),
              );
            },
          ))),
    ));
  }
}
