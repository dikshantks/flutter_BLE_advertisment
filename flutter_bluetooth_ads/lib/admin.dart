// ignore: non_constant_identifier_names
// ignore: non_constant_identifier_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  // ignore: non_constant_identifier_names
  String Ble_name, content, heading, img, url;

   List<String> offers ; 
  Admin({
    required this.Ble_name,
    required this.img,
    required this.url,
    required this.content,
    required this.heading,
    required this.offers , 
  });

  static Admin fromjson(Map<String, dynamic> json) => Admin(
        Ble_name: json['ble_name'],
        img: json['img'],
        url: json['url'],
        content: json['content'],
        heading: json['heading'],

        offers: json["offers"] ,
      );
  // Stream<List<Admin>> readAdmin() => FirebaseFirestore.instance.collection("admin").get("1").then((value) =>  value.docs.map((e) => e.data()).toList()  )  ;

}
