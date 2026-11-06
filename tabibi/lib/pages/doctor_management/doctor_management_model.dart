import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/doctor_nav_bar_widget.dart';
import '/components/stat_block_widget.dart';
import '/components/status_select_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'doctor_management_widget.dart' show DoctorManagementWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorManagementModel extends FlutterFlowModel<DoctorManagementWidget> {
  ///  Local state fields for this page.

  String? today = '';

  String? filter = 'today';

  int? todayCount = 0;

  int? pendingCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DoctorManagement widget.
  List<AppointmentsRecord>? todayApptsLoad;
  // Stores action output result for [Firestore Query - Query a collection] action in DoctorManagement widget.
  List<AppointmentsRecord>? pendingApptsLoad;
  // Model for StatBlock.
  late StatBlockModel statBlockModel1;
  // Model for StatBlock.
  late StatBlockModel statBlockModel2;
  // Models for StatusSelect_today.
  late FlutterFlowDynamicModels<StatusSelectModel> statusSelectTodayModels;
  // Models for StatusSelect_pending.
  late FlutterFlowDynamicModels<StatusSelectModel> statusSelectPendingModels;
  // Models for StatusSelect_confirmed.
  late FlutterFlowDynamicModels<StatusSelectModel> statusSelectConfirmedModels;
  // Models for StatusSelect_all.
  late FlutterFlowDynamicModels<StatusSelectModel> statusSelectAllModels;
  // Model for BottomNav.
  late DoctorNavBarModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    statBlockModel1 = createModel(context, () => StatBlockModel());
    statBlockModel2 = createModel(context, () => StatBlockModel());
    statusSelectTodayModels =
        FlutterFlowDynamicModels(() => StatusSelectModel());
    statusSelectPendingModels =
        FlutterFlowDynamicModels(() => StatusSelectModel());
    statusSelectConfirmedModels =
        FlutterFlowDynamicModels(() => StatusSelectModel());
    statusSelectAllModels = FlutterFlowDynamicModels(() => StatusSelectModel());
    bottomNavModel = createModel(context, () => DoctorNavBarModel());
  }

  @override
  void dispose() {
    statBlockModel1.dispose();
    statBlockModel2.dispose();
    statusSelectTodayModels.dispose();
    statusSelectPendingModels.dispose();
    statusSelectConfirmedModels.dispose();
    statusSelectAllModels.dispose();
    bottomNavModel.dispose();
  }
}
