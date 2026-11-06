import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_slot3_model.dart';
export 'time_slot3_model.dart';

class TimeSlot3Widget extends StatefulWidget {
  const TimeSlot3Widget({
    super.key,
    bool? selected,
    String? time,
  })  : this.selected = selected ?? false,
        this.time = time ?? '';

  final bool selected;
  final String time;

  @override
  State<TimeSlot3Widget> createState() => _TimeSlot3WidgetState();
}

class _TimeSlot3WidgetState extends State<TimeSlot3Widget> {
  late TimeSlot3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSlot3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget!.selected,
            false,
          )
              ? Color(0xFFFF6B00)
              : Color(0xFFF1F5F9),
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          child: Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              widget!.time,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget!.selected,
                        false,
                      )
                          ? Colors.white
                          : Color(0xFF0F172A),
                      Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    lineHeight: 1.4,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
