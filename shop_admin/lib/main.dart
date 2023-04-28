import 'package:flutter/material.dart';
import 'package:shop_admin/pages/loginscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
