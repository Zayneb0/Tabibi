import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'status_select_widget.dart' show StatusSelectWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusSelectModel extends FlutterFlowModel<StatusSelectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for StatusSelectField widget.
  String? statusSelectFieldValue;
  FormFieldController<String>? statusSelectFieldValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
