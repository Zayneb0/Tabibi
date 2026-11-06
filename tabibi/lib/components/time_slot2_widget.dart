import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_slot2_model.dart';
export 'time_slot2_model.dart';

class TimeSlot2Widget extends StatefulWidget {
  const TimeSlot2Widget({
    super.key,
    bool? selected,
    String? time,
  })  : this.selected = selected ?? false,
        this.time = time ?? '08:00 PM';

  final bool selected;
  final String time;

  @override
  State<TimeSlot2Widget> createState() => _TimeSlot2WidgetState();
}

class _TimeSlot2WidgetState extends State<TimeSlot2Widget> {
  late TimeSlot2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSlot2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget!.selected,
            false,
          )
              ? Color(0xFF2F65F6)
              : FlutterFlowTheme.of(context).secondaryBackground,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(9999.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget!.selected,
              false,
            )
                ? Color(0xFF2F65F6)
                : FlutterFlowTheme.of(context).alternate,
            Color(0x00000000),
          ),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
        child: Container(
          child: Text(
            valueOrDefault<String>(
              widget!.time,
              '08:00 PM',
            ),
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
                        : FlutterFlowTheme.of(context).primaryText,
                    Color(0x00000000),
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ),
    );
  }
}
