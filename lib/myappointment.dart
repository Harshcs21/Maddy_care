import 'package:flutter/material.dart';
import 'package:flutter_pro/cancelappointment.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pro/register.dart';
import 'package:firebase_core/firebase_core.dart';


class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {



  dynamic appointments = AuthMethods().getUserAppointments() as List;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Appoinemnts'
            ),
          ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, item){
            return Center(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("name:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                        Text("Doctor: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                      ],
                    ),
                    ElevatedButton(

                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CancelAppointment(),
                            ),
                          );
                        },
                        child: Text("cancel",
                        style: TextStyle(
                          color: Colors.black
                        ),))
                  ],
                ),
              ),
            );
          }),
        ),
    ));
  }
}

class appointments extends StatelessWidget{


  @override
  Widget build(BuildContext context) {




  }
}
