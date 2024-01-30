// // This is not working properly ==> i made this page for the auth so that
// // if user is logged in then he does want to login again.
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_pro/login.dart';
// import 'package:flutter_pro/userappointment.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot){
//             if(snapshot.hasData)
//             {
//               return UserAppointment();
//             }else{
//               return MyLogin();
//             }
//           },
//
//         )
//     );
//   }
// }