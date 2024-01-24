import 'package:flutter/material.dart';

class DoctorBox extends StatelessWidget {

  final String name;

  DoctorBox({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),),
              ),
              Container(
                child: Column(
                  children: [
                    Text("April 24, 2024"),
                    Text("02:30 PM IST")
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
