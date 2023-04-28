import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_admin/mysql.dart';
import 'package:shop_admin/pages/controllpanel.dart';
import '../api.dart';
import '../components/logintextfield.dart';
import 'package:http/http.dart' as https;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  final db = Mysql();
  String email = "", password = "";

  Future<void> signIn() async {
    try {
      final String email = emailcontroller.text.trim();
      final String password = passwordcontroller.text.trim();
      final Map<String, String> body = {'email': email, 'password': password};

      final res = await https.post(
        Uri.parse(kSignInUrl),
        headers: kHeaders,
        body: jsonEncode(body),
      );

      final Map<String, dynamic> response = jsonDecode(res.body);

      if (response['success']) {
        // Navigate to next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ControllPanel()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: LoginTextField(
                      onChange: (value) {
                        email = value;
                      },
                      controller: emailcontroller,
                      hinttext: "Email Addess",
                      labelText: "Your Email...",
                      hidetext: false,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: LoginTextField(
                      onChange: (value) {
                        password = value;
                      },
                      controller: passwordcontroller,
                      hinttext: "Password",
                      labelText: "Your password...",
                      hidetext: false,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        signIn();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
