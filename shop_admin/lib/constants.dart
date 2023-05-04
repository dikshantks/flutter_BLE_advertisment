import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kprimary = Color(0xff42BEA5);
const ksecondary = Color(0xff359F8A);
const kptext = Color(0xff1A1F24);
const kstext = Color(0xff95A1AC);

const kblack = Color(0xff1A1F24);
const kblack2 = Color.fromARGB(255, 31, 48, 65);
const kwhite = Color.fromARGB(202, 236, 236, 236);

const blueDarkColor = Color(0xff252B5C);

const Color textColor = Color.fromARGB(255, 22, 33, 109);
const Color greyColor = Color(0xffAAAAAA);
const defaultPadding = 20.0;
TextStyle ralewayStyle = GoogleFonts.raleway();

BoxDecoration neumorphic = BoxDecoration(
  color: kblack.withAlpha(245),
  borderRadius: BorderRadius.circular(30),
  boxShadow: [
    BoxShadow(
      // color: Colors.grey.shade900,
      color: Colors.black.withOpacity(0.1),

      offset: Offset(-6, -6),
      blurRadius: 20,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: Offset(6, 6),
      blurRadius: 10,
      spreadRadius: 1,
    ),
  ],
);
