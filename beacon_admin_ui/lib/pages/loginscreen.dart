import 'dart:async';

import 'package:beacon_admin_ui/components/logintextfield.dart';
import 'package:beacon_admin_ui/constants.dart';
import 'package:beacon_admin_ui/pages/controllpanel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();

    void _doSomething() async {
      Timer(Duration(seconds: 1), () {
        _btnController.success();
      });

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ControllPanel(),
        ),
      );
    }

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
                  LoginTextField(
                    hinttext: "Email Address",
                    labelText: "Your Email...",
                    hidetext: false,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  LoginTextField(
                    hinttext: "Password",
                    labelText: "Your password...",
                    hidetext: true,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  RoundedLoadingButton(
                      child: Text("Login"),
                      controller: _btnController,
                      onPressed: _doSomething),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
