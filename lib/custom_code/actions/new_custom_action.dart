// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> newCustomAction(
  BuildContext context,
  String? varBrRst,
  Future Function()? codeTypeResult,
) async {
  if (varBrRst != null) {
    // check varBrRst value  if the format is 18  digits and  contains 1Z  set "UPs" to codeTypeResult
    if (varBrRst != null && varBrRst.length == 18 && varBrRst.contains("1Z")) {
      await codeTypeResult?.call();
      return "UPs";
    } else if (varBrRst != null &&
        varBrRst.length == 12 &&
        varBrRst.startsWith('a') &&
        varBrRst.endsWith('a')) {
      return 'barcode';
    } else if (varBrRst.length == 22) {
      return " USPS ";
    } else if (varBrRst.length == 10) {
      return " DHL ";
    } else if (varBrRst.length == 34) {
      return " Fedex ";
    } else if (varBrRst != null && varBrRst.contains("TBA")) {
      await codeTypeResult?.call();
      return "Amazon US Logistics";
    } else if (varBrRst != null && varBrRst.contains("TBC")) {
      await codeTypeResult?.call();
      return "Amazon Canada Logistics";
    } else {
      // perform default action
      return await codeTypeResult?.call();
    }
  }
  return null;
}
