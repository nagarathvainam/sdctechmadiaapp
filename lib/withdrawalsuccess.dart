import 'dart:async';

import 'package:flutter/material.dart';

import 'package:untitled/newuser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'accountdetails.dart';

class withdrawalsuccess extends StatefulWidget {
  @override
  withdrawalsuccessState createState() => withdrawalsuccessState();
}

class withdrawalsuccessState extends State<withdrawalsuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //crossAxisAlignment: crossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffD1F5DD),
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/select.svg', // Load SVG image
                  width: 120,
                  height: 120,
                  color: Color(0xff1ACD54), // Make the icon white
                  // Icon(Icons.close,color: Colors.white, size: 41,),
                ),
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Payment has been successfully",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "ok",
              style: TextStyle(fontSize: 21, color: Color(0xff4ECB71)),
            ),
          ],
        ),
      ),
    );
  }
}
