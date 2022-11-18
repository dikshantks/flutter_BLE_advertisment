// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_ads/datt.dart';
import 'package:flutter_bluetooth_ads/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'device.dart';
import 'firebase_options.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    flutterLocalNotificationsPlugin;
void main() async {
  // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  WidgetsFlutterBinding.ensureInitialized();

  // NotificationService().initNotification();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FlutterBlueApp());
}

class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: welcome(),
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return welcome();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}
