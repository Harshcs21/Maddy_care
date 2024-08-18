import 'package:flutter/material.dart';
import 'package:flutter_pro/dateandtime.dart';

import 'newappointment.dart';

String name = "";
String phone = "";
String date = "";
String time = "";
String doctor = "";


class PatientDetails extends StatefulWidget {

  const PatientDetails({super.key,});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {


  TextEditingController _patientName = TextEditingController();
  TextEditingController _patientAge = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _diseaseSymptoms = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to controllers to check for changes
    _patientName.addListener(_checkIfEmpty);
    _patientAge.addListener(_checkIfEmpty);
    _mobile.addListener(_checkIfEmpty);
  }

  void _checkIfEmpty() {
    setState(() {
      // Enable the button only if all text fields are non-empty
      isButtonEnabled = _patientName.text.isNotEmpty &&
          _patientAge.text.isNotEmpty &&
          _mobile.text.isNotEmpty;
    });
  }

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
                InkWell(
                  onTap:isButtonEnabled ?() {
                    name = _patientName.text;
                    phone = _mobile.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Newappointment(patientName: _patientName.text, patientAge: _patientAge.text, patientMobile: _mobile.text),
                      ),
                    );
                  } : null ,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isButtonEnabled ?Colors.green :Colors.grey, // Set button color
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
