import 'package:flutter/material.dart';
import 'package:flutter_pro/register.dart'; // Import your register page here

String global = "";

class RegDocUser extends StatelessWidget {
  const RegDocUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showDoctorSignUpDialog(context);
                global = "Doctors";
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Button border radius
                  side: BorderSide(color: Colors.green), // Border color
                ),
              ),
              child: Text('Doctor SignUp'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to User registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRegister()),
                );
                global = "users";
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Button border radius
                  side: BorderSide(color: Colors.green), // Border color
                ),
              ),
              child: Text('User SignUp'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDoctorSignUpDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Doctor SignUp'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter Doctor ID'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String enteredID = controller.text;
                if (enteredID == 'abc') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyRegister()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter the correct ID'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
