import 'package:flutter/material.dart';
import 'package:flutter_pro/doctorinfo.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/userappointment.dart';
import 'package:firebase_core/firebase_core.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose()
  {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }



  void loginUser() async {

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // String result = "Success";

    String result = await AuthMethods().loginUser(email: email, password: password);

    if(result == "Success")
      {
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserAppointment()),
              );
      }
    else
      {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(result))
          );
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor/,

      body: SafeArea(

        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x61CEFF),
                Color(0x0EBE7E)

              ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/login_page.png'))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller:_emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((10)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller:_passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((10)))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    // mainAxisSize: ,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 27,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: loginUser,
                              // onPressed: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => UserAppointment()),
                              //   );
                              // },
                              icon: Icon(Icons.arrow_forward)))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'forgotpassword');
                          },
                          child: Text(
                            'forgot password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
