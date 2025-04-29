import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdctechmedia/newlogin.dart';

import 'accountdetails.dart';

class ratecard extends StatefulWidget {
  @override
  ratecardState createState() => ratecardState(

  );

}

class ratecardState extends State{
  List<dynamic> allOption = [];
  List<dynamic> filteredOption = [];
  TextEditingController controller = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {

    super.initState();
    fetchUsers();

  }
  Future<void> fetchUsers() async {
    try {
      final response = await Dio().get('https://sdctech.in/Admin/fAmdm/ratecard_api.php'); // Replace with your endpoint
      setState(() {
        allOption = response.data;
        filteredOption = allOption;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  void filterSearch(String query) {
    final results = allOption.where((user) {
      final name = user['option'].toString().toLowerCase();
      final bank = user['amount'].toString().toLowerCase();
      return name.contains(query.toLowerCase()) || bank.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredOption = results;
    });
  }
  Widget buildUserTile(user) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Text(user['option'][0]),
        ),
        title: Text(user['option']),
        subtitle: Text('NO OF SHOW: ${user['no_of_show']}\nAMOUNT: ${user['amount']}\nAMOUNT IN TAX: ${user['amount_in_tax']},'),
        isThreeLine: true,
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                MaterialPageRoute(
                  builder: (context) => newlogin(),
                ),
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
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(

                      child:Image.asset('assets/logo.png', height:30,width: 30,)
                  ), // replace with your logo path

                ],
              ),
            ),
            SizedBox(height:5),
            Text("Services", style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold)),
            _buildDrawerItem(Icons.movie, "Release Order"),
            _buildDrawerItem(Icons.people, "Producers/Distributors"),
            _buildDrawerItem(Icons.money, "Rate Card"),
            _buildDrawerItem(Icons.language, "Language"),
            _buildDrawerItem(Icons.theaters, "Theatre"),
            _buildDrawerItem(Icons.local_movies, "Movies"),
            _buildDrawerItem(Icons.map, "States"),
            SizedBox(height: 10),
            Text("Admin", style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold)),
            _buildDrawerItem(Icons.settings_cell, "Settings"),
            _buildDrawerItem(Icons.account_circle_outlined,"Admin User"),
            _buildDrawerItem(Icons.password, "Change Password"),
            _buildDrawerItem(Icons.logout, "Logout"),

          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
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
        title: Text("Name:"+PrefUtils().getname()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.power_settings_new, color: Colors.black),
              onPressed: () {
                _showLogoutDialog(context);// handle logout or exit logic here
              },
            ),
          )
        ],
      ),
      body:
      isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: filterSearch,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOption.length,
              itemBuilder: (context, index) {
                return buildUserTile(filteredOption[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      tileColor: Colors.blue[800],
      onTap: () {if (title == "Logout") {
        _showLogoutDialog(context); // 🚀 call the same logout dialog
      } else if (title == "Rate Card") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ratecard()),
        );
      } else {
        // Handle other navigation here if needed
      }},
    );
  }
}

