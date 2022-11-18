// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class Maingate extends StatefulWidget {
  const Maingate({super.key});

  @override
  State<Maingate> createState() => _MaingateState();
}

class _MaingateState extends State<Maingate> {
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
            height: 20.0,
          ),
          Container(
            child: Text(
              " WELCOME TO NIIT\n",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text(
                textAlign: TextAlign.justify,
                "NIIT University's peaceful, lush green campus leaves our students spellbound. It is unlike any campus they have seen before. Certainly not one situated in a desert landscape. The abundant greenery, vast open spaces, and pure air leaves them enthralled"),
          )
        ],
      ),
    );
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
            child: Text("Welcome to NIIT"),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text(
                "NIIT University's peaceful, lush green campus leaves our students spellbound. It is unlike any campus they have seen before. Certainly not one situated in a desert landscape. The abundant greenery, vast open spaces, and pure air leaves them enthralled"),
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
          Container(
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
                    }))
          // SimpleUrlPreview(url: "https://v6.sinusoid.in/"),
        ],
      ),
    );
  }
}

class Eror extends StatefulWidget {
  const Eror({super.key});

  @override
  State<Eror> createState() => _ErorState();
}

class _ErorState extends State<Eror> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("THIS IS NOT OUR BEACON")),
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
