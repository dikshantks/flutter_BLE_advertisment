import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final beaconCountController = TextEditingController();
  List<TextEditingController> beaconControllers = [];

  Future<void> registerUser() async {
    var url = Uri.parse('http://172.20.3.10/api/user/signUp.php');
    List<Map<String, dynamic>> beacons = [];
    for (var controller in beaconControllers) {
      beacons.add({'beacon_name': controller.text});
    }
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': nameController.text,
          'password': passwordController.text,
          'email': emailController.text,
          'beacons': beacons,
        }));
    if (response.statusCode == 200) {
      // Registration successful
      var jsonResponse = json.decode(response.body);

      print("start");
      if (jsonResponse.containsKey('success')) {
        // Show success message
        print("done");
      } else if (jsonResponse.containsKey('error')) {
        // Show error message
        print(jsonResponse);
      }
    } else {
      // Registration failed

      print("fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: beaconCountController,
                  decoration: InputDecoration(
                    labelText: 'Number of Beacons',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    int beaconCount = int.tryParse(value) ?? 0;
                    setState(() {
                      beaconControllers = List.generate(
                          beaconCount, (_) => TextEditingController());
                    });
                  },
                ),
                ...beaconControllers.map((controller) => TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Beacon Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the beacon name';
                        }
                        return null;
                      },
                    )),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerUser();
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
