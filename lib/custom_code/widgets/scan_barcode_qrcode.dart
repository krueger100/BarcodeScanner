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
import 'package:flutter/services.dart';

class ScanBarcodeQrcode extends StatefulWidget {
  const ScanBarcodeQrcode({
    Key? key,
    this.width,
    this.height,
    this.autoScanResult,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? autoScanResult;

  @override
  State<ScanBarcodeQrcode> createState() => _ScanBarcodeQrcodeState();
}

class _ScanBarcodeQrcodeState extends State<ScanBarcodeQrcode> {
  String barcodeScanResult = 'No data';

  Future<void> scanBarcode() async {
    try {
      String barcodeResult = await BarcodeScanner.scan();
      setState(() {
        barcodeScanResult = barcodeResult;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcodeScanResult = 'Camera permission denied';
        });
      } else {
        setState(() {
          barcodeScanResult = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() {
        barcodeScanResult = 'User returned without scanning';
      });
    } catch (e) {
      setState(() {
        barcodeScanResult = 'Unknown error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: scanBarcode,
            child: Text('Scan Barcode/QRCode'),
          ),
          SizedBox(height: 20),
          Text('Result: $barcodeScanResult'),
        ],
      ),
    );
  }
}
