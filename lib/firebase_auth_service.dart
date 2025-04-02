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
    required String specialization,
  }) async {
    String res = "Some error occured";

    if (global == 'users') {
      try {
        if (email.isNotEmpty ||
            username.isNotEmpty ||
            password.isNotEmpty ||
            confirmPassword.isNotEmpty) {
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
    } else {
      try {
        if (email.isNotEmpty ||
            username.isNotEmpty ||
            password.isNotEmpty ||
            confirmPassword.isNotEmpty) {
          // register user
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          print(cred.user!.uid);

          // add user to our databse
          _firestore
              .collection(global)
              .doc('specializations')
              .collection(specialization)
              .doc(cred.user!.uid)
              .set({
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
  }
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

        List<String> specs = ["ENT", "Physician", "Cardiologist", "Dentist"];
        // late DocumentSnapshot doctorSnapshot;
        for (String specialize in specs) {
          print(specialize);
          DocumentSnapshot doctorSnapshot = await _firestore
              .collection('Doctors')
              .doc('specializations')
              .collection(specialize)
              .doc(userCredential.user!.uid)
              .get();

          if(doctorSnapshot.exists) {
            print(result);
            result = "Doctor";
            break;
          }
        }

        if(!(result == "Doctor"))
          {
            print(result);
            result = "User";
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

    required String doctorName,
    required String doctorUid,
    required String doctorSpec,
    required String patientName,
    required String patientAge,
    required String patientMobile,
    required String date,
    required String shift,

  }) async {
    String result = "Some error occured";

    try {
      if (patientName.isNotEmpty &&
          patientMobile.isNotEmpty &&
          doctorName.isNotEmpty &&
          date.isNotEmpty &&
          shift.isNotEmpty &&
          doctorUid.isNotEmpty) {
        var uuid = Uuid().v4();
        var uuid2 = Uuid().v4();

        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection('myAppointments')
            .doc(uuid)
            .set({
          'id': uuid,
          'patient name': patientName,
          'date': date,
          'doctor': doctorName,
          'phone': patientMobile,
          'time': shift,
          'doc_uid': doctorUid,
          'doc_spec': doctorSpec,
          'doc_appointment_id': uuid2,
        });

        await _firestore
            .collection('Doctors')
            .doc("specializations")
            .collection(doctorSpec)
            .doc(doctorUid)
            .collection("myAppointments")
            .doc(uuid2)
            .set({
          'id': uuid2,
          'patient name': patientName,
          'date': date,
          // 'doctor': doctor,
          'phone': patientMobile,
          'time': shift,
          'pat_uid': _auth.currentUser!.uid,
          'pat_appointment_id': uuid,
        });

        result = "Successfully appointment booked";
      } else {}
    } catch (err) {
      result = err.toString();
    }

    return result;
  }

 Future <String> appointmentDelete({


   required String doctorUid,
   required String doctorSpec,
   required String doctorAppointmentId,
   required String patientUid,
   required String patientAppointmentId,
}) async
  {
    String result = "Error";

    try{
    //   user delete

      await _firestore
          .collection("users")
          .doc(patientUid)
          .collection("myAppointments")
          .doc(patientAppointmentId)
          .delete();

    //   doctor delete

      await _firestore
          .collection("Doctors")
          .doc("specializations")
          .collection(doctorSpec)
          .doc(doctorUid)
          .collection("myAppointments")
          .doc(doctorAppointmentId)
          .delete();

      result = "Successful";
    }
    catch (e){
      print(e);
    }

    return result;
  }
}
