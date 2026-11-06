import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/doctor_nav_bar_widget.dart';
import '/components/stat_block_widget.dart';
import '/components/status_select_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_management_model.dart';
export 'doctor_management_model.dart';

///
class DoctorManagementWidget extends StatefulWidget {
  const DoctorManagementWidget({super.key});

  static String routeName = 'DoctorManagement';
  static String routePath = '/doctorManagement';

  @override
  State<DoctorManagementWidget> createState() => _DoctorManagementWidgetState();
}

class _DoctorManagementWidgetState extends State<DoctorManagementWidget>
    with TickerProviderStateMixin {
  late DoctorManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.today = functions.todayKey();
      safeSetState(() {});
      _model.todayApptsLoad = await queryAppointmentsRecordOnce(
        queryBuilder: (appointmentsRecord) => appointmentsRecord
            .where(
              'doctorRef',
              isEqualTo: currentUserReference,
            )
            .where(
              'dateKey',
              isEqualTo: _model.today,
            ),
      );
      _model.todayCount = _model.todayApptsLoad?.length;
      safeSetState(() {});
      _model.pendingApptsLoad = await queryAppointmentsRecordOnce(
        queryBuilder: (appointmentsRecord) => appointmentsRecord
            .where(
              'doctorRef',
              isEqualTo: currentUserReference,
            )
            .where(
              'status',
              isEqualTo: 'En cours',
            ),
      );
      _model.pendingCount = _model.pendingApptsLoad?.length;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 450.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 450.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8FAFC),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      'Hello Dr. ${currentUserDisplayName}',
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    'You have ${_model.todayCount?.toString()} appointment(s) today',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    if (_model.filter == 'today')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'today';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Today',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(_model.filter == 'today'))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'today';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Today',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    if (_model.filter == 'pending')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'pending';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Pending',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(_model.filter == 'pending'))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'pending';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Pending',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    if (_model.filter == 'confirmed')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'confirmed';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Confirmed',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(_model.filter == 'confirmed'))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'confirmed';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'Confirmed',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    if (_model.filter == 'all')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'all';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'All',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(_model.filter == 'all'))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filter = 'all';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            child: Text(
                                              'All',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: wrapWithModel(
                                      model: _model.statBlockModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatBlockWidget(
                                        bgTone: Color(0xFFE0E7FF),
                                        icon: Icon(
                                          Icons.calendar_today_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        value:
                                            '${_model.todayCount?.toString()}',
                                        label: 'Today',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: wrapWithModel(
                                      model: _model.statBlockModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatBlockWidget(
                                        bgTone: Color(0xFFFEF3C7),
                                        icon: Icon(
                                          Icons.pending_actions_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        value:
                                            '${_model.pendingCount?.toString()}',
                                        label: 'Pending',
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Upcoming patients',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.stretch)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      if (_model.filter == 'today')
                                        StreamBuilder<List<AppointmentsRecord>>(
                                          stream: queryAppointmentsRecord(
                                            queryBuilder:
                                                (appointmentsRecord) =>
                                                    appointmentsRecord
                                                        .where(
                                                          'doctorRef',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'dateKey',
                                                          isEqualTo:
                                                              _model.today,
                                                        ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AppointmentsRecord>
                                                appointmentsTodayAppointmentsRecordList =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final listItem =
                                                    appointmentsTodayAppointmentsRecordList
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listItem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listItemIndex) {
                                                    final listItemItem =
                                                        listItem[listItemIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MedicalRecordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'patientRef':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'patientName':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientName,
                                                              ParamType.String,
                                                            ),
                                                            'canEdit':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                (FFMainAxisAlignment
                                                                        .start)
                                                                    .flutterValue,
                                                            crossAxisAlignment:
                                                                (FFCrossAxisAlignment
                                                                        .stretch)
                                                                    .flutterValue,
                                                            textBaseline:
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .start)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Container(
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              22.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          (FFMainAxisAlignment.start)
                                                                              .flutterValue,
                                                                      crossAxisAlignment:
                                                                          (FFCrossAxisAlignment.start)
                                                                              .flutterValue,
                                                                      textBaseline:
                                                                          TextBaseline
                                                                              .alphabetic,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          listItemItem
                                                                              .patientName,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              (FFMainAxisAlignment.start).flutterValue,
                                                                          crossAxisAlignment:
                                                                              (FFCrossAxisAlignment.center).flutterValue,
                                                                          textBaseline:
                                                                              TextBaseline.alphabetic,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.schedule_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 14.0,
                                                                            ),
                                                                            Text(
                                                                              functions.apptWhenLabel(listItemItem.dateKey, listItemItem.timeKey)!,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 6.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 2.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Pending')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFFF4E5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.hourglass_top_rounded,
                                                                                  color: Color(0xFFB45309),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Pending',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB45309),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Confirmed')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE6F4EA),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_rounded,
                                                                                  color: Color(0xFF15803D),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Confirmed',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15803D),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Refused')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFDECEC),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.cancel_rounded,
                                                                                  color: Color(0xFFB91C1C),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Refused',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB91C1C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .spaceBetween)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .folder_shared_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        'Medical record',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .statusSelectTodayModels
                                                                          .getModel(
                                                                        listItemIndex
                                                                            .toString(),
                                                                        listItemIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          StatusSelectWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keybsy_${listItemIndex.toString()}',
                                                                        ),
                                                                        appointmentRef:
                                                                            listItemItem.reference,
                                                                        status:
                                                                            listItemItem.status,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      if (_model.filter == 'pending')
                                        StreamBuilder<List<AppointmentsRecord>>(
                                          stream: queryAppointmentsRecord(
                                            queryBuilder:
                                                (appointmentsRecord) =>
                                                    appointmentsRecord
                                                        .where(
                                                          'doctorRef',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'status',
                                                          isEqualTo: 'Pending',
                                                        ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AppointmentsRecord>
                                                appointmentsPendingAppointmentsRecordList =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final listItem =
                                                    appointmentsPendingAppointmentsRecordList
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listItem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listItemIndex) {
                                                    final listItemItem =
                                                        listItem[listItemIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MedicalRecordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'patientRef':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'patientName':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientName,
                                                              ParamType.String,
                                                            ),
                                                            'canEdit':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                (FFMainAxisAlignment
                                                                        .start)
                                                                    .flutterValue,
                                                            crossAxisAlignment:
                                                                (FFCrossAxisAlignment
                                                                        .stretch)
                                                                    .flutterValue,
                                                            textBaseline:
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .start)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Container(
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              22.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          (FFMainAxisAlignment.start)
                                                                              .flutterValue,
                                                                      crossAxisAlignment:
                                                                          (FFCrossAxisAlignment.start)
                                                                              .flutterValue,
                                                                      textBaseline:
                                                                          TextBaseline
                                                                              .alphabetic,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          listItemItem
                                                                              .patientName,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              (FFMainAxisAlignment.start).flutterValue,
                                                                          crossAxisAlignment:
                                                                              (FFCrossAxisAlignment.center).flutterValue,
                                                                          textBaseline:
                                                                              TextBaseline.alphabetic,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.schedule_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 14.0,
                                                                            ),
                                                                            Text(
                                                                              functions.apptWhenLabel(listItemItem.dateKey, listItemItem.timeKey)!,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 6.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 2.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Pending')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFFF4E5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.hourglass_top_rounded,
                                                                                  color: Color(0xFFB45309),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Pending',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB45309),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Confirmed')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE6F4EA),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_rounded,
                                                                                  color: Color(0xFF15803D),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Confirmed',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15803D),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Refused')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFDECEC),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.cancel_rounded,
                                                                                  color: Color(0xFFB91C1C),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Refused',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB91C1C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .spaceBetween)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .folder_shared_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        'Medical record',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .statusSelectPendingModels
                                                                          .getModel(
                                                                        listItemIndex
                                                                            .toString(),
                                                                        listItemIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          StatusSelectWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key5i0_${listItemIndex.toString()}',
                                                                        ),
                                                                        appointmentRef:
                                                                            listItemItem.reference,
                                                                        status:
                                                                            listItemItem.status,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      if (_model.filter == 'confirmed')
                                        StreamBuilder<List<AppointmentsRecord>>(
                                          stream: queryAppointmentsRecord(
                                            queryBuilder:
                                                (appointmentsRecord) =>
                                                    appointmentsRecord
                                                        .where(
                                                          'doctorRef',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'status',
                                                          isEqualTo:
                                                              'Confirmed',
                                                        ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AppointmentsRecord>
                                                appointmentsConfirmedAppointmentsRecordList =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final listItem =
                                                    appointmentsConfirmedAppointmentsRecordList
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listItem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listItemIndex) {
                                                    final listItemItem =
                                                        listItem[listItemIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MedicalRecordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'patientRef':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'patientName':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientName,
                                                              ParamType.String,
                                                            ),
                                                            'canEdit':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                (FFMainAxisAlignment
                                                                        .start)
                                                                    .flutterValue,
                                                            crossAxisAlignment:
                                                                (FFCrossAxisAlignment
                                                                        .stretch)
                                                                    .flutterValue,
                                                            textBaseline:
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .start)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Container(
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              22.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          (FFMainAxisAlignment.start)
                                                                              .flutterValue,
                                                                      crossAxisAlignment:
                                                                          (FFCrossAxisAlignment.start)
                                                                              .flutterValue,
                                                                      textBaseline:
                                                                          TextBaseline
                                                                              .alphabetic,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          listItemItem
                                                                              .patientName,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              (FFMainAxisAlignment.start).flutterValue,
                                                                          crossAxisAlignment:
                                                                              (FFCrossAxisAlignment.center).flutterValue,
                                                                          textBaseline:
                                                                              TextBaseline.alphabetic,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.schedule_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 14.0,
                                                                            ),
                                                                            Text(
                                                                              functions.apptWhenLabel(listItemItem.dateKey, listItemItem.timeKey)!,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 6.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 2.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Pending')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFFF4E5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.hourglass_top_rounded,
                                                                                  color: Color(0xFFB45309),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Pending',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB45309),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Confirmed')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE6F4EA),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_rounded,
                                                                                  color: Color(0xFF15803D),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Confirmed',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15803D),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Refused')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFDECEC),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.cancel_rounded,
                                                                                  color: Color(0xFFB91C1C),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Refused',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB91C1C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .spaceBetween)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .folder_shared_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        'Medical record',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .statusSelectConfirmedModels
                                                                          .getModel(
                                                                        listItemIndex
                                                                            .toString(),
                                                                        listItemIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          StatusSelectWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keyagx_${listItemIndex.toString()}',
                                                                        ),
                                                                        appointmentRef:
                                                                            listItemItem.reference,
                                                                        status:
                                                                            listItemItem.status,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      if (_model.filter == 'all')
                                        StreamBuilder<List<AppointmentsRecord>>(
                                          stream: queryAppointmentsRecord(
                                            queryBuilder:
                                                (appointmentsRecord) =>
                                                    appointmentsRecord.where(
                                              'doctorRef',
                                              isEqualTo: currentUserReference,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AppointmentsRecord>
                                                appointmentsAllAppointmentsRecordList =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final listItem =
                                                    appointmentsAllAppointmentsRecordList
                                                        .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listItem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listItemIndex) {
                                                    final listItemItem =
                                                        listItem[listItemIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          MedicalRecordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'patientRef':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'patientName':
                                                                serializeParam(
                                                              listItemItem
                                                                  .patientName,
                                                              ParamType.String,
                                                            ),
                                                            'canEdit':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                (FFMainAxisAlignment
                                                                        .start)
                                                                    .flutterValue,
                                                            crossAxisAlignment:
                                                                (FFCrossAxisAlignment
                                                                        .stretch)
                                                                    .flutterValue,
                                                            textBaseline:
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .start)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Container(
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              22.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          (FFMainAxisAlignment.start)
                                                                              .flutterValue,
                                                                      crossAxisAlignment:
                                                                          (FFCrossAxisAlignment.start)
                                                                              .flutterValue,
                                                                      textBaseline:
                                                                          TextBaseline
                                                                              .alphabetic,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          listItemItem
                                                                              .patientName,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              (FFMainAxisAlignment.start).flutterValue,
                                                                          crossAxisAlignment:
                                                                              (FFCrossAxisAlignment.center).flutterValue,
                                                                          textBaseline:
                                                                              TextBaseline.alphabetic,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.schedule_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 14.0,
                                                                            ),
                                                                            Text(
                                                                              functions.apptWhenLabel(listItemItem.dateKey, listItemItem.timeKey)!,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 6.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 2.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Pending')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFFF4E5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.hourglass_top_rounded,
                                                                                  color: Color(0xFFB45309),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Pending',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB45309),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Confirmed')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE6F4EA),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_rounded,
                                                                                  color: Color(0xFF15803D),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Confirmed',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15803D),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .statusLabel(listItemItem.status) ==
                                                                          'Refused')
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFFDECEC),
                                                                            borderRadius:
                                                                                BorderRadius.circular(999.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                                                                              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                                                                              textBaseline: TextBaseline.alphabetic,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.cancel_rounded,
                                                                                  color: Color(0xFFB91C1C),
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  'Refused',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFFB91C1C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    (FFMainAxisAlignment
                                                                            .spaceBetween)
                                                                        .flutterValue,
                                                                crossAxisAlignment:
                                                                    (FFCrossAxisAlignment
                                                                            .center)
                                                                        .flutterValue,
                                                                textBaseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        (FFMainAxisAlignment.start)
                                                                            .flutterValue,
                                                                    crossAxisAlignment:
                                                                        (FFCrossAxisAlignment.center)
                                                                            .flutterValue,
                                                                    textBaseline:
                                                                        TextBaseline
                                                                            .alphabetic,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .folder_shared_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        'Medical record',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.0,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .statusSelectAllModels
                                                                          .getModel(
                                                                        listItemIndex
                                                                            .toString(),
                                                                        listItemIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          StatusSelectWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keybmw_${listItemIndex.toString()}',
                                                                        ),
                                                                        appointmentRef:
                                                                            listItemItem.reference,
                                                                        status:
                                                                            listItemItem.status,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: DoctorNavBarWidget(
                active: 'dashboard',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
