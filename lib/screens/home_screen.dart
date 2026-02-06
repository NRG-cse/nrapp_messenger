import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // navy-like
        title: const Text(
          'NRApp',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('User ${index + 1}'),
            subtitle: const Text('Last message preview...'),
            trailing: const Text('12:45 PM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    username: 'User ${index + 1}',
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.chat),
        onPressed: () {},
      ),
    );
  }
}
