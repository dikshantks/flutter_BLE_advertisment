import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_admin/components/logintextfield.dart';

import '../constants.dart';

class BeaconDashboard extends StatelessWidget {
  const BeaconDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  "BEACON ID: PX34ASD123 ",
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
                          formthing(),
                          formthing(),
                          formthing(),
                          formthing(),
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

class formthing extends StatelessWidget {
  formthing({
    super.key,
  });

  final one = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Text(
            "NAME",
            style: GoogleFonts.roboto(fontSize: 30.0),
          ),
          SizedBox(
            width: 100,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: LoginTextField(
              onChange: (value){},
                controller: one,
                hinttext: "",
                labelText: "fgh",
                hidetext: false),
          )
        ],
      ),
    );
  }
}
