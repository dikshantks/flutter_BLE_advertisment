// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailController = TextEditingController();

//   Future<void> registerUser() async {
//     var url = Uri.parse('http://yourdomain.com/register.php');
//     var response = await http.post(url, body: {
//       'name': nameController.text,
//       'password': passwordController.text,
//       'email': emailController.text,
//     });
//     if (response.statusCode == 200) {
//       // Registration successful
//     } else {
//       // Registration failed
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     registerUser();
//                   }
//                 },
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
