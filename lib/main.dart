// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_foodybite/screens/Signup.dart';
import 'package:flutter_foodybite/screens/achivements.dart';
import 'package:flutter_foodybite/screens/home.dart';
import 'package:flutter_foodybite/screens/label.dart';
import 'package:flutter_foodybite/screens/main_screen.dart';
//import 'package:flutter_foodybite/screens/maps_screen.dart';
// import 'package:flutter_foodybite/screens/maps_screen.dart';
import 'package:flutter_foodybite/screens/profile.dart';
import 'package:flutter_foodybite/screens/splash_screen.dart';
import 'package:flutter_foodybite/util/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await FlutterConfig.loadEnvVariables(); 
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
      home: MainScreen(),
      routes: {'/home': (context) => Home()},
    );
  }
}
