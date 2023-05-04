import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shop_admin/constants.dart';

import '../models/admin.dart';
import '../providers/admin_provider.dart';
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
    return SafeArea(
      child: Container(
        height: Size.height,
        color: kblack.withAlpha(230),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Container(
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
                const SizedBox(
                  height: 20.0,
                ),

                //container for 2 rows
                Container(
                  // color: kprimary,
                  width: 1300.0,
                  height: 400.0,
                  child: CustomScrollbarWithSingleChildScrollView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          height: 300.0,
                          width: 600.0,
                          decoration: neumorphic,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin Panel",
                                style: ralewayStyle.copyWith(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  profileImg(),
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
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          height: 300.0,
                          width: 600.0,
                          decoration: neumorphic,
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
    return Container(
      margin: const EdgeInsetsDirectional.all(20),
      width: 170.0,
      height: 170.0,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.all(
          Radius.circular(
            30,
          ),
        ),
      ),
      child: Image.asset(
        "assets/one.jpeg",
      ),
    );
  }
}
