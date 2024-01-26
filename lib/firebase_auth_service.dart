// import 'dart:js_interop';

// import 'package:flutter_pro/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,

}) async
  {
    String res = "Some error occured";

    try{
      if(email.isNotEmpty || username.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty){
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);

        // add user to our databse
        _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword
        });
        res = "Success";
      }
    }catch(err)
    {
      res = err.toString();
    }

    return res;
  }

  Future <String> loginUser({
    required String email,
    required String password,
}) async {
    String result = "Some error occured";

    try{
      if(email.isNotEmpty || password.isNotEmpty)
        {
          UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
          result = "Success";
        }
      else if(email.isEmpty || password.isEmpty)
      {
        result = "Please enter all the credentials";
      }
      else
        {
          result = "Wrong email or password";
        }
    }catch(err){
        result = err.toString();
    }

    return result;
  }

}

