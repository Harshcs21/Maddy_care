import 'package:flutter/material.dart';
import 'package:flutter_pro/cancelappointment.dart';
import 'package:flutter_pro/confirmappointment.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'doctor.dart';

class DoctorDetails extends StatefulWidget {

  String? doctor_name;
  String? doctor_image;
  String? doctor_uid;


  DoctorDetails({Key? key, required this.doctor_name, required this.doctor_image, required this.doctor_uid}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid);
}

class _DoctorDetailsState extends State<DoctorDetails> {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;


  _DoctorDetailsState({required this.doctor_name, required this.doctor_image, required this.doctor_uid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('        Doctor Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(doctor_image != null ? doctor_image! : "assets/doctorimage.png"),
                    )),
                    ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor_name != null ? doctor_name! : "Dr Dev Shah",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'General Physician',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
              ]
              ),
              SizedBox(height: 20),
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Tips',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {

                      doctor = "Dr. Shailu";

                      String res = await AuthMethods().addAppointment(
                          name: name,
                          date: date,
                          time: time,
                          doctor: doctor_name!,
                          phone: phone,
                          doctor_uid: doctor_uid!,);

                      if(res == "Successfully appointment booked")
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmAppointment(),
                            ),
                          );
                        }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Set button color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0), // Set padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set rounded corners
                      ),
                    ),
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
      ),
    ),);
  }
}
