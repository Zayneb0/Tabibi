import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'book_appointment_widget.dart' show BookAppointmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookAppointmentModel extends FlutterFlowModel<BookAppointmentWidget> {
  ///  Local state fields for this page.

  String? selectdate;

  String? selecthour;

  bool? showAll = false;

  bool? earliestFirst = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in BookButton widget.
  List<AppointmentsRecord>? existingSlot;
  // Stores action output result for [Backend Call - Read Document] action in BookButton widget.
  UserRecord? doctorDoc;
  // Stores action output result for [Backend Call - Create Document] action in BookButton widget.
  AppointmentsRecord? document;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
