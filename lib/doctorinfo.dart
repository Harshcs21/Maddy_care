import 'package:flutter/material.dart';
import 'package:flutter_pro/doctorbox.dart';

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
    'Dr. Ayushmaan',
    'Dr. Shailendra',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Dr. Shailendra"),
                                Text("Total Appointments: 30"),
                                Text("Offline Appointments: 10"),
                                Text("Online Appointments: 20")
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
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Upcomming Appointments",
                              style: TextStyle(
                                fontSize: 20
                              ),
                        ) ,
                      ),
                      SizedBox(height: 10),
                      Expanded(child: ListView.builder(
                          itemCount: names.length,
                          itemBuilder: (context, item){
                              return DoctorBox(name: names[item],);
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
