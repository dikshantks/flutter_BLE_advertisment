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
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: Row(
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
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }
}
