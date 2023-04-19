import 'package:flutter/material.dart';

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
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
