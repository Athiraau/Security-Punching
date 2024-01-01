// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

void clearDashTextField() {
  DashTextField._dashTextFieldState?.clearTextFieldValue();
}

class DashTextField extends StatefulWidget {
  const DashTextField({
    Key? key,
    this.width,
    this.height,
    this.lostFocusAction,
    this.obscureText,
    this.hintText,
    this.labelText,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
    this.isFilled,
    this.textColor,
    this.errorBorderColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? lostFocusAction;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;
  final bool? isFilled;
  final Color? textColor;
  final Color? errorBorderColor;

  @override
  State<DashTextField> createState() => DashTextFieldState();
  static DashTextFieldState? _dashTextFieldState;
}

class DashTextFieldState extends State<DashTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  String? _textFieldValue;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _controller = TextEditingController();
    DashTextField._dashTextFieldState = this;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      if (widget.lostFocusAction != null) {
        widget.lostFocusAction!();
      }
    }
  }

  void clearTextFieldValue() {
    setState(() {
      _controller.clear();
      FFAppState().update(() {
        FFAppState().lostFocusTextfieldValue = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        style: TextStyle(fontFamily: 'Primary Family', fontSize: 14),
        controller: _controller,
        onChanged: (value) {
          setState(() {
            _textFieldValue = value;
            // add a local state variable here and update it's value from the _textFieldValue
            FFAppState().update(() {
              FFAppState().lostFocusTextfieldValue = _textFieldValue!;
            });
          });
        },
        focusNode: _focusNode,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          //labelStyle: TextStyle(color: widget.textColor ?? Colors.black),
          hintStyle: TextStyle(color: widget.textColor ?? Colors.black),
          fillColor: widget.backgroundColor ?? Colors.transparent,
          filled: widget.isFilled ?? false,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          //labelText: widget.labelText ?? "Label Text",
          hintText: widget.hintText ?? "Hint Text",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        //borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.0),
      ),
      // errorBorder: OutlineInputBorder(
      // borderSide: BorderSide(
      //  color: widget.errorBorderColor ?? Colors.red,
      //  width: widget.borderWidth ?? 1.0,
      // ),
      // borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.0),
      // ),
    );
  }
}
