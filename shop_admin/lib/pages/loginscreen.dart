import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_admin/pages/controllpanel.dart';
import '../api.dart';
import '../components/logintextfield.dart';
import 'package:http/http.dart' as https;

import '../providers/admin_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  String email = "", password = "";

  Future<String?> signIn() async {
    final BuildContext context = this.context;

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
        print(response);
        AdminProvider.setAdminFromJson(context, response);
        return null;
      } else {
        return response['message'];
      }
    } catch (e) {
      print(e);
    }

    return "error occured please try again ";
  }

  void signInAndNavigate() {
    // Store a reference to the BuildContext
    final BuildContext context = this.context;

    // Call the signIn function and wait for it to complete
    signIn().then((String? error) {
      if (error == null) {
        // Navigate to next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ControllPanel()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error,
            ),
          ),
        );
      }
    });
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
                    onPressed: signInAndNavigate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
