// ignore: non_constant_identifier_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_blue/flutter_blue.dart";
// import 'package:flutter_blue/gen/flutterblue.pbjson.dart';
import 'package:flutter_bluetooth_ads/datt.dart';
import 'package:flutter_bluetooth_ads/localnotification.dart';
// import 'package:flutter_bluetooth_ads/main.dart';
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
    "Maingate": "assets/maingate.jpg",
    "ECE-Lab1": "assets/80.jpg",
    "Sinusoid": "assets/sijnu.jpg",
  };
  Map<String, String> intro_img = {
    "Maingate": "assets/maingate.jpg",
    "ECE-Lab1": "assets/80.jpg",
    "Sinusoid": "assets/sijnu.jpg",
  };

  Map<String, bool> col = {
    'Maingate': false,
    'ECE-Lab1': false,
    'Sinusoid': false,
    "extra": false,
  };

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Future<bool> ispresent() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    bool isthere = false;

    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults;

    if (await subscription.any(
      (element) => element.any((element) =>
          element.device.type == BluetoothDeviceType.le ? false : true),
    )) {
      isthere = true;
    } else {
      isthere = false;
    }

    return isthere;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        // shape: ShapeBorder(),
        backgroundColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Beacon \n  Map"),
                  Container(
                    // color: Colors.blue,
                    height: 50.0,
                    // child: GridView.count(
                    //   primary: false,
                    //   mainAxisSpacing: 10.0,
                    //   crossAxisSpacing: 10.0,
                    //   crossAxisCount: 3,
                    //   children: [
                    //     Container(
                    //       height: 10.0,
                    //       width: 30.0,
                    //       color: Colors.yellow,
                    //       // child: ElevatedButton(
                    //       //   onPressed: () {},
                    //       //   child: Text("Sinusoid"),
                    //       // ),
                    //     ),

                    //     SizedBox(
                    //       height: 20.0,
                    //       width: 10.0,
                    //       child: ElevatedButton(
                    //           onPressed: () {}, child: Text("Sinusoid")),
                    //     ),
                    //     Container(
                    //       height: 20.0,
                    //       width: 30.0,
                    //       child: ElevatedButton(
                    //           onPressed: () {}, child: Text("Sinusoid")),
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                child: InteractiveViewer(
                  child: Stack(children: [
                    SizedBox(
                      width: 300.0,
                      height: 700.0,
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            // minRadius: 10.0,
            foregroundColor: Colors.blueAccent,
            backgroundImage: AssetImage("assets/cutee.gif"),
          ),
        ),
        // foregroundColor: Color(0xff030027),
        title: Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(top: 50.0),
          // child: Text("\n Hello \n ${widget.user}"),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.user}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        automaticallyImplyLeading: false,
        // title: Text("\n Hello \n ${widget.user}"),
        centerTitle: true,
      ),
      floatingActionButton: FloatButtn(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              // initialData: [],
              builder: (context, snapshot) => Column(
                children: snapshot.data?.map((d) {
                      if (d.device.type == BluetoothDeviceType.le &&
                          d.rssi.abs() < 100) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => DeviceScreen(
                                      name: intro_img[d.device.name],
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
                                            name: intro_img[d.device.name]!,
                                            device: d.device,
                                            data: one.containsKey(d.device.name)
                                                ? one[d.device.name]!
                                                : Nothinginit(),
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
                    }).toList() ??
                    [],
              ),
            ),
            const Divider(
              indent: 10.0,
              endIndent: 10.0,
              height: 20.0,
              thickness: 1.0,
              color: Colors.black45,
            ),
            Connected(
              one: one,
              two: intro_img,
            ),
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
    required this.two,
  }) : super(key: key);

  final Map<String, Widget> one;
  final Map<String, String> two;

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
                              name: two[d.name]!,
                              device: d,
                              data: one.containsKey(d.name)
                                  ? one[d.name]!
                                  : Nothinginit(),
                            )),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(d.name),
                    // leading: Text(">"),
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
