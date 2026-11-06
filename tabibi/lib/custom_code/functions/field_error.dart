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

/// Inline validation message for a form field ("" when valid or still empty).
String? fieldError(
  String? kind,
  String? value,
  String? other,
) {
  final v = (value ?? '').trim();
  if (v.isEmpty) return '';
  switch (kind) {
    case 'email':
      return RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(v)
          ? ''
          : 'Enter a valid email address.';
    case 'password':
      return v.length >= 6 ? '' : 'Password must be at least 6 characters.';
    case 'confirm':
      return v == (other ?? '').trim() ? '' : 'Passwords do not match.';
    case 'name':
      return RegExp(r"^[A-Za-zÀ-ÿ' -]{2,50}$").hasMatch(v)
          ? ''
          : 'Use letters only (2 to 50 characters).';
    case 'age':
      final n = int.tryParse(v);
      return (n != null && n >= 1 && n <= 120)
          ? ''
          : 'Enter an age between 1 and 120.';
    case 'years':
      final y = int.tryParse(v.replaceAll(RegExp(r'[^0-9]'), ''));
      return (y != null && y <= 70)
          ? ''
          : 'Enter your years of experience (e.g. 10).';
    case 'text':
      return v.length >= 2 ? '' : 'Please enter at least 2 characters.';
    case 'about':
      return v.length <= 500 ? '' : 'Maximum 500 characters.';
  }
  return '';
}
