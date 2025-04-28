import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/pref_utils.dart';

class Api{
 var responseMessage;
 var responseCode;
 var userid;
 var name;

  login(username, password) async {
   // final SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {

      'Cookie': 'PHPSESSID=ohsccuokdm98cjfsqn054u8oi0',
    };
    var data = json.encode({
      'username': '$username',
      'password': '$password'
    });

    var dio = Dio();
    var response = await dio.request(
      'https://sdctech.in/Admin/fAmdm/login_api.php',
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.toString());
      responseMessage = result['responseMessage'];
      responseCode = result['responseCode'];
      userid = result['data']['id'];
      name = result['data']['name'];
     // await prefs.setString('userid', userid);
      PrefUtils().setuserid(userid);
      PrefUtils().setname(name);
      //await prefs.setString('name', name);
      print(responseMessage);
      print(responseCode);
      //String snackBar = SnackBar(content: Text("$responseMessage"));

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(SnackBar(content: Text("$responseMessage")));
    } else {
      print(response.statusMessage);
    }
  }
}