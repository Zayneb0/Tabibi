import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Combines a yyyy-MM-dd key and an HH:mm key into a DateTime.
DateTime? slotDateTime(
  String? dateKey,
  String? timeKey,
) {
  final d = DateTime.tryParse(dateKey ?? '') ?? DateTime.now();
  final p = (timeKey == null || timeKey.isEmpty ? '00:00' : timeKey).split(':');
  return DateTime(d.year, d.month, d.day, int.parse(p[0]), int.parse(p[1]));
}
