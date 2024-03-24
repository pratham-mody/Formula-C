// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:formula_c/screens/home.dart';
import 'package:formula_c/screens/main_screen.dart';
import 'package:formula_c/util/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
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
