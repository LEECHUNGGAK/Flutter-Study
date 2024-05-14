import 'package:camel_chat/components/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatMessages extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .orderBy(
            'sending_date',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return const Text('There is not message!');
        }

        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: ((context, index) {
            return ChatBubble(
              isMe: docs[index]['userID'] == user!.uid,
              messageContent: docs[index]['content'],
            );
          }),
        );
      },
    );
  }
}
