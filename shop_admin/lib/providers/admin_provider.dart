import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/admin.dart';

class AdminProvider extends ChangeNotifier {
  Admin? _admin;

  Admin? get admin => _admin;

  void setAdmin(Admin admin) {
    _admin = admin;
    notifyListeners();
  }


  static void setAdminFromJson(BuildContext context, Map<String, dynamic> json) {
    final Admin admin = Admin.fromjson(json);
    Provider.of<AdminProvider>(context, listen: false).setAdmin(admin);
  }

}
