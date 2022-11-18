// ignore: non_constant_identifier_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_blue/flutter_blue.dart";
import 'package:flutter_blue/gen/flutterblue.pbjson.dart';
import 'package:flutter_bluetooth_ads/datt.dart';
import 'package:flutter_bluetooth_ads/localnotification.dart';
import 'package:flutter_bluetooth_ads/main.dart';
import 'package:timezone/timezone.dart' as tz;

import 'device.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  FirstPage({super.key, required this.user});
  String user;
  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  late final LocalNotificationService service;

  Future createdata({required ScanResult addData}) async {
    final docuser = FirebaseFirestore.instance.collection('data').doc();

    final json = {
      'device_name': addData.device.name,
      'ble': addData.rssi,
      'data': addData.device.id.toString(),
      'user': widget.user,
    };

    await docuser.set(json);
  }

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
    tz.initializeDatabase;
  }

  Map<String, Widget> one = {
    "Maingate": Maingate(),
    "ECE-Lab1": CR101(),
    "Sinusoid": CR202(),
  };
  Map<String, String> Panora_img = {
    "Maingate": "assets/oen.jpg",
    "ECE-Lab1": "assets/thomas-galler-8UDJ4sflous-unsplash.jpg",
    "Sinusoid": "assets/oen.jpg",
  };

  Map<String, bool> col = {
    'Maingate': false,
    'ECE-Lab1': false,
    'Sinusoid': false,
    "extra": false,
  };

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            const DrawerHeader(
              curve: Curves.bounceIn,
              child: Center(child: Text("BEACON \n MAP")),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                // color: Colors.amber,
                child: InteractiveViewer(
                  child: Stack(children: [
                    SizedBox(
                      // color: Colors.red,
                      width: 300.0,
                      height: 750.0,
                      child: Image.asset(
                        'assets/index.jpeg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 120.0,
                      left: 55.0,
                      child: Bigcircle(
                        name: "Maingate",
                        color: col['Maingate']! ? Colors.green : Colors.red,
                        hdri: Panora_img['Maingate']!,
                      ),
                    ),
                    Positioned(
                      right: 50.0,
                      bottom: 180.0,
                      child: Bigcircle(
                          name: "ECE-Lab1",
                          hdri: Panora_img['ECE-Lab1']!,
                          color: col["ECE-Lab1"]! ? Colors.green : Colors.red),
                    ),
                    Positioned(
                      left: 80.0,
                      bottom: 290.0,
                      child: Bigcircle(
                          name: "Sinusoid",
                          hdri: Panora_img['Sinusoid']!,
                          color: col["Sinusoid"]! ? Colors.green : Colors.red),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text("Hi,${widget.user}"),
        centerTitle: true,
      ),
      floatingActionButton: FloatButtn(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              initialData: [],
              builder: (context, snapshot) => Column(
                children: snapshot.data!.map((d) {
                  if (d.device.type == BluetoothDeviceType.le &&
                      d.rssi.abs() < 80) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => DeviceScreen(
                                  device: d.device,
                                  data: one[d.device.name]!,
                                )),
                          ),
                        );
                      },
                      child: ListTile(
                        title: d.device.type == BluetoothDeviceType.le
                            ? Text(d.device.name)
                            : Text(d.device.id.toString()),
                        leading: Text(d.rssi.toString()),
                        trailing: ElevatedButton(
                          child: Text("connect"),
                          onPressed: () async {
                            setState(() {
                              col[d.device.name] = true;
                            });

                            try {
                              d.device.connect();
                              createdata(addData: d);
                              await service.showNotification(
                                  id: 0,
                                  title: "connected",
                                  body:
                                      "you are connected to ${d.device.name}. \n EXPLORE!!!");
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => DeviceScreen(
                                        device: d.device,
                                        data: one.containsKey(d.device.name)
                                            ? one[d.device.name]!
                                            : Eror(),
                                      )),
                                ),
                              );
                            } on PlatformException catch (e) {
                              print(e);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              ),
            ),
            const Divider(
              indent: 10.0,
              endIndent: 10.0,
              height: 20.0,
              thickness: 1.0,
              color: Colors.black45,
            ),
            Connected(one: one),
          ],
        ),
      ),
    );
  }
}

class FloatButtn extends StatelessWidget {
  const FloatButtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: FlutterBlue.instance.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        if (snapshot.data ?? false) {
          return FloatingActionButton(
            onPressed: () => FlutterBlue.instance.stopScan(),
            backgroundColor: Colors.red,
            child: Icon(Icons.stop),
          );
        } else {
          return FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: () => FlutterBlue.instance.startScan(),
          );
        }
      },
    );
  }
}

class Connected extends StatelessWidget {
  const Connected({
    Key? key,
    required this.one,
  }) : super(key: key);

  final Map<String, Widget> one;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BluetoothDevice>>(
      stream: Stream.periodic(Duration(seconds: 10))
          .asyncMap((e) => FlutterBlue.instance.connectedDevices),
      // initialData: [],
      builder: (context, snapshot) => Column(
        children: snapshot.data?.map((d) {
              if (d.type == BluetoothDeviceType.le) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => DeviceScreen(
                              device: d,
                              data: one.containsKey(d.name)
                                  ? one[d.name]!
                                  : Eror(),
                            )),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(d.name),
                    leading: Text(d.type.name),
                    trailing: ElevatedButton(
                      child: Text("disconnect"),
                      onPressed: () {
                        d.disconnect();
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }).toList() ??
            [],
      ),
    );
  }
}

class Bigcircle extends StatefulWidget {
  Bigcircle(
      {super.key, required this.color, required this.hdri, required this.name});

  final Color color;
  final String name;

  final String hdri;

  @override
  State<Bigcircle> createState() => _BigcircleState();
}

class _BigcircleState extends State<Bigcircle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => Panoram(
                  img: widget.hdri,
                  name: widget.name,
                )),
          ),
        );
      },
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: new BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
