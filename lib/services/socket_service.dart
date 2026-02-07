import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  late WebSocketChannel channel;

  void connect(String username) {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.2.2:8000/ws/$username'),
    );
  }

  void sendMessage(String to, String message) {
    channel.sink.add(jsonEncode({
      "to": to,
      "message": message,
    }));
  }

  Stream get messages => channel.stream;

  void disconnect() {
    channel.sink.close();
  }
}
