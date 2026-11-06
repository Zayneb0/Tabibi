import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/patient_nav_bar_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'appointments_list_user_widget.dart' show AppointmentsListUserWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentsListUserModel
    extends FlutterFlowModel<AppointmentsListUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomNav.
  late PatientNavBarModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => PatientNavBarModel());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
