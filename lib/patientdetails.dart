import 'package:flutter/material.dart';
import 'package:flutter_pro/doctordetail.dart';
import 'package:flutter_pro/dateandtime.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'doctor.dart';

String name = "";
String phone = "";
String date = "";
String time = "";
String doctor = "";


class PatientDetails extends StatefulWidget {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;

  PatientDetails({Key? key, required this.doctor_name, required this.doctor_uid, required this.doctor_image}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid);
}

class _PatientDetailsState extends State<PatientDetails> {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;

  _PatientDetailsState({ required this.doctor_name, required this.doctor_uid, required this.doctor_image});

  TextEditingController _patientName = TextEditingController();
  TextEditingController _patientAge = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _diseaseSymptoms = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Patient Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Name',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _patientName,
                    decoration: InputDecoration(
                      hintText: 'Enter patient name',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Patient Age',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _patientAge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter patient age',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _mobile,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter mobile number',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Disease Symptoms',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _diseaseSymptoms,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter disease symptoms',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    name = _patientName.text;
                    phone = _mobile.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateAndTime(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey, // Add shadow color
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.green, // Set button color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
