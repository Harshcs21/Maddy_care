
import 'package:flutter/material.dart';
import 'package:flutter_pro/confirmappointment.dart';
import 'package:flutter_pro/doctordetail.dart';
import 'package:flutter_pro/newappointment.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:flutter_pro/userappointment.dart';
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
      'forgotpassword' : (context) => MyForgotPassword(),

      'newappointment' : (context) => Newappointment(),
      'patientdetails' : (context) => PatientDetails(),
      'doctordetails' :  (context) => DoctorDetails(),
      'confirmappointment' : (context) => ConfirmAppointment(),
      'userappointment' : (context) => UserAppointment()
    },
  ));
}
