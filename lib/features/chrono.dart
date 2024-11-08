import 'package:flutter/material.dart';

class Chrono extends StatefulWidget {
  const Chrono({super.key});

  @override
  ChronoState createState() => ChronoState();
}

class ChronoState extends State<Chrono> {
  final Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  String _displayTime = "00:00.00";

  void _updateTime() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 1));

      if (!_stopwatch.isRunning) {
        return false;
      }

      setState(() {
        final milliseconds = _stopwatch.elapsedMilliseconds;
        final minutes = (milliseconds ~/ 60000).toString().padLeft(2, '0');
        final seconds =
            ((milliseconds % 60000) ~/ 1000).toString().padLeft(2, '0');
        final millisecondsStr =
            ((milliseconds % 1000) ~/ 10).toString().padLeft(2, '0');
        _displayTime = "$minutes:$seconds.$millisecondsStr";
      });

      return true;
    });
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _stopwatch.start();
    });
    _updateTime();
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.reset();
      _displayTime = "00:00.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _displayTime,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_circle),
                  onPressed: _isRunning ? null : _startStopwatch,
                ),
                IconButton(
                  icon: const Icon(Icons.stop_circle),
                  onPressed: !_isRunning ? null : _stopStopwatch,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: _resetStopwatch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
