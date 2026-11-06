import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'sign_in_user_widget.dart' show SignInUserWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignInUserModel extends FlutterFlowModel<SignInUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for mdp widget.
  late FocusNode mdpPasswordVisibilityFocusNode;
  FocusNode? mdpFocusNode;
  TextEditingController? mdpTextController;
  late bool mdpVisibility;
  String? Function(BuildContext, String?)? mdpTextControllerValidator;
  // State field(s) for resetmdp widget.
  late FocusNode resetmdpPasswordVisibilityFocusNode;
  FocusNode? resetmdpFocusNode;
  TextEditingController? resetmdpTextController;
  late bool resetmdpVisibility;
  String? Function(BuildContext, String?)? resetmdpTextControllerValidator;

  @override
  void initState(BuildContext context) {
    mdpPasswordVisibilityFocusNode = FocusNode();
    mdpVisibility = false;
    resetmdpPasswordVisibilityFocusNode = FocusNode();
    resetmdpVisibility = false;
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    mdpFocusNode?.dispose();
    mdpTextController?.dispose();
    mdpPasswordVisibilityFocusNode.dispose();
    resetmdpFocusNode?.dispose();
    resetmdpTextController?.dispose();
    resetmdpPasswordVisibilityFocusNode.dispose();
  }
}
