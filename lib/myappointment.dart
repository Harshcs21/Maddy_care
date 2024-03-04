import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Appointments'),
        ),
        body: Appointments(),
      ),
    );
  }
}

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    String doctor_uid;
    String doctor_appointment_id;

    return StreamBuilder(
      stream: _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('myAppointments')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No appointments found.'),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            // Extracting appointment details
            String patientName = data['patient name'] ?? 'Unknown';
            String doctor = data['doctor'] ?? 'Unknown';
            String date = data['date'] ?? 'Unknown';
            String time = data['time'] ?? 'Unknown';
            String patientNumber = data['phone'] ?? 'Unknown';

            return Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient: $patientName',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text('Date: $date, Time: $time'),
                  Text('Doctor: $doctor'),
                  Text('Patient Number: $patientNumber'),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Show confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirm Appointment Cancellation'),
                                content: Text(
                                    'Are you sure you want to cancel this appointment?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      doctor_uid = data['doc_uid'] ?? 'Unknown';
                                      doctor_appointment_id =
                                          data['doc_appointment_id'] ??
                                              'Unknown';

                                      _firestore
                                          .collection('Doctors')
                                          .doc(doctor_uid)
                                          .collection('myAppointments')
                                          .doc(doctor_appointment_id)
                                          .delete();

                                      // Delete the appointment document from Firestore
                                      document.reference.delete();
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                      // Show Snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Appointment cancelled successfully.'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My Appointments',
    home: MyAppointment(),
  ));
}
