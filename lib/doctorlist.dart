import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatefulWidget {
  final String spec;
  const DoctorList({super.key, required this.spec});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class _DoctorListState extends State<DoctorList> {
  @override
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Doctors List"),
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => {Navigator.pop(context)},
            ),
          ),
          body: StreamBuilder(
              stream: _firestore
                  .collection("Doctors")
                  .doc("specializations")
                  .collection(widget.spec)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    // Extracting doctor details
                    String doctorname = data['username'] ?? 'Unknown';
                    doctorname = doctorname.toLowerCase();
                    doctorname = doctorname.capitalize();


                    return Container(
                      padding: EdgeInsets.all(20.0),
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(doctorname[0]),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(doctorname,
                                  style:
                                      TextStyle(
                                      fontSize: 20))),
                        ],
                      ),
                    );
                  }).toList(),
                );
              })),
    );
  }
}
