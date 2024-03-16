// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_foodybite/screens/Signup.dart';
import 'package:flutter_foodybite/screens/home.dart';
import 'package:flutter_foodybite/screens/main_screen.dart';
//import 'package:flutter_foodybite/screens/maps_screen.dart';
// import 'package:flutter_foodybite/screens/maps_screen.dart';
import 'package:flutter_foodybite/screens/profile.dart';
import 'package:flutter_foodybite/util/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: SignUpPage(),
      routes: {'/home': (context) => MainScreen()},
    );
  }
}
