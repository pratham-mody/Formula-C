import 'dart:async';
import 'package:flutter/material.dart';
import 'package:formula_c/screens/maps_screen.dart';
// import 'package:your_flutter_project_name/map_sample.dart'; // Import your MapSample widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start a timer to navigate to MapSample after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context  ).pushReplacement(
        MaterialPageRoute(builder: (context) => MapsScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo_ace.jpeg'), // Image widget displaying the logo
      ),
    );
  }
}
