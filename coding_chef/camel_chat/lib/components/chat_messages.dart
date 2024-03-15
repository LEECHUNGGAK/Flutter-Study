import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats2').snapshots(),
      builder: ((context, snapshot) {

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
          itemCount: docs.length,
          itemBuilder: ((context, index) {
            return Text(docs[index]['content']);
          }),
        );
      }),
    );
  }
}
