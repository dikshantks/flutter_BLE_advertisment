import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: kprimary,
      focusColor: Colors.white38,
      onTap: press,
      // horizontalTitleGap: 0.0,
      leading: Image.asset("assets/one.jpeg"),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.white54),
      ),
    );
  }
}
