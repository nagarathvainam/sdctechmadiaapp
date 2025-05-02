import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sdctechmedia/addratecard.dart';
import 'package:sdctechmedia/distributorproducer.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:sdctechmedia/ratecard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdctechmedia/newlogin.dart';

import 'accountdetails.dart';

class dashboard extends StatefulWidget {
  @override
  dashboardState createState() => dashboardState();
}

class dashboardState extends State {
  bool loading = false;

  @override
  void initState() {}
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Close dialog
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  PrefUtils().setuserid("");
                  Navigator.of(context).pop(); // Close dialog

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Logged out successfully!'),
                      backgroundColor: Colors.green,
                      // duration: Duration(seconds: 2),
                    ),
                  );

                  //Future.delayed(Duration(seconds: 2), () {
                  //Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => newlogin()),
                    (e) => false,
                  );
                  // });
                },
                child: Text('Logout'),
              ),
            ],
          ),
    );
  }

  final List<Map<String, dynamic>> stats = [
    {"title": "Active States", "value": "30", "color": Colors.blue},
    {"title": "Active Cities", "value": "22", "color": Colors.lightBlue},
    {"title": "Active Movies", "value": "18", "color": Colors.amber},
    {"title": "Producers / Distributors", "value": "14", "color": Colors.green},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xffA3238E)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ), // replace with your logo path
                ],
              ),
            ),
            SizedBox(height: 5),


            Text(
              "Services",
              style: TextStyle(
                color: Color(0xff6C2C91),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildDrawerItem(Icons.movie, "Release Order"),
            _buildDrawerItem(Icons.people, "Producers/Distributors"),
            _buildDrawerItem(Icons.money, "Rate Card"),
            _buildDrawerItem(Icons.language, "Language"),
            _buildDrawerItem(Icons.theaters, "Theatre"),
            _buildDrawerItem(Icons.local_movies, "Movies"),
            _buildDrawerItem(Icons.map, "States"),
            SizedBox(height: 10),
            Text(
              "Admin",
              style: TextStyle(
                color: Color(0xff6C2C91),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildDrawerItem(Icons.settings_cell, "Settings"),
            _buildDrawerItem(Icons.account_circle_outlined, "Admin User"),
            _buildDrawerItem(Icons.password, "Change Password"),
            _buildDrawerItem(Icons.logout, "Logout"),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Image.asset(
                  'assets/logo.png', // replace with your logo image path
                  height: 50,
                  width: 50,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // this opens the drawer
                },
              ),
        ),
        title: Text("Name:" + PrefUtils().getname()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.power_settings_new, color: Colors.black),
              onPressed: () {
                _showLogoutDialog(context); // handle logout or exit logic here
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
          children:
              stats.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    color: item["color"],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item["value"],
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        item["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      tileColor: Color(0xffA3238E),
      onTap: () {
        if (title == "Logout") {
          _showLogoutDialog(context); // 🚀 call the same logout dialog
        } else if (title == "Rate Card") {
          setState(() {
            loading == true;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RateCard()),
          );
        }else if (title == "Producers/Distributors") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DistributorProducer()),
          );
        } else {
          // Handle other navigation here if needed
        }
      },
    );
  }
}
