import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bot_image_widget.dart' show BotImageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BotImageModel extends FlutterFlowModel<BotImageWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UploadedPhotosRecord? uploadedImg;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
