import 'package:flutter/material.dart';
import 'package:flutter_pro/userappointment.dart';
import 'package:flutter_pro/userappointment.dart';

class CancelAppointment extends StatefulWidget {
  const CancelAppointment({Key? key}) : super(key: key);

  @override
  State<CancelAppointment> createState() => _CancelAppointmentState();
}

class _CancelAppointmentState extends State<CancelAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Appointment canceled successfully',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserAppointment()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
