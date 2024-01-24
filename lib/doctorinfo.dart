import 'dart:js_util';

import 'package:flutter/material.dart';

class MyDoctor extends StatefulWidget {
  const MyDoctor({super.key});

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {

final List names = [
  'Dr. Dev',
  'Dr. Harsh',
  'Dr. Himanshu',
  'Dr. Ayushmaan'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Dr. Shaliendra"),
                              Text("Total Appointments : 23"),
                              Text("Online Appointments : 30"),
                              Text("Offline Appointments : 20"),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/login_page.png'),
                              )
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: Text(
                          "Upcomming Appointments",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Expanded(
                        child: ListView.builder(
                            itemCount: names.length,
                            itemBuilder: (context, index)
                        {
                            return Container(
                              height: 20,
                              width: 20,
                              color: Colors.black,
                            );
                        }
                        )
                    )
                    
                    

                  ],
                )
            )
        ),
    );
  }
}
