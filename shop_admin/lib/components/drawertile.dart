import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerListTile extends StatefulWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.subtitle,
    required this.press,
    this.selected = false,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback press;

  bool selected;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.selected != false ? Colors.red : kwhite;
    return ListTile(
      onTap: () {
        print("clicked");

        setState(() {
          print("set statee");
          widget.selected = !widget.selected;
          print("current ${widget.selected}");
        });

        widget.press();
      },
      // horizontalTitleGap: 0.0,
      // leading: Icon(Icons.radar),
      leading: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: widget.selected
            ? AlwaysStoppedAnimation(1)
            : AlwaysStoppedAnimation(0),
      ),
      subtitle: Text(
        widget.subtitle,
        style: ralewayStyle.copyWith(
          fontSize: 15.0,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      title: Text(
        widget.title,
        style: ralewayStyle.copyWith(
          fontSize: 30.0,
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
