import 'package:flutter/material.dart';
import 'package:flutter_pro/login.dart';
import 'package:flutter_pro/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    initialRoute: 'login',
    routes: {
      'login' : (context) => MyLogin(),
      'register': (context) => MyRegister()
    }
  ));
}

