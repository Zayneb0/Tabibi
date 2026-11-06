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

/// Next N days (starting today) as yyyy-MM-dd keys.
List<String>? upcomingDays(int? count) {
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, now.day);
  String two(int v) => v.toString().padLeft(2, '0');
  return List<String>.generate(count ?? 14, (i) {
    final d = start.add(Duration(days: i));
    return '${d.year}-${two(d.month)}-${two(d.day)}';
  });
}
