// import 'package:flutter/material.dart';

// class BeaconPage extends StatefulWidget {
//   @override
//   _BeaconPageState createState() => _BeaconPageState();
// }

// class _BeaconPageState extends State<BeaconPage> {
//   final _formKey = GlobalKey<FormState>();
//   final beaconController = TextEditingController();
//   int beaconCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beacons'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: beaconController,
//                 decoration: InputDecoration(
//                   labelText: 'Number of Beacons',
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the number of beacons';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     setState(() {
//                       beaconCount = int.parse(beaconController.text);
//                     });
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 16.0),
//               Text('Number of Beacons: $beaconCount'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
