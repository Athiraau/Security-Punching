// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:camera/camera.dart';
import 'dart:convert';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key, this.width, this.height, this.myTakePicture})
      : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? myTakePicture;
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

CameraController? controller;
XFile? pictureFile;
List<CameraDescription>? cameras;
void clickPicture() async {
  pictureFile = await controller!.takePicture();

  final bytes = await XFile(pictureFile!.path).readAsBytes();
  String base64Image = base64Encode(bytes);

  if (pictureFile != null)
    Image.network(
      pictureFile!.path,
      height: 200,
    );

  FFAppState().update(() {
    FFAppState().LocalBase64Image = base64Image;
  });
}

class _CameraWidgetState extends State<CameraWidget> {
  List<CameraDescription>? getCameraList() {
    availableCameras().then((value) {
      cameras = value;
      controller = CameraController(
        cameras![0],
        ResolutionPreset.low,
      );
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
    return null;
  }

  @override
  void initState() {
    super.initState();
    getCameraList();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Stack(
      children: [
        SizedBox(
          height: widget.height ?? MediaQuery.of(context).size.height,
          width: widget.width ?? MediaQuery.of(context).size.width,
          child: CameraPreview(controller!),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: CameraPreview(controller!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
