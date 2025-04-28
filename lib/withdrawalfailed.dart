import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/newuser.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'accountdetails.dart';

class withdrawalfailed extends StatefulWidget {
  @override
  withdrawalfailedState createState() => withdrawalfailedState();
}

class withdrawalfailedState extends State<withdrawalfailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFDC7C7),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xffEA2020),

              child: SvgPicture.asset(
                'assets/close.svg', // Load SVG image
                width: 41,
                height: 41,
                color: Colors.white, // Make the icon white
                // Icon(Icons.close,color: Colors.white, size: 41,),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Move To Bank ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Failed",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
