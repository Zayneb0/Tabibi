import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medical_card_child4_model.dart';
export 'medical_card_child4_model.dart';

class MedicalCardChild4Widget extends StatefulWidget {
  const MedicalCardChild4Widget({super.key});

  @override
  State<MedicalCardChild4Widget> createState() =>
      _MedicalCardChild4WidgetState();
}

class _MedicalCardChild4WidgetState extends State<MedicalCardChild4Widget> {
  late MedicalCardChild4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicalCardChild4Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }
}
