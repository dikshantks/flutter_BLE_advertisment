import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/api.dart';
import 'package:shop_admin/models/beacons.dart';

class BeaconProvider extends ChangeNotifier {
  Beacon? _selectedBeacon;
  Beacon? get selectedBeacon => _selectedBeacon;
  void selectBeacon(Beacon? beacon) {
    _selectedBeacon = beacon;
    notifyListeners();
  }

  List<Beacon> _beacons = [];
  List<Beacon> get beacons => _beacons;
  void setBeacons(List<Beacon> beacons) {
    _beacons = beacons;
    notifyListeners();
  }

  static Future<List<Beacon>> getBeacons(
      BuildContext context, int adminId) async {
    // Replace with the actual URL of your API
    // Create the request body
    final Map<String, int> body = {'admin_id': adminId};
    // Send a POST request to the API
    final res = await http.post(
      Uri.parse(KGetBeacon),
      headers: kHeaders,
      body: jsonEncode(body),
    );
    // Decode the JSON response
    final List<dynamic> response = jsonDecode(res.body);
    final List<Beacon> beacons =
        response.map((json) => Beacon.fromJson(json)).toList();

    Provider.of<BeaconProvider>(context, listen: false).setBeacons(beacons);

    return beacons;
  }
}
