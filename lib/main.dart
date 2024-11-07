import 'package:flutter/material.dart';
import 'package:timmer_app/config/themes.dart';
import 'package:timmer_app/features/main_screen.dart';

void main() {
  runApp(const TimmerApp());
}

class TimmerApp extends StatefulWidget {
  const TimmerApp({super.key});

  @override
  State<TimmerApp> createState() => _TimmerAppState();
}

class _TimmerAppState extends State<TimmerApp> {
  bool _isDarkTheme = true;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timmer App",
      theme: _isDarkTheme ? darkTheme : lightTheme,
      home: MainScreen(toggleTheme: _toggleTheme, isDarkTheme: _isDarkTheme),
    );
  }
}
