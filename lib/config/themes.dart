import 'package:flutter/material.dart';
import 'package:timmer_app/config/colors.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'AfacadFlux',
  appBarTheme: const AppBarTheme(
      backgroundColor: lightblue,
      iconTheme: IconThemeData(color: black),
      titleTextStyle: TextStyle(color: black)),
  brightness: Brightness.light,
  primaryColor: black,
  scaffoldBackgroundColor: white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black54),
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'AfacadFlux',
  appBarTheme: const AppBarTheme(
      backgroundColor: blue,
      iconTheme: IconThemeData(color: white),
      titleTextStyle: TextStyle(color: white)),
  brightness: Brightness.dark,
  primaryColor: blue,
  scaffoldBackgroundColor: black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
