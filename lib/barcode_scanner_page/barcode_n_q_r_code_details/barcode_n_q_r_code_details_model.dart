import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'barcode_n_q_r_code_details_widget.dart'
    show BarcodeNQRCodeDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BarcodeNQRCodeDetailsModel
    extends FlutterFlowModel<BarcodeNQRCodeDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QRnBarCodeDataRecord? fBUpload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
