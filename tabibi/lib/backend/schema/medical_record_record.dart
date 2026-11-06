import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicalRecordRecord extends FirestoreRecord {
  MedicalRecordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "allergies" field.
  String? _allergies;
  String get allergies => _allergies ?? '';
  bool hasAllergies() => _allergies != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "treatment" field.
  String? _treatment;
  String get treatment => _treatment ?? '';
  bool hasTreatment() => _treatment != null;

  // "Diagnosis" field.
  String? _diagnosis;
  String get diagnosis => _diagnosis ?? '';
  bool hasDiagnosis() => _diagnosis != null;

  // "CurrentMedications" field.
  String? _currentMedications;
  String get currentMedications => _currentMedications ?? '';
  bool hasCurrentMedications() => _currentMedications != null;

  // "patientRef" field.
  DocumentReference? _patientRef;
  DocumentReference? get patientRef => _patientRef;
  bool hasPatientRef() => _patientRef != null;

  // "doctorRef" field.
  DocumentReference? _doctorRef;
  DocumentReference? get doctorRef => _doctorRef;
  bool hasDoctorRef() => _doctorRef != null;

  // "patientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _allergies = snapshotData['allergies'] as String?;
    _notes = snapshotData['notes'] as String?;
    _condition = snapshotData['condition'] as String?;
    _treatment = snapshotData['treatment'] as String?;
    _diagnosis = snapshotData['Diagnosis'] as String?;
    _currentMedications = snapshotData['CurrentMedications'] as String?;
    _patientRef = snapshotData['patientRef'] as DocumentReference?;
    _doctorRef = snapshotData['doctorRef'] as DocumentReference?;
    _patientName = snapshotData['patientName'] as String?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicalRecord');

  static Stream<MedicalRecordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicalRecordRecord.fromSnapshot(s));

  static Future<MedicalRecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicalRecordRecord.fromSnapshot(s));

  static MedicalRecordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicalRecordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicalRecordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicalRecordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicalRecordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicalRecordRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createMedicalRecordRecordData({
  String? allergies,
  String? notes,
  String? condition,
  String? treatment,
  String? diagnosis,
  String? currentMedications,
  DocumentReference? patientRef,
  DocumentReference? doctorRef,
  String? patientName,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'allergies': allergies,
      'notes': notes,
      'condition': condition,
      'treatment': treatment,
      'Diagnosis': diagnosis,
      'CurrentMedications': currentMedications,
      'patientRef': patientRef,
      'doctorRef': doctorRef,
      'patientName': patientName,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicalRecordRecordDocumentEquality
    implements Equality<MedicalRecordRecord> {
  const MedicalRecordRecordDocumentEquality();

  @override
  bool equals(MedicalRecordRecord? e1, MedicalRecordRecord? e2) {
    return e1?.allergies == e2?.allergies &&
        e1?.notes == e2?.notes &&
        e1?.condition == e2?.condition &&
        e1?.treatment == e2?.treatment &&
        e1?.diagnosis == e2?.diagnosis &&
        e1?.currentMedications == e2?.currentMedications &&
        e1?.patientRef == e2?.patientRef &&
        e1?.doctorRef == e2?.doctorRef &&
        e1?.patientName == e2?.patientName &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(MedicalRecordRecord? e) => const ListEquality().hash([
        e?.allergies,
        e?.notes,
        e?.condition,
        e?.treatment,
        e?.diagnosis,
        e?.currentMedications,
        e?.patientRef,
        e?.doctorRef,
        e?.patientName,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicalRecordRecord;
}
