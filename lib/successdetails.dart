import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sdctechmedia/newuser.dart';

class Successdetails extends StatefulWidget {
  const Successdetails({super.key, required this.title});

  final String title;

  @override
  State<Successdetails> createState() => SuccessdetailsState();
}

class SuccessdetailsState extends State<Successdetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              child: ClipOval(child: Image.asset("assets/bank.png")),
            ),
            SizedBox(height: 10),
            Text(
              'Sathiya Murthy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('A/C NO: 6558001500017962'),
            Text('CHNB0038600'),
            SizedBox(height: 5),
            Text(
              '₹2500.00',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 5),
                Text('Completed', style: TextStyle(color: Colors.black)),
              ],
            ),
            //Divider(),
            SizedBox(height: 10),
            Text(
              '16 Jun 2023  hh:mm:ss',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Shop Name',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'Transaction ID: '),
                  TextSpan(
                    text: '315556852222',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'To: '),
                  TextSpan(
                    text: '33555021315',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'HDFC Bank',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text('Account Name:'),
            Text(
              'Jenny',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text('Account Number: '),
            Text(
              'XXX XXX XXXX 1315',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text('IFSC Code: '),
            Text(
              'HDFC0000301',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                  label: Text('Download'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  label: Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
