import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  late int _remainingTime;
  bool _isRunning = false;
  String _displayTime = "00:00";
  late Duration _initialTime;

  @override
  void initState() {
    super.initState();
    _initialTime = const Duration(minutes: 10);
    _remainingTime = _initialTime.inSeconds;
    _displayTime = _formatTime(_remainingTime);
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secondsStr";
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!_isRunning || _remainingTime <= 0) return false;

      setState(() {
        _remainingTime--;
        _displayTime = _formatTime(_remainingTime);
      });

      return true;
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _remainingTime = _initialTime.inSeconds;
      _displayTime = _formatTime(_remainingTime);
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
                  icon: const Icon(Icons.play_arrow),
                  onPressed: _isRunning ? null : _startTimer,
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: !_isRunning ? null : _stopTimer,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _resetTimer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
