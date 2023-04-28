import 'package:flutter/material.dart';

import '../components/drawertile.dart';
import 'beacon_detail.dart';

class ControllPanel extends StatefulWidget {
  const ControllPanel({super.key});

  @override
  State<ControllPanel> createState() => _ControllPanelState();
}

class _ControllPanelState extends State<ControllPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: sideBar(),
            ),
            Expanded(
              flex: 5,
              child: BeaconDashboard(),
            ),
          ],
        ),
      ),
    );
  }
}

class sideBar extends StatelessWidget {
  const sideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            // child: Container(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const ProfileImg(),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 25.0, left: 10.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "USER",
            //               style: GoogleFonts.roboto(
            //                   fontSize: 20.0, fontWeight: FontWeight.w500),
            //             ),
            //             Text(
            //               "UID:1023945",
            //               style: GoogleFonts.roboto(fontSize: 10.0),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            child: Image.asset(
              "assets/logo.png",
              cacheHeight: 300,
            ),
          ),
          //add parameter here
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>
                  DrawerListTile(title: "Beacon ${index}", press: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
