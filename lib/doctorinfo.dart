import 'package:flutter/material.dart';
import 'package:flutter_pro/doctorbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pro/reg_doc_user.dart';
import 'register.dart';
import 'package:uuid/uuid.dart';


class MyDoctor extends StatefulWidget {
  const MyDoctor({super.key});

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {

  String pat_uid = "";
  String pat_appointment_id = "";
  String name = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // Stream<DocumentSnapshot<Map<String, dynamic>>> doctor = FirebaseFirestore.instance.collection('Doctors').doc(FirebaseAuth.instance.currentUser!.uid).snapshots();

  // Map<String, dynamic> data = FirebaseFirestore.instance.collection('Doctors').doc(FirebaseAuth.instance.currentUser!.uid).snapshots().data() as Map<String, dynamic>;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('     Doctor Appointment'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [


                    Text("Dr. Shailendra",
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                            Text("Total Appointments: 0"),
                            Text("Offline Appointments: 0"),
                            Text("Online Appointments: 0")
                          ],
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/doctorimage.png'),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Upcomming Appointments",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      // child: ListView.builder(
                      //     itemCount: names.length,
                      //     itemBuilder: (context, item) {
                      //       return DoctorBox(name: names[item],);
                      //     }
                      // )
                    child: StreamBuilder(
                  stream: _firestore
                      .collection('Doctors')
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
                // String doctor = data['doctor'] ?? 'Unknown';
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
                      // Text('Doctor: $doctor'),
                      Text('Patient Number: $patientNumber'),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Appointment complete'),
                                    content: Text(
                                        'Are you sure you want to done this appointment?'),
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
                                          pat_uid = data['pat_uid'] ?? 'Unknown';
                                          pat_appointment_id =
                                              data['pat_appointment_id'] ??
                                                  'Unknown';

                                          _firestore
                                              .collection('users')
                                              .doc(pat_uid)
                                              .collection('myAppointments')
                                              .doc(pat_appointment_id)
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
                              primary: Colors.green,
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
                                          pat_uid = data['pat_uid'] ?? 'Unknown';
                                          pat_appointment_id =
                                              data['pat_appointment_id'] ??
                                                  'Unknown';

                                          _firestore
                                              .collection('users')
                                              .doc(pat_uid)
                                              .collection('myAppointments')
                                              .doc(pat_appointment_id)
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
        ),

                  ),
                ]
            ),
          ),
        )
    );
  }
}


