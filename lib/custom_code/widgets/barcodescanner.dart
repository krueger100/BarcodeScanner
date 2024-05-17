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

import 'package:barcode_scanner/barcode_parsers/aamva.dart';
import 'package:barcode_scanner/barcode_parsers/aamva.g.dart';
import 'package:barcode_scanner/barcode_parsers/barcode_scanner.dart';
import 'package:barcode_scanner/barcode_parsers/boarding_pass.dart';
import 'package:barcode_scanner/barcode_parsers/boarding_pass.g.dart';
import 'package:barcode_scanner/barcode_parsers/de_medical_plan.dart';
import 'package:barcode_scanner/barcode_parsers/de_medical_plan.g.dart';
import 'package:barcode_scanner/barcode_parsers/id_card_pdf_417.dart';
import 'package:barcode_scanner/barcode_parsers/id_card_pdf_417.g.dart';
import 'package:barcode_scanner/barcode_parsers/medical_certificate.dart';
import 'package:barcode_scanner/barcode_parsers/medical_certificate.g.dart';
import 'package:barcode_scanner/barcode_parsers/sepa.dart';
import 'package:barcode_scanner/barcode_parsers/sepa.g.dart';
import 'package:barcode_scanner/barcode_parsers/vcard.dart';
import 'package:barcode_scanner/barcode_parsers/vcard.g.dart';
import 'package:barcode_scanner/barcode_scanning_data.dart';
import 'package:barcode_scanner/barcode_scanning_data.g.dart';
import 'package:barcode_scanner/classical_components/barcode_camera.dart';
import 'package:barcode_scanner/classical_components/barcode_live_detection.dart';
import 'package:barcode_scanner/classical_components/barcode_scanner_configuration.dart';
import 'package:barcode_scanner/classical_components/barcode_scanner_configuration.g.dart';
import 'package:barcode_scanner/classical_components/camera_configuration.dart';
import 'package:barcode_scanner/classical_components/camera_configuration.g.dart';
import 'package:barcode_scanner/classical_components/classical_camera.dart';
import 'package:barcode_scanner/classical_components/finder.dart';
import 'package:barcode_scanner/classical_components/hint.dart';
import 'package:barcode_scanner/classical_components/live_detection.dart';
import 'package:barcode_scanner/classical_components/shutter.dart';
import 'package:barcode_scanner/json/barcode_configuration_json.dart';
import 'package:barcode_scanner/json/barcode_configuration_json.g.dart';
import 'package:barcode_scanner/json/batch_barcode_configuration_json.dart';
import 'package:barcode_scanner/json/batch_barcode_configuration_json.g.dart';
import 'package:barcode_scanner/json/common.dart';
import 'package:barcode_scanner/json/common.g.dart';
import 'package:barcode_scanner/json/common_platform.dart';
import 'package:barcode_scanner/json/common_platform.g.dart';
import 'package:barcode_scanner/license.dart';
import 'package:barcode_scanner/meta.dart';
import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:barcode_scanner/scanbot_encryption_handler.dart';
import 'package:barcode_scanner/scanbot_sdk_models.dart';
import 'package:barcode_scanner/scanbot_sdk_models.g.dart';
import 'package:barcode_scanner/sdk_utils.dart';
import 'package:barcode_scanner/shared_calls.dart';
import 'package:json_annotation/json_annotation.dart';

class Barcodescanner extends StatefulWidget {
  const Barcodescanner({
    super.key,
    this.width,
    this.height,
    this.autoScanResult,
  });

  final double? width;
  final double? height;
  final String? autoScanResult;

  @override
  State<Barcodescanner> createState() => _BarcodescannerState();
}

class _BarcodescannerState extends State<Barcodescanner> {
  String _scanResult = '';

  @override
  void initState() {
    super.initState();
    _scanBarcode();
  }

  Future<void> _scanBarcode() async {
    // Use the barcode scanner utility from the package
    BarcodeScanner scanner = BarcodeScanner();

    // Scan the barcode
    BarcodeScanningData data = await scanner.scan();

    // Update the state with the scan result and set the autoScanResult
    setState(() {
      _scanResult = data.code;
      widget.autoScanResult = _scanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
