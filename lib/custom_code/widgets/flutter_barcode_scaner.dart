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

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Add this import
import 'dart:io';

class FlutterBarcodeScaner extends StatefulWidget {
  const FlutterBarcodeScaner({
    Key? key,
    this.width,
    this.height,
    this.scannedData,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? scannedData;

  @override
  State<FlutterBarcodeScaner> createState() => _FlutterBarcodeScanerState();
}

class _FlutterBarcodeScanerState extends State<FlutterBarcodeScaner> {
  String? _barcodeScanResult;
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  void _initScan() async {
    _capturedImage = await _cameraController!.takePicture();

    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.DEFAULT,
    );

    if (barcodeScanResult == 'Canceled') {
      Fluttertoast.showToast(
        msg: 'Scan canceled',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    _processScanResult(barcodeScanResult);
  }

  void _processScanResult(String barcodeScanResult) async {
    if (barcodeScanResult == '-1') {
      Fluttertoast.showToast(
        msg: 'No barcode has been scanned',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    setState(() {
      _barcodeScanResult = barcodeScanResult;
    });

    String? codeType = await newCustomAction(
      context,
      _barcodeScanResult,
      () async {
        Fluttertoast.showToast(
          msg: 'Code Type Detected: $_barcodeScanResult',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Fluttertoast.showToast(
          msg: 'Ready to scan again',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    );

    codeType ??= 'barcode';

    if (_barcodeScanResult != '-1') {
      await FirebaseFirestore.instance.collection('QRnBarCodeData').doc().set(
        {'Value': _barcodeScanResult, 'Type': codeType, 'name': 'username'},
      );
    }

    _showScanResultDialog(codeType);
  }

  void _showScanResultDialog(String? codeType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Scan Result'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_capturedImage != null)
                    Image.file(File(_capturedImage!.path)),
                  SizedBox(height: 20),
                  Text(
                    'Barcode: ${_barcodeScanResult ?? 'No barcode scanned'}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Type: ${codeType ?? 'Unknown'}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Name: username',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (_barcodeScanResult == 'Canceled') {
                      setState(() {
                        _isCameraInitialized = true;
                        _barcodeScanResult = null;
                        _capturedImage = null;
                      });
                      _initializeCamera(); // Reinitialize the camera after dialog is closed
                    }
                  },
                  child: Text('Close'),
                ),
                if (_capturedImage != null)
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 20),
                                Text('Saving Image...'),
                              ],
                            ),
                          );
                        },
                      );
                      _saveImageToFirebase().then((_) {
                        Navigator.of(context)
                            .pop(); // Close the saving image progress dialog
                      });
                    },
                    child: Text('Save Image'),
                  ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // This will be called when the dialog is closed
      setState(() {
        _isCameraInitialized = true;
        _barcodeScanResult = null;
        _capturedImage = null;
      });
      _initializeCamera(); // Reinitialize the camera after dialog is closed
    });
  }

  Future<void> _saveImageToFirebase() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(File(_capturedImage!.path));
      Fluttertoast.showToast(
        msg: 'Image saved',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pop();
    } catch (e) {
      print('Error saving image : $e');
      Fluttertoast.showToast(
        msg: 'Failed to save image',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isCameraInitialized)
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _cameraController!.value.aspectRatio,
                child: CameraPreview(_cameraController!),
              ),
            ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed:
                    _initScan, // Trigger the scan when the button is pressed
                child: Text('Auto Scan Barcode'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}

Future<String?> newCustomAction(
  BuildContext context,
  String? varBrRst,
  Future Function()? codeTypeResult,
) async {
  if (varBrRst != null) {
    if (varBrRst != null && varBrRst.length == 18 && varBrRst.contains("1Z")) {
      await codeTypeResult?.call();
      return "UPs";
    } else if (varBrRst != null &&
        varBrRst.length == 12 &&
        varBrRst.startsWith('a') &&
        varBrRst.endsWith('a')) {
      return 'barcode';
    } else if (varBrRst.length == 22) {
      return "USPS";
    } else if (varBrRst.length == 10) {
      return "DHL";
    } else if (varBrRst.length == 34) {
      return "Fedex";
    } else if (varBrRst != null && varBrRst.contains("TBA")) {
      await codeTypeResult?.call();
      return "Amazon US Logistics";
    } else if (varBrRst != null && varBrRst.contains("TBC")) {
      await codeTypeResult?.call();
      return "Amazon Canada Logistics";
    } else {
      return await codeTypeResult?.call();
    }
  }
  return null;
}
