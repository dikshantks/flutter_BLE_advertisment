import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  LoginTextField(
      {super.key,
      required this.hinttext,
      required this.labelText,
      required this.hidetext,
      required this.controller,
      required this.onChange,
      });

  String hinttext;
  String labelText;
  TextEditingController controller ;
  bool hidetext;


  ValueChanged<String>  onChange ; 

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChange
      ,    // write line 
      obscureText: widget.hidetext,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hinttext,
        hintStyle: GoogleFonts.roboto(
          color: Colors.white60,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black45,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.black12,
        prefixIcon: Icon(
          widget.hidetext ? Icons.lock_outline_rounded : Icons.email_outlined,
          color: Colors.white70,
        ),
      ),
      style: GoogleFonts.roboto(),
      keyboardType:
          widget.hidetext ? TextInputType.text : TextInputType.emailAddress,
    );
  }
}
