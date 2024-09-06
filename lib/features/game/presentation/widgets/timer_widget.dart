import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid_test_app/features/home/presentation/pages/home_page.dart';

class TimerWidget extends StatefulWidget {
  final int seconds;
  const TimerWidget({super.key, required this.seconds});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _seconds = widget.seconds;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game over'),
          content: const Text('Time is up!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
        _showTimeUpDialog();
      }
    });
  }

  String getFormattedTime() {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 139,
      decoration: BoxDecoration(
        color: const Color(0xFFCC620C),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.fromLTRB(16, 13, 16.7, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
            child: SizedBox(
              width: 38,
              child: Text(
                'timer',
                style: GoogleFonts.getFont(
                  'Share',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 1,
                  letterSpacing: -0.5,
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                ),
              ),
            ),
          ),
          Text(
            getFormattedTime(),
            style: GoogleFonts.getFont(
              'Share',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
