import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdctechmedia/adddistributor.dart';
import 'package:sdctechmedia/auth/auth_bloc.dart';
import 'package:sdctechmedia/auth/auth_repository.dart';
import 'package:sdctechmedia/bottomsheet.dart';
import 'package:sdctechmedia/dashboard.dart';
import 'package:sdctechmedia/enteramount.dart';
import 'package:sdctechmedia/forgetpassword.dart';
import 'package:sdctechmedia/newlogin.dart';
import 'package:sdctechmedia/newuser.dart';
import 'package:sdctechmedia/login.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:sdctechmedia/ratecard.dart';
import 'package:sdctechmedia/splash.dart';
import 'package:sdctechmedia/successdetails.dart';
import 'package:sdctechmedia/withdrawalfailed.dart';
import 'package:sdctechmedia/withdrawalpending.dart';
import 'package:sdctechmedia/withdrawalsuccess.dart';
import 'package:sdctechmedia/language.dart';
import 'package:sdctechmedia/listsilideaction.dart';
import 'package:sdctechmedia/theatreList.dart';

import 'accountdetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  final authRepository = AuthRepository();
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init(),
  ]).then((value) {
print("Init Value:");
print(value);

  });

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(authRepository: authRepository),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login BLoC',
        home: SplashPage(title: 'Splash'), // Now LoginScreen can access AuthBloc
      ),
    )/*SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashPage(title: "SDC"),
        //routes: AppRoutes.routes,
      ),
    )*/;
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
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
      appBar: AppBar(
        titleSpacing: 00.0, // (

        title: Text("Header"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Body")],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xff44916B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(children: <Widget>[Text("Footer")]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
