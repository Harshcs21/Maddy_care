import 'package:flutter/material.dart';
import 'package:flutter_pro/doctorinfo.dart';
import 'package:flutter_pro/forgotpassword.dart';
import 'start.dart'; // Import the file where MyStart is defined
import 'package:flutter_pro/login.dart';
import 'package:flutter_pro/register.dart';

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
