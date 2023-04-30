import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shop_admin/constants.dart';
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
      return e.toString();
    }
  }

  void signInAndNavigate() {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(100),
                color: kptext,
                child: Center(
                  child: RiveAnimation.asset("assets/rives/login.riv"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                height: height,
                color: kwhite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let\'s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 30.0,
                                  color: blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: blueDarkColor,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Enter your details to get sign in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
                          style: ralewayStyle.copyWith(
                            fontSize: 20.0,
                            color: blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      EmailField(
                          width: width, emailcontroller: emailcontroller),
                      const SizedBox(height: 60.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: ralewayStyle.copyWith(
                            fontSize: 20.0,
                            color: blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      LoginField(
                          width: width, passwordcontroller: passwordcontroller),
                      const SizedBox(
                        height: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: signInAndNavigate,
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: textColor,
                              ),
                              child: Text(
                                'Sign In',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kwhite,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.width,
    required this.emailcontroller,
  });

  final double width;
  final TextEditingController emailcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: kwhite,
      ),
      child: TextFormField(
        controller: emailcontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: kptext,
          ),
          contentPadding: const EdgeInsets.only(top: 15.0),
          hintText: 'Enter Email',
          hintStyle: ralewayStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: blueDarkColor.withOpacity(0.5),
            fontSize: 18.0,
          ),
        ),
        style: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: blueDarkColor,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.width,
    required this.passwordcontroller,
  });

  final double width;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: kwhite,
      ),
      child: TextFormField(
        controller: passwordcontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.looks,
            color: kptext,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            color: kptext,
          ),
          contentPadding: const EdgeInsets.only(top: 15.0),
          hintText: 'Enter Pasword',
          hintStyle: ralewayStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: blueDarkColor.withOpacity(0.5),
            fontSize: 18.0,
          ),
        ),
        style: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: blueDarkColor,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
