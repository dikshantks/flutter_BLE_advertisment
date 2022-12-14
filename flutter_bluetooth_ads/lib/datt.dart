// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_ads/admin.dart';
import 'package:panorama/panorama.dart';
// import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class Maingate extends StatefulWidget {
  const Maingate({super.key});

  @override
  State<Maingate> createState() => _MaingateState();
}

class _MaingateState extends State<Maingate> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List topic = [
    "BLE/advertisment and tour",
    "Smart MOnitoring and Navigation of Students",
    "Contactless Healthcare Companion using IOT",
    "IOT Based Laundary Management System",
    "Restaurant Management",
    "Energy Meter",
    "IOT In Smart Agriculture",
    "Smart Waste Management System",
    "Personalized Advertisement Based on Location",
  ];

  Stream<List<Admin>> readUsers() =>
      firestore.collection("users").snapshots().map(
            (event) => event.docs.map((e) => Admin.fromjson(e.data())).toList(),
          );

  @override
  Widget build(BuildContext context) {
    String heading = "oe";

    void getdata() async {
      DocumentSnapshot? documentSnapshot;
      await firestore
          .collection("admin")
          .doc("uOPJLtI7idlGpuzNB28F")
          .get()
          .then((value) {
        documentSnapshot = value;
      });

      heading = documentSnapshot!["heading"];
    }

    final CollectionReference data =
        FirebaseFirestore.instance.collection('admin');

    return StreamBuilder(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(
                  thickness: 1.0,
                  endIndent: 25.0,
                  indent: 25.0,
                ),
                ListTile(
                  trailing: Icon(
                    Icons.turn_left,
                    size: 40.0,
                  ),
                  title: Text("Next Beacon in ECE-Lab 5 meters away"),
                ),
                Divider(
                  thickness: 1.0,
                  endIndent: 25.0,
                  indent: 25.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text(
                    heading,
                    // doc.update('' : ""),
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Text(
                      textAlign: TextAlign.justify,
                      "NIIT University's peaceful, lush green campus leaves our students spellbound. Certainly not one situated in a desert landscape. The abundant greenery, vast open spaces, and pure air leaves them enthralled"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Text("List of Projects"),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  endIndent: 25.0,
                  indent: 25.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                      itemCount: topic.length,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text(topic[index]),
                          ))),
                )
              ],
            ),
          );
        });
  }
}

class CR101 extends StatefulWidget {
  const CR101({super.key});
  @override
  State<CR101> createState() => _CR101State();
}

class _CR101State extends State<CR101> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Divider(
            thickness: 1.0,
            endIndent: 25.0,
            indent: 25.0,
          ),
          ListTile(
            trailing: Icon(
              Icons.straight,
              size: 40.0,
            ),
            title: Text("Next Beacon in  CR-202 "),
          ),
          Divider(
            thickness: 1.0,
            endIndent: 25.0,
            indent: 25.0,
          ),
          Container(
            child: Text("Welcome to ECE-LAB I"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text(
                "NIIT University's  ECE-LAB is peaceful . The abundant greenery, vast open spaces, and pure air leaves them enthralled"),
          ),
        ],
      ),
    );
  }
}

class CR202 extends StatefulWidget {
  const CR202({super.key});

  @override
  State<CR202> createState() => _CR202State();
}

class _CR202State extends State<CR202> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Divider(
            thickness: 1.0,
            endIndent: 25.0,
            indent: 25.0,
          ),
          ListTile(
            trailing: Icon(
              Icons.thumb_up,
              size: 30.0,
            ),
            title: Text("That's all the location for now \n "),
          ),
          Divider(
            thickness: 1.0,
            endIndent: 25.0,
            indent: 25.0,
          ),
          Container(
            child: Text(
              "SINUSOID",
              style: TextStyle(
                  fontSize: 25.0, decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text(
                "siNUsoid, NIIT University's tech fest, is where we rejuvenate intuitive learning. Our main goal is to make the majority of our theoretical knowledge comprehensible and applicable for students, while attempting to intensify their interest in learning. To bridge the gap between the academic and practical worlds, we wish to showcase the extensive technical knowledge of students all over the world."),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
              text: "https://v6.sinusoid.in",
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  var url = "https://v6.sinusoid.in";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "can not laouch lol ";
                  }
                },
            ),
          ),
        ],
      ),
    );
  }
}

class Nothinginit extends StatefulWidget {
  const Nothinginit({super.key});

  @override
  State<Nothinginit> createState() => _NothinginitState();
}

class _NothinginitState extends State<Nothinginit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
          child: SizedBox(
        height: 300.0,
        width: 250.0,
        // color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                // color: Colors.red,
                height: 200.0,
                width: 200.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(400.0)),
                    child: Image.asset("assets/cr12.jpg"))),
            Text(
              "\n Nothing to see here.",
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      )),
    );
  }
}

class Panoram extends StatefulWidget {
  const Panoram({super.key, required this.name, required this.img});

  final String name;
  final String img;

  @override
  State<Panoram> createState() => _PanoramState();
}

class _PanoramState extends State<Panoram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(127, 58, 69, 105),
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(widget.name),
      ),
      body:

          // Center(
          //   child: Text("lol"),
          // )

          Panorama(
        animSpeed: 3,
        maxZoom: 4,
        sensitivity: 2,
        child: Image.asset(widget.img),
      ),
    );
  }
}
