import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NRApp());
}

class NRApp extends StatelessWidget {
  const NRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NRApp',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
