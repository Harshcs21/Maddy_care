import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/patientdetails.dart'; // Import your patient details page file

class Newappointment extends StatefulWidget {
  const Newappointment({Key? key}) : super(key: key);

  @override
  State<Newappointment> createState() => _NewappointmentState();
}

class _NewappointmentState extends State<Newappointment> {

  final List images = [
    "assets/bone.png",
    "assets/dentist.png",
    "assets/ent.png",
    "assets/eyes.png",
    "assets/fever.png",
    "assets/skin.png",
    // "assets/splash.png",
    // "assets/login_page.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Appointment'),
        // Add any actions if needed
      ),
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: images.length,
            itemBuilder: (context, item) {

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatientDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(images[item]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
