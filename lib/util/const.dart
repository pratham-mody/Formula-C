import 'package:flutter/material.dart';

class Constants {
  static String appName = "Foody Bite";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff5563ff);
  static Color darkAccent = Color(0xff5563ff);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color? ratingBG = Colors.yellow[600];

 static ThemeData lightTheme = ThemeData(
  backgroundColor: lightBG,
  primaryColor: lightPrimary,
  hintColor: lightAccent,
  cardColor: lightAccent,
  scaffoldBackgroundColor: lightBG,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: lightBG,
      size: 18.0,
    ),
     titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ).titleLarge,
  ),
);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    hintColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cardColor: darkAccent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
      color: lightBG,
      size: 18.0,
    ),
     titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ).titleLarge,
  ),
  );
}
