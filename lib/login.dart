import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sdctechmedia/newuser.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 00.0, // (

        title: Container(
          height: 523,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Center(child: Image.asset("assets/logo3.png")),
        ),
      ),

      backgroundColor: Color(0xff44916B),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 410,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 10, top: 30),

                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Login to Continue", textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: 260,
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                          ),
                          child: Text("Username", textAlign: TextAlign.start),
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                        ),
                        /*SizedBox(height: 10),
                      Text("Password"),
                      SizedBox(height: 10),*/
                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          width: 260,
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                          ),
                          child: Text("Password", textAlign: TextAlign.start),
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 30,
                          width: 260,
                          child: Text(
                            "Forget Password",
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          height: 64,
                          width: 291,
                          decoration: BoxDecoration(
                            color: Color(0xff44916B),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 2,
                              width: 130,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 130,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 260,
                          child: GestureDetector(
                            onTap: () {
                              // Handle the onTap gesture here
                              print("Container tapped!");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(title: ''),
                                ),
                                (e) => false,
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              //color: Colors.blue,
                              child: Center(
                                child: Text(
                                  "New User!",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //child: Text("New User", textAlign: TextAlign.center),

                          /* const Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 50),
                        Expanded(child: Text('New User', textAlign: TextAlign.center,)),
                         // Expanded(child: Text('Forget Password', textAlign: TextAlign.left,)),



                        ],*/
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /*bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: Text("Copy Right", textAlign: TextAlign.left)),

            Expanded(child: Text("Version:1.0.0", textAlign: TextAlign.right)),
          ],
        ),
      ), */
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class SecondRoute {
  const SecondRoute();
}
