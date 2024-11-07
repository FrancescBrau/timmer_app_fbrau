import 'package:flutter/material.dart';
import 'package:timmer_app/features/stop_watch.dart';

class MainScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  const MainScreen({
    required this.toggleTheme,
    required this.isDarkTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
          style: TextStyle(fontSize: 28, fontFamily: 'AfacadFlux'),
        ),
        actions: [
          IconButton(
              onPressed: toggleTheme,
              icon: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: const StopwatchChrono(),
    );
  }
}
