import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sdctechmedia/dashboard.dart';
import 'package:sdctechmedia/newuser.dart';

import 'accountdetails.dart';
import 'package:sdctechmedia/api.dart';
class newlogin extends StatefulWidget {
  @override
  newloginState createState() => newloginState();
}

class newloginState extends State<newlogin> {
  bool rememberMe = false;
  bool loading = false;
  Api db=new Api();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Center(child: Image.asset("assets/logo.png")),
                //Icon(Icons.lock, size: 50, color: Colors.orange),
              ),
              SizedBox(height: 30),
              TextField(
controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Color(0xffBD1A8D)),
                  hintText: "User ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xffBD1A8D)),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                    activeColor: Colors.redAccent, // Optional: for styling
                  ),
                  const Text('Remember me', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Forgot your password? ',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Recover',
                            style: TextStyle(
                              color: Color(0xffBD1A8D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), */
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Sign-in logic
                      setState(() {
                        loading==true;
                      });

                      db.login(usernameController.text, passwordController.text).whenComplete(() async {
                        var responseMessage=db.responseMessage;
                        if(db.responseCode=="200"){
                          setState(() {
                            loading==false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  dashboard()),
                          );
                        }else{
                          setState(() {
                            loading==false;
                          });
                          ScaffoldMessenger.of(
                                 context,
                               ).showSnackBar(SnackBar(content: Text("$responseMessage")));
                        }
                      });
                    },
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
                    child:(loading==false)? Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),
                    ):CircularProgressIndicator(),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Text("Or create using social media"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.google, color: Colors.red),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.lightBlue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Sign up logic
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
