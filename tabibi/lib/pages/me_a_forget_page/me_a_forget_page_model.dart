import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'me_a_forget_page_widget.dart' show MeAForgetPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeAForgetPageModel extends FlutterFlowModel<MeAForgetPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailforget widget.
  FocusNode? emailforgetFocusNode;
  TextEditingController? emailforgetTextController;
  String? Function(BuildContext, String?)? emailforgetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailforgetFocusNode?.dispose();
    emailforgetTextController?.dispose();
  }
}
