// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ButtonFocus extends StatefulWidget {
  const ButtonFocus({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ButtonFocusState createState() => _ButtonFocusState();
}

var submit;

void buttonnew() async {
  submit.requestFocus();
}

class _ButtonFocusState extends State<ButtonFocus> {
  @override
  void initState() {
    super.initState();
    submit = FocusNode();
  }

  @override
  void dispose() {
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        focusNode: submit,
        autofocus: true,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Ok'),
      ),
    );
  }
}
