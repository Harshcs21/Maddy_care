// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/newappointment.dart';
import 'package:flutter_pro/userappointment.dart';
import 'doctorinfo.dart';
import 'forgotpassword.dart';
import 'start.dart'; // Import the file where MyStart is defined
import 'login.dart';
import 'register.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    initialRoute: 'start',
    routes: {
      'start': (context) => const MyStart(), // Use MyStart here
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'doctorinfo' : (context) => MyDoctor(),
      'forgotpassword' : (context) => MyForgotPassword(),
      // 'dateandtime' : (context) => DateAndTime(),
      // 'auth' : (context) => AuthPage()
      // 'reg_doc_user' : (context) => RegDocUser(),
      'userappointment': (context) => UserAppointment(),
    },
  ));
}
