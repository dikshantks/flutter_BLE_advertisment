import 'package:beacon_admin_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              height: 30.0,
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
            Flexible(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NEW NAME",
                              style: GoogleFonts.roboto(fontSize: 30.0),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
