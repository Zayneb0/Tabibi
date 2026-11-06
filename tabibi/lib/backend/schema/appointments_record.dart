import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "patientRef" field.
  DocumentReference? _patientRef;
  DocumentReference? get patientRef => _patientRef;
  bool hasPatientRef() => _patientRef != null;

  // "appointmentDate" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "doctorRef" field.
  DocumentReference? _doctorRef;
  DocumentReference? get doctorRef => _doctorRef;
  bool hasDoctorRef() => _doctorRef != null;

  // "dateKey" field.
  String? _dateKey;
  String get dateKey => _dateKey ?? '';
  bool hasDateKey() => _dateKey != null;

  // "timeKey" field.
  String? _timeKey;
  String get timeKey => _timeKey ?? '';
  bool hasTimeKey() => _timeKey != null;

  // "slotKey" field.
  String? _slotKey;
  String get slotKey => _slotKey ?? '';
  bool hasSlotKey() => _slotKey != null;

  // "durationMin" field.
  int? _durationMin;
  int get durationMin => _durationMin ?? 0;
  bool hasDurationMin() => _durationMin != null;

  // "patientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  void _initializeFields() {
    _patientRef = snapshotData['patientRef'] as DocumentReference?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _reason = snapshotData['reason'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _doctorRef = snapshotData['doctorRef'] as DocumentReference?;
    _dateKey = snapshotData['dateKey'] as String?;
    _timeKey = snapshotData['timeKey'] as String?;
    _slotKey = snapshotData['slotKey'] as String?;
    _durationMin = castToType<int>(snapshotData['durationMin']);
    _patientName = snapshotData['patientName'] as String?;
    _doctorName = snapshotData['doctorName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createAppointmentsRecordData({
  DocumentReference? patientRef,
  DateTime? appointmentDate,
  String? status,
  String? reason,
  DateTime? createdAt,
  DocumentReference? doctorRef,
  String? dateKey,
  String? timeKey,
  String? slotKey,
  int? durationMin,
  String? patientName,
  String? doctorName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'patientRef': patientRef,
      'appointmentDate': appointmentDate,
      'status': status,
      'reason': reason,
      'createdAt': createdAt,
      'doctorRef': doctorRef,
      'dateKey': dateKey,
      'timeKey': timeKey,
      'slotKey': slotKey,
      'durationMin': durationMin,
      'patientName': patientName,
      'doctorName': doctorName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.patientRef == e2?.patientRef &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.status == e2?.status &&
        e1?.reason == e2?.reason &&
        e1?.createdAt == e2?.createdAt &&
        e1?.doctorRef == e2?.doctorRef &&
        e1?.dateKey == e2?.dateKey &&
        e1?.timeKey == e2?.timeKey &&
        e1?.slotKey == e2?.slotKey &&
        e1?.durationMin == e2?.durationMin &&
        e1?.patientName == e2?.patientName &&
        e1?.doctorName == e2?.doctorName;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.patientRef,
        e?.appointmentDate,
        e?.status,
        e?.reason,
        e?.createdAt,
        e?.doctorRef,
        e?.dateKey,
        e?.timeKey,
        e?.slotKey,
        e?.durationMin,
        e?.patientName,
        e?.doctorName
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
