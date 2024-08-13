import 'package:flutter/material.dart';
import 'package:flutter_pro/doctordetail.dart';
import 'patientdetails.dart';

class DateAndTime extends StatefulWidget {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;

  DateAndTime({Key? key, required this.doctor_name, required this.doctor_uid, required this.doctor_image}) : super(key: key);

  @override
  State<DateAndTime> createState() => _DateAndTimeState(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid);
}

class _DateAndTimeState extends State<DateAndTime> {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;

  _DateAndTimeState({required this.doctor_name, required this.doctor_uid, required this.doctor_image});



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

  void _navigateToDoctorDetails(BuildContext context, String? doctor_name, String? doctor_image, String? doctor_uid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetails(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('    Select Date and Time'),
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
              'Select Time',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${_selectedTime.hour}:${_selectedTime.minute}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time',
              style: TextStyle(color: Colors.white,)
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            Spacer(), // Add spacer to push the continue button to the bottom
            ElevatedButton(
              onPressed: () {
                date = _selectedDate.toString();
                time = _selectedTime.toString();

                 _navigateToDoctorDetails(context, doctor_name, doctor_image, doctor_uid);
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
