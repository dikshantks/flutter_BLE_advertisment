import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  LoginTextField(
      {super.key,
      required this.hinttext,
      required this.labelText,
      required this.hidetext});

  String hinttext;
  String labelText;

  bool hidetext;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hidetext,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hinttext,
        hintStyle: GoogleFonts.roboto(
          color: const Color(0x9AFFFFFF),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: kprimary,
        prefixIcon: Icon(
          widget.hidetext ? Icons.lock_outline_rounded : Icons.email_outlined,
          color: Colors.green,
        ),
      ),
      style: GoogleFonts.roboto(),
      keyboardType:
          widget.hidetext ? TextInputType.text : TextInputType.emailAddress,
    );
  }
}
