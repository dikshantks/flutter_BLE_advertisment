import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/constants.dart';
import 'package:shop_admin/models/admin.dart';
import 'package:shop_admin/pages/dashboard.dart';
import 'package:shop_admin/providers/admin_provider.dart';
import 'package:shop_admin/providers/beacon_provider.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: sideBar(),
            ),
            Expanded(
              flex: 7,
              child: selectedBeacon != null ? BeaconDashboard() : HomePage(),
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
    final userprovider = Provider.of<AdminProvider>(context, listen: false);
    Admin current = userprovider.admin!;

    BeaconProvider.getBeacons(context, current.adminid);

    final List<Beacon> beacons = Provider.of<BeaconProvider>(context).beacons;

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
          //add parameter here
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
