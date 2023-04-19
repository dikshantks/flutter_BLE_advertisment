import 'package:beacon_admin_ui/pages/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'beacon admin database',
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
