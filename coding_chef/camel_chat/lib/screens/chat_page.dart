import 'package:camel_chat/components/chat_messages.dart';
import 'package:camel_chat/components/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  final _auth = FirebaseAuth.instance;

  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            onPressed: () {
              widget._auth.signOut();
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          const NewMessage(),
        ],
      ),
    );
  }
}
