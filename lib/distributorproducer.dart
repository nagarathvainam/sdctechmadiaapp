import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/adddistributorproducer.dart';
import 'package:sdctechmedia/addratecard.dart';
import 'package:sdctechmedia/newlogin.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:sdctechmedia/ratecard.dart';



class DistributorProducer extends StatefulWidget {
  @override
  _DistributorProducerState createState() => _DistributorProducerState();
}

class _DistributorProducerState extends State<DistributorProducer> {
  List<dynamic> allUsers = [];
  List<dynamic> filteredUsers = [];
  TextEditingController controller = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    //try {

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=j8t9056piln0fg7qi73ioggb64',
    };
    var dio = Dio();
    var response = await dio.request(
      'https://sdctech.in/Admin/fAmdm/distributor_api.php',
      options: Options(method: 'POST', headers: headers),
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.toString());


      setState(() {

        allUsers = result['data'];
        print("Success fetching data:$allUsers");
        filteredUsers = allUsers;
        isLoading = false;
      });
      //print(json.encode(response.data['data']));
    } else {
      print("Error");
      print(response.statusMessage);
    }
    /*setState(() {
        print(response.data['data']);
        /*allUsers = response.data['data'];
        print("Success fetching data:$allUsers");
        filteredUsers = allUsers;
        isLoading = false;*/
      });*/
    /* } catch (e) {
      print('Error fetching data: $e');
    }*/
  }

  void filterSearch(String query) {
    final results =
    allUsers.where((user) {
      final name = user['producer_distributor_name'].toString().toLowerCase();
      final bank = user['contact_number'].toString().toLowerCase();
      return name.contains(query.toLowerCase()) ||
          bank.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredUsers = results;
    });
  }

  Widget buildUserTile(user) {
    return Card(
      child: ListTile(
        title: Text(user['producer_distributor_name']),
        subtitle: Text('Contact Person: ${user['contact_person']}\nContact Number: ${user['contact_number']}'),
        isThreeLine: true,
      ),
    );
  }

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
        title: Text('Producers/Distributors'),
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDistributorProducer()),
              );
            },
            child: Icon(Icons.add_circle_outline),
          ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return buildUserTile(filteredUsers[index]);
              },
            ),
          ),
        ],
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RateCard()),
          );
        }
        else if (title == "Producers/Distributors") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DistributorProducer()),
          );
        }else {
          // Handle other navigation here if needed
        }
      },
    );
  }
}
