import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shop_admin/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          height: 300.0,
                          width: 600.0,
                          decoration: neumorphic,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                    'https://www.gograph.com/vector-clip-art/random.html'),
                                radius: 50,
                              )
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
                Container(
                  color: kprimary,
                  width: 1000.0,
                  height: 400.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 300.0,
                          width: 300.0,
                          color: kwhite,
                        ),
                        Container(
                          color: kwhite,
                          height: 300.0,
                          width: 300.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
