import 'package:flutter/material.dart';
import 'package:sdctechmedia/api.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/enteramount.dart';
import 'package:sdctechmedia/language.dart';
import 'package:sdctechmedia/ratecard.dart';

class AddLanguage extends StatefulWidget {
  const AddLanguage({super.key});

  @override
  State<AddLanguage> createState() => _AddLanguageState();
}
class _AddLanguageState extends State<AddLanguage> {
  int _counter = 0;
  bool loading = false;
  Api db=new Api();
  final LanguageController = TextEditingController();


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 00.0, // (

        title: Text("Add Language"),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  TextField(
                    controller: LanguageController,
                    decoration: InputDecoration(

                      hintText: "Language",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),


                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 30),
                      (loading==false)? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffBD1A8D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          elevation: 5,
                        ),
                        onPressed: ()  {
                          // Sign-in logic
                          setState(() {
                            loading = true;
                          });

                          db.addlanguage(LanguageController.text)
                              .whenComplete(() async {
                            var responseMessage = db.responseMessage;
                            print(db.responseCode);
                            if (db.responseCode == "200") {

                              setState(() {
                                loading =false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("$responseMessage")),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Language(),
                                ),
                              );
                            }
                            else {
                              setState(() {
                                loading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("$responseMessage")),
                              );
                            }
                          });
                        },


                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                            letterSpacing: 1,
                          ),
                        ),
                      ):CircularProgressIndicator(),
                    ],
                  ),




                ],

              )),
        ),
      ),
    );
  }
}
