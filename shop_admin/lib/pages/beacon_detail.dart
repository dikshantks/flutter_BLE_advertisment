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
import 'package:shop_admin/providers/drawer_provider.dart';
import 'package:shop_admin/responsive.dart';

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
      child: Container(
        color: kblack.withAlpha(230),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isMobile(context))
                SizedBox(
                  height: 20.0,
                ),
              if (Responsive.isMobile(context))
                IconButton(
                  onPressed: context.read<ContrllerProvider>().controlMenu,
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BEACON ID: ${selectedBeacon.beaconId}",
                    style: ralewayStyle.copyWith(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "FOOTFALL: ${selectedBeacon.footfall}",
                    style: ralewayStyle.copyWith(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              Flexible(
                child: Container(
                  padding: Responsive.isMobile(context)
                      ? EdgeInsets.all(0)
                      : EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.amber,
                          height: MediaQuery.of(context).size.height * .9,
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DataTable(
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        "Fields",
                                        style: ralewayStyle.copyWith(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Input",
                                        style: ralewayStyle.copyWith(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Previous Data",
                                        style: ralewayStyle.copyWith(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                  //data row
                                  rows: [
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            "Name",
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          TextFormField(
                                            controller: nameController,
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            selectedBeacon.beaconName,
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            "Heading",
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          TextFormField(
                                            controller: headingController,
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            selectedBeacon.heading!,
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            "Offers",
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          TextFormField(
                                            controller: offerController,
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            selectedBeacon.offers == null
                                                ? ""
                                                : selectedBeacon.offers!,
                                            style: ralewayStyle.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            'Website',
                                            style: ralewayStyle.copyWith(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          Formfield(
                                            width: 100.0,
                                            controller: urlController,
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            selectedBeacon.url == null
                                                ? "not setted"
                                                : selectedBeacon.url!,
                                            style: ralewayStyle.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  widthFactor: 10.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 40.0, bottom: 20.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          update(selectedBeacon.beaconId);
                                        },
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Ink(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0, vertical: 16.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            color: Colors.blue.withGreen(100),
                                          ),
                                          child: Text(
                                            'Update details',
                                            style: ralewayStyle.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: kwhite,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: Container(
                            color: Colors.white38,
                            child: Image.asset("assets/five.jpeg"),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
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

class Formfield extends StatelessWidget {
  const Formfield({
    super.key,
    required this.width,
    required this.controller,
  });

  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: kblack2,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(left: 6.0, bottom: 5.0, right: 6.0),
          hintText: 'enter details',
          hintStyle: ralewayStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: kwhite.withOpacity(0.2),
            fontSize: 18.0,
          ),
        ),
        style: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: kwhite.withOpacity(0.8),
          fontSize: 18.0,
        ),
      ),
    );
  }
}
