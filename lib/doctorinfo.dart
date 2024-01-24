import 'package:flutter/material.dart';

class MyDoctor extends StatefulWidget {
  const MyDoctor({super.key});

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
        body: SafeArea(
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Text('data',style: TextStyle(
                            color: Colors.white,
                            fontSize: 100
                          ),)
                        ],
                      )
                    ],
                  )
              ),
              

            )
        ),
    );
  }
}
