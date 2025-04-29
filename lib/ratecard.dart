import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bank List',
//       home: adddistributor(),
//     );
//   }
// }

class RateCard extends StatefulWidget {
  @override
  _RateCardState createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
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
        'Cookie': 'PHPSESSID=j8t9056piln0fg7qi73ioggb64'
      };
      var dio = Dio();
      var response = await dio.request(
        'https://sdctech.in/Admin/fAmdm/ratecard_api.php',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.toString());
        print("responseCode:");
        print(result['responseCode']);

        print("responseMessage:");
        print(result['responseMessage']);

        print("responseData:");
        print(result['data']);

        setState(() {
          print(result['data']);
          allUsers =result['data'];
        print("Success fetching data:$allUsers");
        filteredUsers = allUsers;
        isLoading = false;
        });
        //print(json.encode(response.data['data']));
      }
      else {
        print("Errpr");
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
    final results = allUsers.where((user) {
      final name = user['option'].toString().toLowerCase();
      final bank = user['amount'].toString().toLowerCase();
      return name.contains(query.toLowerCase()) || bank.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredUsers = results;
    });
  }

  Widget buildUserTile(user) {
    return Card(
      child: ListTile(

        title: Text(user['option']),
        subtitle: Text('No Of Show: ${user['no_of_show']}\n${user['amount']}'),
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bank Accounts')),
      body: isLoading
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
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return buildUserTile(filteredUsers[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
