import 'package:flutter/material.dart';

class ContrllerProvider with ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffholdkey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get Scaffoldkey => _scaffholdkey;

  void controlMenu() {
    if (!_scaffholdkey.currentState!.isDrawerOpen) {
      _scaffholdkey.currentState!.openDrawer();
    }
  }
}
