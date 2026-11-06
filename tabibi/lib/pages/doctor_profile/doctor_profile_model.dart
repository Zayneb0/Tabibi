import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/doctor_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'doctor_profile_widget.dart' show DoctorProfileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorProfileModel extends FlutterFlowModel<DoctorProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomNav.
  late DoctorNavBarModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => DoctorNavBarModel());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
