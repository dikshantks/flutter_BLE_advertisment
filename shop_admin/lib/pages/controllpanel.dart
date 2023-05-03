import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/constants.dart';
import 'package:shop_admin/models/admin.dart';
import 'package:shop_admin/pages/dashboard.dart';
import 'package:shop_admin/providers/admin_provider.dart';
import 'package:shop_admin/providers/beacon_provider.dart';
import 'package:shop_admin/providers/drawer_provider.dart';
import 'package:shop_admin/responsive.dart';

import '../components/drawertile.dart';
import '../models/beacons.dart';
import 'beacon_detail.dart';

class ControllPanel extends StatefulWidget {
  const ControllPanel({super.key});

  @override
  State<ControllPanel> createState() => _ControllPanelState();
}

class _ControllPanelState extends State<ControllPanel> {
  @override
  Widget build(BuildContext context) {
    final selectedBeacon = Provider.of<BeaconProvider>(context).selectedBeacon;

    final userprovider = Provider.of<AdminProvider>(context, listen: false);
    Admin current = userprovider.admin!;

    BeaconProvider.getBeacons(context, current.adminid);

    final List<Beacon> beacons = Provider.of<BeaconProvider>(context).beacons;
    return Scaffold(
      drawer: SideBar(beacons: beacons),
      key: context.read<ContrllerProvider>().Scaffoldkey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 2,
                child: SideBar(
                  beacons: beacons,
                ),
              ),
            Expanded(
              flex: 7,
              child: selectedBeacon != null ? BeaconDashboard() : const HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  SideBar({
    super.key,
    required this.beacons,
  });

  final List<Beacon> beacons;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblack,
      child: Column(
        children: [
          DrawerHeader(
            child: InkWell(
              onTap: () {
                Provider.of<BeaconProvider>(context, listen: false)
                    .selectBeacon(null);
              },
              child: Image.asset(
                "assets/logo.jpeg",
                cacheHeight: 400,
                colorBlendMode: BlendMode.multiply,
              ),
            ),
          ),
          // add parameter here
          Flexible(
            child: ListView.builder(
              itemCount: beacons.length,
              itemBuilder: (context, index) => DrawerListTile(
                title: beacons[index].beaconName,
                subtitle: "UID: ${beacons[index].beaconId}",
                press: () {
                  Provider.of<BeaconProvider>(context, listen: false)
                      .selectBeacon(
                    beacons[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SideBar extends StatefulWidget {
//   const SideBar({
//     super.key,
//   });

//   @override
//   State<SideBar> createState() => _SideBarState();
// }

// class _SideBarState extends State<SideBar> {
//   Future<List<Beacon>> _fetchBeacons() async {
//     final BuildContext context = this.context;
//     final userprovider = Provider.of<AdminProvider>(context, listen: false);
//     Admin current = userprovider.admin!;
//     await BeaconProvider.getBeacons(context, current.adminid);
//     final List<Beacon> beacons =
//         Provider.of<BeaconProvider>(context, listen: false).beacons;
//     return beacons;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: kblack,
//       child: Column(
//         children: [
//           DrawerHeader(
//             child: InkWell(
//               onTap: () {
//                 Provider.of<BeaconProvider>(context, listen: false)
//                     .selectBeacon(null);
//               },
//               child: Image.asset(
//                 "assets/logo.jpeg",
//                 cacheHeight: 400,
//                 colorBlendMode: BlendMode.multiply,
//               ),
//             ),
//           ),
//           Flexible(
//             child: FutureBuilder<List<Beacon>>(
//               future: _fetchBeacons(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final beacons = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: beacons.length,
//                     itemBuilder: (context, index) => DrawerListTile(
//                       title: beacons[index].beaconName,
//                       subtitle: "UID: ${beacons[index].beaconId}",
//                       press: () {
//                         Provider.of<BeaconProvider>(context, listen: false)
//                             .selectBeacon(
//                           beacons[index],
//                         );
//                       },
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text("An error occurred");
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
