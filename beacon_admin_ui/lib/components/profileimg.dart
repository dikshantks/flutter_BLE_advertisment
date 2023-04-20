import 'package:flutter/material.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(5),
        child: Container(
          width: 65.00,
          height: 65.00,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/one.jpeg"),
        ),
      ),
    );
  }
}
