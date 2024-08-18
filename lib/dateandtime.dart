import 'package:flutter/material.dart';
import 'package:flutter_pro/doctordetail.dart';
import 'checkout.dart';
import 'patientdetails.dart';

class DateAndTime extends StatefulWidget {

  final String doctorName;
  final String doctorUid;
  final String doctorSpec;
  final String patientName;
  final String patientAge;
  final String patientMobile;

  const DateAndTime({super.key, required this.doctorName, required this.doctorUid, required this.patientName, required this.patientAge, required this.patientMobile, required this.doctorSpec,});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {

  bool isClicked = false;
  String shift = "Morning";

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  // void _navigateToDoctorDetails(BuildContext context, String? doctor_name, String? doctor_image, String? doctor_uid) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => DoctorDetails(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date and Shift'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Select Date',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date',
                style: TextStyle(color: Colors.white,)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Select Shift',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : [
                Column(
                  children: [
                    InkWell(
                      onTap: ()=>{
                        setState(() {
                          if(isClicked == true)
                            isClicked = false;
                            shift = 'Morning';
                        })
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: !isClicked ?Colors.green :Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text("9-12", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Morning", style: TextStyle(
                      fontSize: 20
                    ))
                  ]
                ),
                Column(
                    children: [
                      InkWell(
                        onTap: ()=>{
                          setState(() {
                            if(isClicked == false)
                              {
                                isClicked = true;
                                shift = "Evening";
                              }
                          })
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              color: isClicked ?Colors.green :Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text("3 - 6", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),)
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Evening", style: TextStyle(
                          fontSize: 20
                      ))
                    ]
                ),
              ]
            ),
            Spacer(), // Add spacer to push the continue button to the bottom
            ElevatedButton(
              onPressed: () {
                date = _selectedDate.toString();
                time = _selectedTime.toString();

                Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(date: date, shift: shift, doctorSpec: widget.doctorSpec, doctorName: widget.doctorName, doctorUid: widget.doctorUid,  patientName: widget.patientName, patientAge: widget.patientAge, patientMobile: widget.patientMobile)));
                 // _navigateToDoctorDetails(context, doctor_name, doctor_image, doctor_uid);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.all(0), // Remove padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              child: Container(

                alignment: Alignment.center,
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.all(20.0),
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
    );
  }
}
