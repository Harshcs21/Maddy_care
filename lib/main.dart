import 'package:flutter/material.dart';
import 'doctorinfo.dart';
import 'forgotpassword.dart';
import 'start.dart'; // Import the file where MyStart is defined
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    initialRoute: 'start',
    routes: {
      'start': (context) => const MyStart(), // Use MyStart here
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'doctorinfo' : (context) => MyDoctor(),
      'forgotpassword' : (context) => MyForgotPassword()
    },
  ));
}
