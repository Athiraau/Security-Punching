// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:slide_digital_clock/slide_digital_clock.dart';

class Clock extends StatefulWidget {
  const Clock({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DigitalClock(
      areaDecoration: BoxDecoration(color: Color.fromARGB(0, 247, 242, 242)),
      areaAligment: AlignmentDirectional.center,
      //minuteDigitDecoration:
      // BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0)),
      hourMinuteDigitTextStyle: TextStyle(fontSize: 20, color: Colors.white),
      secondDigitTextStyle: TextStyle(fontSize: 20, color: Colors.white),
    ));
  }
}
