import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/constants.dart';

import '../models/admin.dart';
import '../models/beacons.dart';
import '../providers/admin_provider.dart';
import '../providers/beacon_provider.dart';
import '../providers/drawer_provider.dart';
import '../providers/scrollcontroller.dart';
import '../responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<AdminProvider>(context, listen: false);
    Admin current = userprovider.admin!;
    final Size = MediaQuery.of(context).size;

    // BeaconProvider.getBeacons(context, current.adminid);

    final List<Beacon> beacons = Provider.of<BeaconProvider>(context).beacons;
    return SafeArea(
      child: Container(
        height: Size.height,
        color: kblack.withAlpha(230),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isMobile(context))
                IconButton(
                  onPressed: context.read<ContrllerProvider>().controlMenu,
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              Text(
                "DASHBOARD",
                style: ralewayStyle.copyWith(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
              ),

              if (!Responsive.isMobile(context))
                const SizedBox(
                  height: 30.0,
                ),

              //container for 2 rows
              SizedBox(
                // width: 1000.0,
                height: 250.0,
                child: CustomScrollbarWithSingleChildScrollView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: Responsive.isMobile(context) ? 200 : 230.0,
                        width: Responsive.isMobile(context) ? 400.0 : 450,
                        decoration: neumorphic,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Admin Panel",
                              style: ralewayStyle.copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const profileImg(),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      current.name,
                                      style: ralewayStyle.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "UID: ${current.adminid}",
                                      style: ralewayStyle.copyWith(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      current.name,
                                      style: ralewayStyle.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        height: Responsive.isMobile(context) ? 200 : 230.0,
                        width: Responsive.isMobile(context) ? 400.0 : 450,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: neumorphic,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                // horizontalMargin: 0,
                                // columnSpacing: 10.0,
                                columns: const [
                                  DataColumn(
                                    label: Text("Fields"),
                                  ),
                                  DataColumn(
                                    label: Text("Input"),
                                  ),
                                  DataColumn(
                                    label: Text("Past data"),
                                  ),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          beacons.length.toString(),
                                          style: ralewayStyle.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Name",
                                          style: ralewayStyle.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Name",
                                          style: ralewayStyle.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class profileImg extends StatelessWidget {
  const profileImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 85.0,
          height: 85.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            "assets/logo.png",
            scale: 0.5,
          ),
        ),
      ),
    );
  }
}
