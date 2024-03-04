import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/doctor.dart';
import 'package:flutter_pro/patientdetails.dart';// Import your patient details page file

class Newappointment extends StatefulWidget {
  const Newappointment({Key? key}) : super(key: key);

  @override
  State<Newappointment> createState() => _NewappointmentState();
}

class _NewappointmentState extends State<Newappointment> {


  final List<Map<String, String>> doctor = [
    {
      "doctor_name" : "Dr. Dev Shah",
      "doctor_uid" : "1DcgPsZkT9aZ6YAGRYrX5dyRXPZ2",
      "doctor_image" : "assets/bone.png"
    },
    {
      "doctor_name" : "Dr. Himanshu Gupta",
      "doctor_uid" : "hZGKXsYnUPWVcid2FhW2QSPxHRA2",
      "doctor_image" : "assets/dentist.png"
    },
    {
      "doctor_name" : "Dr. Harsh Ghiya",
      "doctor_uid" : "WRfg4BCdWugw2L6E3VVThXOBuZY2",
      "doctor_image" : "assets/ent.png"
    },
    {
      "doctor_name" : "Dr. Shailendra",
      "doctor_uid" : "V7pozMVue7S02M1DCKCUaG8lnl02",
      "doctor_image" : "assets/eyes.png"
    },
    {
      "doctor_name" : "Dr. Ayushmaan sharma",
      "doctor_uid" : "wOxo3Zl7UUUnZmHNagynE4Pjtgs2",
      "doctor_image" : "assets/fever.png"
    },
    {
      "doctor_name" : "Dr. Prakhar Mishra",
      "doctor_uid" : "piH2dt6sCOQrKhUFxufMXKZiKRz1",
      "doctor_image" : "assets/skin.png"
    },
  ];


  final List<String> images = [
    "assets/bone.png",
    "assets/dentist.png",
    "assets/ent.png",
    "assets/eyes.png",
    "assets/fever.png",
    "assets/skin.png",
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
                      MaterialPageRoute(builder: (context) => PatientDetails(doctor_name: doctor[item]["doctor_name"],doctor_image: doctor[item]["doctor_image"],doctor_uid: doctor[item]["doctor_uid"],),
                  ));

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