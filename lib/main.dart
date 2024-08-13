import 'package:flutter/material.dart';
import 'package:flutter_pro/newappointment.dart';
import 'doctorinfo.dart';
import 'forgotpassword.dart';
import 'start.dart'; // Import the file where MyStart is defined
import 'login.dart';
import 'register.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    initialRoute: 'new_appointment',
    routes: {
      'start': (context) => const MyStart(), // Use MyStart here
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'doctorinfo' : (context) => MyDoctor(),
      'forgotpassword' : (context) => MyForgotPassword(),
      // 'dateandtime' : (context) => DateAndTime(),
      // 'auth' : (context) => AuthPage()
      // 'reg_doc_user' : (context) => RegDocUser(),
      'new_appointment' : (context) => Newappointment()
    },
  ));
}
