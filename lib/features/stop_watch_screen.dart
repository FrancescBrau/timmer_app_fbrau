import 'package:flutter/material.dart';
import 'package:timmer_app/features/chrono.dart';
import 'package:timmer_app/features/timer_screen.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback _toggleTheme;
  final bool _isDarkTheme;

  const MainScreen({
    required VoidCallback toggleTheme,
    required bool isDarkTheme,
    super.key,
  })  : _isDarkTheme = isDarkTheme,
        _toggleTheme = toggleTheme;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showStopwatch = true;

  void _toggleMode() {
    setState(() {
      _showStopwatch = !_showStopwatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chrono and Timmer App',
            style: TextStyle(fontSize: 28, fontFamily: 'AfacadFlux'),
          ),
          actions: [
            IconButton(
              onPressed: widget._toggleTheme,
              icon: Icon(
                  widget._isDarkTheme ? Icons.dark_mode : Icons.light_mode),
            ),
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Center(
              child: _showStopwatch ? const Chrono() : const TimerScreen(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: ElevatedButton(
                onPressed: _toggleMode,
                child: Text(
                    _showStopwatch ? 'Switch to Timer' : 'Switch to Chrono')),
          )
        ]));
  }
}
