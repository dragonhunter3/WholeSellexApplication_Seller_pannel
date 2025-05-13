import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/chat/controller/chat_controller.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();

  Widget _buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isMe ? colorScheme(context).primary : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(10),
          ),
        ),
        child: Text(text,
            style: textTheme(context)
                .labelLarge
                ?.copyWith(color: isMe ? Colors.white : Colors.black)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.game),
            ),
            title: Text('Select User', style: textTheme(context).labelLarge),
            subtitle: Text(
              "1:30 PM",
              style: textTheme(context).labelMedium?.copyWith(
                    color: colorScheme(context).surface.withOpacity(0.4),
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final msg = chatProvider.messages[index];
                return _buildMessage(msg['text'], msg['isMe']);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _controller,
                    hint: "type any text",
                    hintSize: 16,
                    textStyle: textTheme(context).labelLarge,
                    borderColor: colorScheme(context).surface.withOpacity(0.4),
                    fillColor: colorScheme(context).onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    chatProvider.sendMessage(_controller.text);
                    _controller.clear();
                  },
                  child: CircleAvatar(
                      backgroundColor: colorScheme(context).primary,
                      child: Icon(Icons.send)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
