import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/newuser.dart';

import 'accountdetails.dart';

class withdrawalpending extends StatefulWidget {
  @override
  withdrawalpendingState createState() => withdrawalpendingState();
}

class withdrawalpendingState extends State<withdrawalpending> {
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
                color: Color(0xffFFF3CD),
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xffFFC107),
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Pending!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Your request has been processed.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
