import 'package:flutter/material.dart';
import 'package:flutter_pro/confirmappointment.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'dateandtime.dart';

class DoctorDetails extends StatefulWidget {

  final String doctorName;
  final String doctorUid;
  final String doctorSpec;
  final String patientName;
  final String patientAge;
  final String patientMobile;


  const DoctorDetails({super.key, required this.doctorName, required this.doctorUid, required this.patientName, required this.patientAge, required this.patientMobile, required this.doctorSpec});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

    @override
    Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container(
                  //   height: 100,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //     image: AssetImage(doctor_image != null ? doctor_image! : "assets/doctorimage.png"),
                  //   )),
                  //   ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 30,
                    child: Text(widget.doctorName[0]),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
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
                "Dr. " + widget.doctorName + " is a dedicated and experienced ENT with over "
                "5 years of practice in the field. After earning their medical degree from AIMS, "
                "Dr. " + widget.doctorName + " further specialized in ENT,"
                " developing a deep expertise in [mention any particular area of interest or specialty]. "
                "Known for their compassionate approach to patient care, Dr." + widget.doctorName + " is committed to providing "
                "the highest quality of medical care, using the latest advancements in the field to ensure the best "
                "outcomes for their patients.",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {

                      // setState(() {
                      //   openCheckout();
                      // });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateAndTime(doctorSpec: widget.doctorSpec, doctorName: widget.doctorName, doctorUid: widget.doctorUid,  patientName: widget.patientName, patientAge: widget.patientAge, patientMobile: widget.patientMobile),
                        ),
                      );


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set button color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0), // Set padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set rounded corners
                      ),
                    ),
                    child: Text(
                      'Check Appointment',
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
