import 'dart:async';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sdctechmedia/dashboard.dart';
import 'package:sdctechmedia/login.dart';
import 'package:sdctechmedia/newlogin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), handleTimeout);

    super.initState();
  }

  Future<void> handleTimeout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // callback function
    // Do some work.
    print("Afer 5 seconds called");


    print('identify');
    print(PrefUtils().getname());
    if (PrefUtils().getuserid() != "") {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => dashboard()));
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => newlogin()));
    }
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: const CircularProgressIndicator(color: Color(0xffBD1A8D)),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
