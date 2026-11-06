import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "speciality" field.
  String? _speciality;
  String get speciality => _speciality ?? '';
  bool hasSpeciality() => _speciality != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  bool hasExperience() => _experience != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "disponibility" field.
  List<String>? _disponibility;
  List<String> get disponibility => _disponibility ?? const [];
  bool hasDisponibility() => _disponibility != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _gender = snapshotData['gender'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _password = snapshotData['password'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _speciality = snapshotData['speciality'] as String?;
    _experience = snapshotData['experience'] as String?;
    _about = snapshotData['about'] as String?;
    _disponibility = getDataList(snapshotData['disponibility']);
    _role = snapshotData['role'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? gender,
  String? displayName,
  String? password,
  String? uid,
  String? phoneNumber,
  String? photoUrl,
  int? age,
  DateTime? createdTime,
  String? speciality,
  String? experience,
  String? about,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'gender': gender,
      'display_name': displayName,
      'password': password,
      'uid': uid,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'age': age,
      'created_time': createdTime,
      'speciality': speciality,
      'experience': experience,
      'about': about,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.gender == e2?.gender &&
        e1?.displayName == e2?.displayName &&
        e1?.password == e2?.password &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.age == e2?.age &&
        e1?.createdTime == e2?.createdTime &&
        e1?.speciality == e2?.speciality &&
        e1?.experience == e2?.experience &&
        e1?.about == e2?.about &&
        listEquality.equals(e1?.disponibility, e2?.disponibility) &&
        e1?.role == e2?.role;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.gender,
        e?.displayName,
        e?.password,
        e?.uid,
        e?.phoneNumber,
        e?.photoUrl,
        e?.age,
        e?.createdTime,
        e?.speciality,
        e?.experience,
        e?.about,
        const ListEquality().hash(e?.disponibility),
        e?.role
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
