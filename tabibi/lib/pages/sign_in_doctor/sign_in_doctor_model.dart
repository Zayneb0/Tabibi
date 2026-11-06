import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'sign_in_doctor_widget.dart' show SignInDoctorWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignInDoctorModel extends FlutterFlowModel<SignInDoctorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for speciality widget.
  FocusNode? specialityFocusNode;
  TextEditingController? specialityTextController;
  String? Function(BuildContext, String?)? specialityTextControllerValidator;
  // State field(s) for experience widget.
  FocusNode? experienceFocusNode;
  TextEditingController? experienceTextController;
  String? Function(BuildContext, String?)? experienceTextControllerValidator;
  // State field(s) for about widget.
  FocusNode? aboutFocusNode;
  TextEditingController? aboutTextController;
  String? Function(BuildContext, String?)? aboutTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    specialityFocusNode?.dispose();
    specialityTextController?.dispose();

    experienceFocusNode?.dispose();
    experienceTextController?.dispose();

    aboutFocusNode?.dispose();
    aboutTextController?.dispose();
  }
}
