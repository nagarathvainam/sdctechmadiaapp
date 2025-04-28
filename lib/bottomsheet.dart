import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:dio/dio.dart';

class BtSheet extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BtSheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  apicall(ro_num, name, address, gst) async {
    var headers = {
      'userTypeId': '2',
      'deviceId': '987ioi75',
      'deviceIP': '10.236.52.17',
      'location': '12.36321,14.2563',
      'browserInfo': 'mobile',
      'versionId': 'v1',
      'ssId': 'M2V1OFBNS1NVcWMrOUlFdjM3UnBkOXlUaFhIWVE2MU1Vb0pRSTJpSmdxOD0',
      'Cookie': 'PHPSESSID=ohsccuokdm98cjfsqn054u8oi0',
    };
    var data = FormData.fromMap({
      'producer_distributor_name': '$name',
      'address': '$address',
      'gst': '$gst',
      'ro_number': '$ro_num',
    });

    var dio = Dio();
    var response = await dio.request(
      'https://sdctech.in/Admin/fAmdm/producer_distributor.php',
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.toString());
      var responseMessage = result['responseMessage'];
      print(responseMessage);
      //String snackBar = SnackBar(content: Text("$responseMessage"));

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("$responseMessage")));
    } else {
      print(response.statusMessage);
    }
  }

  void _showBottomSheet(BuildContext context) {
    bool isLoading = false; // Move isLoading outside StatefulBuilder

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'ro_num',
                          decoration: InputDecoration(labelText: 'Ro'),
                        ),
                        FormBuilderTextField(
                          name: 'name',
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        FormBuilderTextField(
                          name: 'address',
                          decoration: InputDecoration(labelText: 'Address'),
                        ),
                        FormBuilderTextField(
                          name: 'gst',
                          decoration: InputDecoration(labelText: 'Gst'),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : () async {
                              setState(
                                () => isLoading = true,
                              ); // Set loading state

                              // Simulate API call
                              await Future.delayed(Duration(seconds: 2));

                              setState(
                                () => isLoading = false,
                              ); // Reset loading state
                              apicall(
                                _formKey.currentState?.fields['ro_num']?.value,
                                _formKey.currentState?.fields['name']?.value,
                                _formKey.currentState?.fields['address']?.value,
                                _formKey.currentState?.fields['gst']?.value,
                              );
                              Navigator.pop(context); // Close BottomSheet
                            },

                    child:
                        isLoading
                            ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text("Loading..."),
                              ],
                            )
                            : Text("Submit"),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      _formKey.currentState
          ?.reset(); // Clear form fields when BottomSheet closes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheet & Form")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: Text("Open BottomSheet"),
        ),
      ),
    );
  }
}
