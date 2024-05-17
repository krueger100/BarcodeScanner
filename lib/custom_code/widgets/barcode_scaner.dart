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

import 'package:barcode_scan/barcode_scan.dart';

class BarcodeScaner extends StatefulWidget {
  const BarcodeScaner({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<BarcodeScaner> createState() => _BarcodeScanerState();
}

class _BarcodeScanerState extends State<BarcodeScaner> {
  String? scannedData;

  Future<void> _scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        scannedData = result.rawContent;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _scanBarcode,
            child: Text('Scan Barcode'),
          ),
          if (scannedData != null) Text('Scanned Data: $scannedData'),
        ],
      ),
    );
  }
}
