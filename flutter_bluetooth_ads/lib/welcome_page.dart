// ignore_for_file: camel_case_types

import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_ads/one.dart';
import 'package:flutter_bluetooth_ads/signin_provider.dart';
import 'package:provider/provider.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Virtual Tour",
            style: TextStyle(fontSize: 32.0),
          ),
          Container(
            // color: Colors.green,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
            width: MediaQuery.of(context).size.width,
            height: 200.00,
            child: InteractiveViewer(
                child: Image.asset(
              "assets/overture.png",
              fit: BoxFit.contain,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: _username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // ignore: use_build_context_synchronously
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: ((context) => FirstPage()),
          //       ),
          //     );
          //   },
          //   child: Text(
          //     "Explore",
          //   ), // chagne this
          // ),

          GoogleAuthButton(
            onPressed: () {
              final provider =
                  Provider.of<SigninProvider>(context, listen: false);
              provider.googleLogin();
            },
            style: const AuthButtonStyle(
              buttonColor: Color(0xff111417),
            ),
          ),
        ],
      ),
    ));
  }
}
