import 'package:flutter/material.dart';
import 'package:flutter_pro/firebase_options.dart';
import 'doctorinfo.dart';
import 'forgotpassword.dart';
import 'start.dart'; // Import the file where MyStart is defined
import 'login.dart';
import 'register.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:js_util';

// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
