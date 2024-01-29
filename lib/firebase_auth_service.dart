
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pro/reg_doc_user.dart';
import 'register.dart';
import 'package:uuid/uuid.dart';




class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || username.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // add user to our databse
        _firestore.collection(global).doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword
        });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
  // Future <String> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   String result = "Some error occured";
  //
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       UserCredential user = await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       result = "Success";
  //     }
  //     else {
  //       result = "please enter all the fields";
  //     }
  //   } catch (err) {
  //     result = err.toString();
  //   }
  //
  //   return result;
  // }
// }
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = "Some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Check if the user is a doctor
        DocumentSnapshot doctorSnapshot = await _firestore.collection('Doctors').doc(userCredential.user!.uid).get();
        if (doctorSnapshot.exists) {
          // Navigate to doctor's page
          result = "Doctor";
        } else {
          // Navigate to patient's page
          result = "user";
        }
      } else {
        result = "Please enter all the fields";
      }
    } catch (error) {
      result = error.toString();
    }

    return result;
  }

  Future<String> addAppointment({
  required String name,
  required String date,
  required String time,
  required String doctor,
  required String phone,

}) async{

    String result = "Some error occured";

    try {
      if(name.isNotEmpty && phone.isNotEmpty && doctor.isNotEmpty && date.isNotEmpty && time.isNotEmpty)
        {
          var uuid = Uuid().v4();

          await _firestore
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .collection('myAppointments')
              .doc(uuid)
              .set({
            'id': uuid,
            'patient name': name,
            'date': date,
            'doctor': doctor,
            'phone': phone,
            'time': time,
          });

          result = "Successfully appointment booked";
        }
      else
        {

        }
    } catch (err) {
      result = err.toString();
    }

    return result;
  }

  Future <List> getUserAppointments() async
  {
    QuerySnapshot querySnapshot = await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('myAppointments').get();

    final data = querySnapshot.docs.map((doc) => doc.data()).toList();

    return data;
  }
}










