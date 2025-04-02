import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/doctorlist.dart';

class Newappointment extends StatefulWidget {

  final String patientName;
  final String patientAge;
  final String patientMobile;

  const Newappointment({Key? key, required this.patientName, required this.patientAge, required this.patientMobile}) : super(key: key);

  @override
  State<Newappointment> createState() => _NewappointmentState();
}

class _NewappointmentState extends State<Newappointment> {


  final List<String> images = [
    "assets/heart.png",
    "assets/skin.png",
    "assets/diabetes.png",
    "assets/ent.png",
    "assets/eyes.png",
    "assets/fever.png"
    ,
  ];

  final List<String> docTypes = [
    "Heart",
    "Skin",
    "Diabetes",
    "Parkinson",
    "Eyes",
    "Physician"
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
                      MaterialPageRoute(builder: (context) => DoctorList(spec: docTypes[item], patientName: widget.patientName, patientAge: widget.patientAge, patientMobile: widget.patientMobile),
                  ));

                },
                child: Column(

                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(images[item]),
                      ),
                    ),
                    Text(docTypes[item]),
                  ],
                ),
              );
            }),
      ),
    );
  }
}