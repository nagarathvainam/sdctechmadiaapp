import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/newuser.dart';

class Accountdetails extends StatefulWidget {
  const Accountdetails({super.key, required this.title});

  final String title;

  @override
  State<Accountdetails> createState() => AccountdetailsState();
}

class AccountdetailsState extends State<Accountdetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.only(left: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Enter Recipient Details ",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            Text(
              "Your details will be verified once entered ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Container(
              width: 355,
              height: 154,

              decoration: BoxDecoration(
                color: Color(0xffFFEAAB),

                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(16),
              //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffF3BC18), width: 1),
                  borderRadius: BorderRadius.circular(19),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Icon(Icons.account_balance, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Bank details",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 65,
                      height: 18,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.payment, color: Colors.black, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "UPI",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container(
            //   width: 355,
            //   height: 54,
            //   decoration: BoxDecoration(
            //     color: Color(0xffFFEAAB),
            //     borderRadius: BorderRadius.circular(15),
            //
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
