import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bank List', home: adddistributor());
  }
}

class adddistributor extends StatefulWidget {
  @override
  _adddistributorState createState() => _adddistributorState();
}

class _adddistributorState extends State<adddistributor> {
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
    try {
      final response = await Dio().get(
        'https://sdctech.in/Admin/fAmdm/ratecard_api.php',
      ); // Replace with your endpoint
      setState(() {
        var result = json.decode(response.toString());
        print(response);
        print(response.data[0]);
        allUsers = result['data'];
        filteredUsers = allUsers;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void filterSearch(String query) {
    final results =
        allUsers.where((user) {
          final name = user['option'].toString().toLowerCase();
          final bank = user['amount'].toString().toLowerCase();
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
        title: Text(user['option']),
        subtitle: Text(
          'No Of Show: ${user['no_of_show']}\nAmount: ${user['amount']}\nAmount(Tax): ${user['amount_in_tax']}',
        ),
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rate Card')),
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
}
