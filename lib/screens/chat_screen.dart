import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String username;

  const ChatScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  'online',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.videocam),
          SizedBox(width: 16),
          Icon(Icons.call),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),

      /// CHAT BODY
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                senderBubble("Hello 👋"),
                receiverBubble("Hi! How are you?"),
                senderBubble("I'm working on NRApp 😎"),
                receiverBubble("Looks awesome 🔥"),
                senderBubble("WhatsApp-style UI done!"),
              ],
            ),
          ),

          /// MESSAGE INPUT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                const Icon(Icons.emoji_emotions_outlined),
                const SizedBox(width: 6),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// SENT MESSAGE
  Widget senderBubble(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message),
      ),
    );
  }

  /// RECEIVED MESSAGE
  Widget receiverBubble(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message),
      ),
    );
  }
}
