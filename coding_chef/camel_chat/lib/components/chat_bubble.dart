import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messageContent;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.messageContent,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe
                ? colorScheme.primaryContainer
                : colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12.0),
              topRight: const Radius.circular(12.0),
              bottomLeft: isMe ? const Radius.circular(12.0) : const Radius.circular(0.0),
              bottomRight: isMe ? const Radius.circular(0.0) : const Radius.circular(12.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          width: 180.0,
          child: Text(
            messageContent,
            style: TextStyle(
              color: isMe
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
