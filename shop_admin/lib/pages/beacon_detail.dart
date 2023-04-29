import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/api.dart';
import 'package:shop_admin/components/logintextfield.dart';
import 'package:shop_admin/models/admin.dart';
import 'package:shop_admin/models/beacons.dart';
import 'package:shop_admin/providers/admin_provider.dart';
import 'package:shop_admin/providers/beacon_provider.dart';

import '../constants.dart';

import 'package:http/http.dart' as http;

class BeaconDashboard extends StatefulWidget {
  BeaconDashboard({
    super.key,
  });

  @override
  State<BeaconDashboard> createState() => _BeaconDashboardState();
}

class _BeaconDashboardState extends State<BeaconDashboard> {
  var nameController = TextEditingController();

  var headingController = TextEditingController();

  var offerController = TextEditingController();

  var urlController = TextEditingController();

  Future<void> update(int beaconId) async {
    final BuildContext context = this.context;
    Admin admin = Provider.of<AdminProvider>(context, listen: false).admin!;

    try {
      // final String name = name.text.trim();
      // final String heading= passwordcontroller.text.trim();

      final String name = nameController.text;
      final String heading = headingController.text;
      final String offer = offerController.text;
      final String web = urlController.text.trim();
      final Map<String, dynamic> body = {
        'admin_id': admin.adminid,
        'beacon_id': beaconId,
        'beacon_name': name,
        'heading': heading,
        'offers': offer,
        'url': web,
      };

      final res = await http.post(
        Uri.parse(KUpdateBeacon),
        headers: kHeaders,
        body: jsonEncode(body),
      );

      var response = jsonDecode(res.body);

      if (response['error'] == null) {
        print(response);
        // return null;
      } else {
        print(response['error']);
      }
    } catch (e) {
      print(e);
    }

    // return "error occured please try again ";
  }

  // Future<void> updateBeacon(
  @override
  Widget build(BuildContext context) {
    Beacon selectedBeacon =
        Provider.of<BeaconProvider>(context, listen: false).selectedBeacon!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BEACON ID: ${selectedBeacon.beaconId} ",
                  style: GoogleFonts.roboto(
                    fontSize: 25.0,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "FOOTFALL: 23 ",
                  style: GoogleFonts.roboto(
                    fontSize: 25.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LoginTextField(
                            hinttext: "one",
                            labelText: "one",
                            hidetext: false,
                            controller: nameController,
                            onChange: (value) {},
                          ),
                          LoginTextField(
                            hinttext: "one",
                            labelText: "one",
                            hidetext: false,
                            controller: headingController,
                            onChange: (value) {},
                          ),
                          LoginTextField(
                            hinttext: "one",
                            labelText: "one",
                            hidetext: false,
                            controller: offerController,
                            onChange: (value) {},
                          ),
                          LoginTextField(
                            hinttext: "one",
                            labelText: "one",
                            hidetext: false,
                            controller: urlController,
                            onChange: (value) {},
                          ),
                          ElevatedButton(
                            onPressed: () {
                              update(selectedBeacon.beaconId);
                            },
                            child: Text("updateit"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white38,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class formthing extends StatelessWidget {
//   formthing({
//     super.key,
//     required this.hinttext,
//     required this.labelText,
//     required this.controller,
//   });

//   String hinttext;
//   String labelText;
//   TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20.0),
//       child: Row(
//         children: [
//           Text(
//             "NAME",
//             style: GoogleFonts.roboto(fontSize: 30.0),
//           ),
//           SizedBox(
//             width: 100,
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.2,
//             child: LoginTextField(
//               onChange: (value) {
//                 controller.text = value;
//               },
//               controller: controller,
//               hinttext: hinttext,
//               labelText: labelText,
//               hidetext: false,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
