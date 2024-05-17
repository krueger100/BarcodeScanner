// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camera/camera.dart';

Future<String?> takePhoto() async {
  List<CameraDescription> cameras = await availableCameras();
  CameraController controller =
      CameraController(cameras[0], ResolutionPreset.high);

  try {
    await controller.initialize();
    XFile? imageFile = await controller.takePicture();
    if (imageFile != null) {
      // Return the path to the captured image
      return imageFile.path;
    } else {
      // Handle the case where the image is not captured successfully
      throw Exception('Failed to capture image');
    }
  } finally {
    // Always dispose of the controller after use to release resources
    await controller.dispose();
  }
}
