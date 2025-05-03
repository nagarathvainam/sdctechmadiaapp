import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/pref_utils.dart';

class Api {
  var responseMessage;
  var responseCode;
  var userid;
  var name;

  login(username, password) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {'Cookie': 'PHPSESSID=ohsccuokdm98cjfsqn054u8oi0'};
    var data = json.encode({'username': '$username', 'password': '$password'});

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
      print('logged id$userid');
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
  addratecard(option, noofshow, amount, amountintax) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    try{
      var headers = {'Cookie': 'PHPSESSID=ohsccuokdm98cjfsqn054u8oi0'};
      var data = json.encode({'option': '$option', 'noofshow': '$noofshow','amount': '$amount','amount_in_tax': '$amountintax','user_id': PrefUtils().getuserid()});

      var dio = Dio();
      var response = await dio.request(
        'https://sdctech.in/Admin/fAmdm/create_update_rate_card_api.php',
        options: Options(method: 'POST', headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.toString());
        responseMessage = result['responseMessage'];
        responseCode = result['responseCode'];
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
   on DioException catch (e) {
  //responseCode = e.response!.statusCode as String;
  //responseMessage=result['responseMessage'];
  print('GSTVerify Status code: ${e.response?.statusCode}');
  print('GSTVerify data: ${e.response?.data}');
  var errresult = json.encode(e.response?.data);
  print(errresult);
  responseCode = "400";
  responseMessage = "GST fetch failed/ Wrong details entered";

  return "Failure!";
  }
  }
  adddistributor(producerdistributorName, filmcircuitarea, address, shipaddress, sameasshipping,
      gst, contactnumber, contactperson, contactemail, companyvattin, companycstno, companyservicetaxno, companypan, state) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    try{
      var headers = {'Cookie': 'PHPSESSID=ohsccuokdm98cjfsqn054u8oi0'};
      var data = json.encode({'producer_distributor_name': '$producerdistributorName', 'film_circuit_area': '$filmcircuitarea',
        'address': '$address','ship_address': '$shipaddress','same_as_shipping': '$sameasshipping',
        'gst': '$gst','contact_number': '$contactnumber','contact_person': '$contactperson',
        'email': '$contactemail','company_vat_tin': '$companyvattin','company_cst_no': '$companycstno',
        'company_service_tax_no': '$companyservicetaxno',
        'company_pan': '$companypan','state': '$state','user_id': PrefUtils().getuserid()});
print(data);
      var dio = Dio();
      var response = await dio.request(
        'https://sdctech.in/Admin/fAmdm/create_update_distributor_api',
        options: Options(method: 'POST', headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.toString());
        print("add distributor response msg");
        responseMessage = result['responseMessage'];
        print("add distributor response code");
        responseCode = result['responseCode'];
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
    on DioException catch (e) {
      //responseCode = e.response!.statusCode as String;
      //responseMessage=result['responseMessage'];
      print('GSTVerify Status code: ${e.response?.statusCode}');
      print('GSTVerify data: ${e.response?.data}');
      var errresult = json.encode(e.response?.data);
     // print(errresult);
      responseCode = "400";
      responseMessage = "GST fetch failed/ Wrong details entered";

      return "Failure!";
    }
  }
List statedata=[];
  Future<String> getStateData() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=j8t9056piln0fg7qi73ioggb64',
    };
    var dio = Dio();
    var response = await dio.request(
        'https://sdctech.in/Admin/fAmdm/film_circuit_area_api.php',
      options: Options(method: 'POST', headers: headers),
    );
print("response.statusCode");
print(response.statusCode);
    if (response.statusCode == 200) {
      var result = json.decode(response.toString());

      print("Circuit Area:");
      print(result);

      responseMessage = result['responseMessage'];
      responseCode = result['responseCode'];
      print(responseMessage);
      print(responseCode);

      statedata=result['data'];

      //String snackBar = SnackBar(content: Text("$responseMessage"));

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(SnackBar(content: Text("$responseMessage")));
    } else {
      print(response.statusMessage);
    }

    return "Success!";
  }
}
