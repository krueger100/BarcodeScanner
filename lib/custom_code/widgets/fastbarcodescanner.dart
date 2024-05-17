// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';

class Fastbarcodescanner extends StatefulWidget {
  const Fastbarcodescanner({
    super.key,
    this.width,
    this.height,
    this.fastScanResult,
  });

  final double? width;
  final double? height;
  final String? fastScanResult;

  @override
  State<Fastbarcodescanner> createState() => _FastbarcodescannerState();
}

class _FastbarcodescannerState extends State<Fastbarcodescanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: BarcodeCamera(
        types: const [BarcodeType.ean8, BarcodeType.ean13, BarcodeType.code128],
        resolution: Resolution.hd720,
        framerate: Framerate.fps30,
        mode: DetectionMode.pauseVideo,
        onScan: (code) => print(code),
        children: [
          MaterialPreviewOverlay(animateDetection: false),
          BlurPreviewOverlay(),
          Positioned(
            child: ElevatedButton(
              onPressed: () => CameraController.instance.resumeDetector(),
              child: Text('Resume'),
            ),
          )
        ],
      ),
    );
  }
}
