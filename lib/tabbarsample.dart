import 'package:flutter/material.dart';
import 'package:sdctechmedia/login.dart';
import 'package:sdctechmedia/newuser.dart';

/// Flutter code sample for [TabBar].

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: LoginPage(title: "Bank details")),
            Center(child: RegisterPage(title: "UPI ID")),
            Center(child: Text("It's sunny here")),
          ],
        ),
      ),
    );
  }
}
