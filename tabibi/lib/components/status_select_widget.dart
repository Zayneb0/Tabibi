import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_select_model.dart';
export 'status_select_model.dart';

/// Doctor-side status selector for one appointment (Pending / Confirmed /
/// Refused).
///
/// Writes the choice to Firestore.
class StatusSelectWidget extends StatefulWidget {
  const StatusSelectWidget({
    super.key,
    this.appointmentRef,
    String? status,
  }) : this.status = status ?? 'Pending';

  final DocumentReference? appointmentRef;
  final String status;

  @override
  State<StatusSelectWidget> createState() => _StatusSelectWidgetState();
}

class _StatusSelectWidgetState extends State<StatusSelectWidget> {
  late StatusSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusSelectModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.statusSelectFieldValueController ??=
          FormFieldController<String>(
        _model.statusSelectFieldValue ??= functions.statusLabel(widget!.status),
      ),
      options: ['Pending', 'Confirmed', 'Refused'],
      onChanged: (val) async {
        safeSetState(() => _model.statusSelectFieldValue = val);
        await widget!.appointmentRef!.update(createAppointmentsRecordData(
          status: _model.statusSelectFieldValue,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Status updated.',
              style: TextStyle(),
            ),
            duration: Duration(milliseconds: 4000),
          ),
        );
      },
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      hintText: 'Status',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).alternate,
      borderWidth: 1.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
