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

/// True when a form field value is filled in and valid.
bool? isFieldValid(
  String? kind,
  String? value,
  String? other,
) {
  final v = (value ?? '').trim();
  if (kind == 'about') return v.length <= 500;
  if (v.isEmpty) return false;
  switch (kind) {
    case 'email':
      return RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(v);
    case 'password':
      return v.length >= 6;
    case 'confirm':
      return v == (other ?? '').trim();
    case 'name':
      return RegExp(r"^[A-Za-zÀ-ÿ' -]{2,50}$").hasMatch(v);
    case 'age':
      final n = int.tryParse(v);
      return n != null && n >= 1 && n <= 120;
    case 'years':
      final y = int.tryParse(v.replaceAll(RegExp(r'[^0-9]'), ''));
      return y != null && y <= 70;
    case 'text':
      return v.length >= 2;
  }
  return true;
}
