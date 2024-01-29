import 'package:flutter/material.dart';
import 'package:flutter_pro/cancelappointment.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pro/register.dart';
import 'package:firebase_core/firebase_core.dart';

import 'myappointment.dart';
import 'myappointment.dart';


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
            title: Text(
              'My Appoinemnts'
            ),
          ),
        body: new appointments(),
    ));
  }
}

class appointments extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return StreamBuilder(
        stream: _firestore.collection('users').doc(_auth.currentUser!.uid).collection('myAppointments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return Text('Loading...');
          return ListView(
            children: snapshot.data!.docs.map((document){
              return ListTile(
                title: document['patient name'],
                subtitle: document['doctor'],
              );
            }).toList(),
          );
        });


  }
}

// class appointments extends StatelessWidget{
//
//
//
// }
