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

import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Simplebarcodescanner extends StatefulWidget {
  const Simplebarcodescanner({
    super.key,
    this.width,
    this.height,
    this.autoScanResult,
  });

  final double? width;
  final double? height;
  final String? autoScanResult;

  @override
  State<Simplebarcodescanner> createState() => _SimplebarcodescannerState();
}

class _SimplebarcodescannerState extends State<Simplebarcodescanner> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
