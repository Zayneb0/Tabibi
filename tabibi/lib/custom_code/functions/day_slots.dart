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

/// Bookable HH:mm slots of a day (08:00-17:00, 30 min, lunch 12-13).
///
/// Past slots of today are removed; sorted earliest/latest first; first 8
/// only unless showAll.
List<String>? daySlots(
  String? dateKey,
  bool? showAll,
  bool? earliestFirst,
) {
  String two(int v) => v.toString().padLeft(2, '0');
  var slots = <String>[];
  for (var m = 8 * 60; m < 17 * 60; m += 30) {
    if (m >= 12 * 60 && m < 13 * 60) continue;
    slots.add('${two(m ~/ 60)}:${two(m % 60)}');
  }
  final now = DateTime.now();
  final today = '${now.year}-${two(now.month)}-${two(now.day)}';
  if (dateKey == today) {
    final cur = now.hour * 60 + now.minute;
    slots = slots.where((s) {
      final p = s.split(':');
      return int.parse(p[0]) * 60 + int.parse(p[1]) > cur;
    }).toList();
  }
  if (earliestFirst == false) slots = slots.reversed.toList();
  if (showAll != true && slots.length > 8) slots = slots.sublist(0, 8);
  return slots;
}
