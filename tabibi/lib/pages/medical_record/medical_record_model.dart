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
import 'medical_record_widget.dart' show MedicalRecordWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicalRecordModel extends FlutterFlowModel<MedicalRecordWidget> {
  ///  Local state fields for this page.

  bool? hasRecord = false;

  DocumentReference? recordRef;

  String? rCondition = '';

  String? rDiagnosis = '';

  String? rMedications = '';

  String? rTreatment = '';

  String? rAllergies = '';

  String? rNotes = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MedicalRecord widget.
  List<MedicalRecordRecord>? recordList;
  // Stores action output result for [Firestore Query - Query a collection] action in MedicalRecord widget.
  MedicalRecordRecord? record;
  // State field(s) for ConditionField widget.
  FocusNode? conditionFieldFocusNode;
  TextEditingController? conditionFieldTextController;
  String? Function(BuildContext, String?)?
      conditionFieldTextControllerValidator;
  // State field(s) for DiagnosisField widget.
  FocusNode? diagnosisFieldFocusNode;
  TextEditingController? diagnosisFieldTextController;
  String? Function(BuildContext, String?)?
      diagnosisFieldTextControllerValidator;
  // State field(s) for MedicationsField widget.
  FocusNode? medicationsFieldFocusNode;
  TextEditingController? medicationsFieldTextController;
  String? Function(BuildContext, String?)?
      medicationsFieldTextControllerValidator;
  // State field(s) for TreatmentField widget.
  FocusNode? treatmentFieldFocusNode;
  TextEditingController? treatmentFieldTextController;
  String? Function(BuildContext, String?)?
      treatmentFieldTextControllerValidator;
  // State field(s) for AllergiesField widget.
  FocusNode? allergiesFieldFocusNode;
  TextEditingController? allergiesFieldTextController;
  String? Function(BuildContext, String?)?
      allergiesFieldTextControllerValidator;
  // State field(s) for NotesField widget.
  FocusNode? notesFieldFocusNode;
  TextEditingController? notesFieldTextController;
  String? Function(BuildContext, String?)? notesFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in SaveRecordButton widget.
  MedicalRecordRecord? document;
  // Stores action output result for [Firestore Query - Query a collection] action in SaveRecordButton widget.
  MedicalRecordRecord? savedRecord;
  // Model for BottomNav.
  late PatientNavBarModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => PatientNavBarModel());
  }

  @override
  void dispose() {
    conditionFieldFocusNode?.dispose();
    conditionFieldTextController?.dispose();

    diagnosisFieldFocusNode?.dispose();
    diagnosisFieldTextController?.dispose();

    medicationsFieldFocusNode?.dispose();
    medicationsFieldTextController?.dispose();

    treatmentFieldFocusNode?.dispose();
    treatmentFieldTextController?.dispose();

    allergiesFieldFocusNode?.dispose();
    allergiesFieldTextController?.dispose();

    notesFieldFocusNode?.dispose();
    notesFieldTextController?.dispose();

    bottomNavModel.dispose();
  }
}
