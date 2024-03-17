import 'package:flutter/material.dart';

class Constants {
  static String appName = "Foody Bite";

  // Colors for theme
  static Color lightPrimary = Color(0xFFFFFFFF); // White
  static Color darkPrimary = Colors.black; // Black
  static Color lightAccent = Color(0xFF5563FF); // Blue
  static Color darkAccent = Color(0xFF5563FF); // Blue
  static Color lightBG = Color(0xFFFAFAFA); // Light grayish
  static Color darkBG = Color(0xFF121212); // Dark grayish
  static Color ratingBG =
      Colors.yellow[600]!; // Yellow (can be adjusted as needed)

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: lightPrimary,
      secondary: lightAccent,
      background: lightBG,
    ),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: darkPrimary, // Adjust icon color for better contrast
        size: 18.0,
      ),
      titleTextStyle: TextStyle(
        color: darkPrimary, // Adjust title text color for better contrast
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: darkPrimary,
      secondary: darkAccent,
      background: darkBG,
    ),
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: lightPrimary, // Adjust icon color for better contrast
        size: 18.0,
      ),
      titleTextStyle: TextStyle(
        color: lightPrimary, // Adjust title text color for better contrast
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
