import 'package:flutter/material.dart';
import 'package:flutter_foodybite/screens/Signup.dart';
<<<<<<< HEAD
import 'package:flutter_foodybite/screens/achivements.dart';
=======
>>>>>>> 3bc062bc82ccc156563530099e4cb58fad741206
import 'package:flutter_foodybite/screens/home.dart';
import 'package:flutter_foodybite/screens/main_screen.dart';
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
<<<<<<< HEAD
      home: AchievementsPage(),
      routes: {
        '/home':(context)=>AchievementsPage()
      },
=======
      home: SignUpPage(),
      routes: {'/home': (context) => MainScreen()},
>>>>>>> 3bc062bc82ccc156563530099e4cb58fad741206
    );
  }
}
