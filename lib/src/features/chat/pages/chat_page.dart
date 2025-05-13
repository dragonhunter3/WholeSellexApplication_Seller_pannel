import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/chat/controller/select_user.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/chat/widgets/chat_room.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    final chatProvider = Provider.of<SelectUser>(context);
    final selectedUser = chatProvider.selectedUser;
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) => ResponsiveLayout(
                  mobileLayout: Container(),
                  tabletLayout: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  final userName = 'User ';
                                  return GestureDetector(
                                    onTap: () {
                                      chatProvider.selectUser(userName);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(AppImages.game),
                                      ),
                                      title: Text(
                                        userName,
                                        style: textTheme(context).labelLarge,
                                      ),
                                      subtitle: Text("Hey, how are you?",
                                          style:
                                              textTheme(context).labelMedium),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 4,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: selectedUser == null
                                  ? const Center(
                                      child: Text(
                                        "Click on any user to open chat!",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  : ChatRoomScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  desktopLayout: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  final userName = 'User ';
                                  return GestureDetector(
                                    onTap: () {
                                      chatProvider.selectUser(userName);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(AppImages.game),
                                      ),
                                      title: Text(
                                        userName,
                                        style: textTheme(context).labelLarge,
                                      ),
                                      subtitle: Text("Hey, how are you?",
                                          style:
                                              textTheme(context).labelMedium),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 4,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: selectedUser == null
                                  ? const Center(
                                      child: Text(
                                        "Click on any user to open chat!",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  : ChatRoomScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
