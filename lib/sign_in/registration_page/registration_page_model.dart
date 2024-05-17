import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registration_page_widget.dart' show RegistrationPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationPageModel extends FlutterFlowModel<RegistrationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress_create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  // State field(s) for username_create widget.
  FocusNode? usernameCreateFocusNode;
  TextEditingController? usernameCreateTextController;
  String? Function(BuildContext, String?)?
      usernameCreateTextControllerValidator;
  // State field(s) for password_create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  // State field(s) for passwordConfirm_create widget.
  FocusNode? passwordConfirmCreateFocusNode;
  TextEditingController? passwordConfirmCreateTextController;
  late bool passwordConfirmCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCreateTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordConfirmCreateVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    usernameCreateFocusNode?.dispose();
    usernameCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    passwordConfirmCreateFocusNode?.dispose();
    passwordConfirmCreateTextController?.dispose();
  }
}
