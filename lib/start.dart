import 'package:flutter/material.dart';
import 'package:flutter_pro/auth.dart';
import 'dart:async';
import 'login.dart'; // Import the file where MyLogin is defined
// import 'package:flutter_pro/auth.dart';
import 'googleMaps.dart';
import 'userappointment.dart';

class MyStart extends StatefulWidget {
  const MyStart({Key? key}) : super(key: key);

  @override
  State<MyStart> createState() => _MyStartState();
}

class _MyStartState extends State<MyStart> {
  @override
  void initState() {
    super.initState();
    // Add a delay using a Future to simulate a splash screen
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the login page after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserAppointment()),
          // Use MyLogin here

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color as per your design
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash.png', // Replace with the actual path to your image
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
            ),
            SizedBox(height: 16), // Adjust the spacing between image and text
            Text(
              'Welcome to Meddy Care',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
