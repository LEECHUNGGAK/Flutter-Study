import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String messageContent = '';
  final user = FirebaseAuth.instance.currentUser;

  void sendMessage() {
    FocusScope.of(context).unfocus();

    FirebaseFirestore.instance.collection('chats').add({
      'userID': user!.uid,
      'sending_date': Timestamp.now(),
      'content': messageContent,
    });

    controller.clear();
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Send a message'),
              onChanged: (value) {
                setState(() {
                  messageContent = value;
                });
              },
              maxLines: null,
            ),
          ),
          IconButton(
            onPressed: messageContent.trim().isEmpty ? null : sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
