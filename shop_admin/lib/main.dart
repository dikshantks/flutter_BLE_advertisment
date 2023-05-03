import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/pages/loginscreen.dart';
import 'package:shop_admin/providers/admin_provider.dart';
import 'package:shop_admin/providers/beacon_provider.dart';
import 'package:shop_admin/providers/drawer_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BeaconProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContrllerProvider(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'beacon admin database',
        theme: ThemeData.dark().copyWith(
            scrollbarTheme: const ScrollbarThemeData()
                .copyWith(thickness: MaterialStatePropertyAll(0))),
        home: const LoginScreen(),
      ),
    );
  }
}
