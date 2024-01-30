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
                      child: ListView.builder(
                          itemCount: names.length,
                          itemBuilder: (context, item) {
                            return DoctorBox(name: names[item],);
                          }
                      )
                  ),
                ]
            ),
          ),
        )
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MyDoctor extends StatefulWidget {
//   const MyDoctor({Key? key}) : super(key: key);
//
//   @override
//   State<MyDoctor> createState() => _MyDoctorState();
// }
//
// class _MyDoctorState extends State<MyDoctor> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor Appointment'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Doctor Information Widget
//               DoctorInfo(),
//
//               SizedBox(height: 20),
//
//               // Patient Appointments Widget
//               Expanded(child: PatientAppointments()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DoctorInfo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade600,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Dr. Shailendra",
//                 style: TextStyle(fontSize: 18),
//               ),
//               Text("Total Appointments: 30"),
//               Text("Offline Appointments: 10"),
//               Text("Online Appointments: 20"),
//             ],
//           ),
//           Container(
//             height: 100,
//             width: 100,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/doctorimage.png'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PatientAppointments extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(
//             child: Text('No appointments found.'),
//           );
//         }
//
//         List<DocumentSnapshot> appointments = snapshot.data!.docs;
//         List<DocumentSnapshot> doctorAppointments = appointments.where((appointment) => appointment['doctor'] == 'Dr. Shailendra').toList();
//
//         return ListView.builder(
//           itemCount: doctorAppointments.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(doctorAppointments[index]['patientName']),
//               subtitle: Text(doctorAppointments[index]['appointmentTime']),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     title: 'Doctor Appointments',
//     home: MyDoctor(),
//   ));
// }
