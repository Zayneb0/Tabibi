import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medical_card_child3_model.dart';
export 'medical_card_child3_model.dart';

class MedicalCardChild3Widget extends StatefulWidget {
  const MedicalCardChild3Widget({super.key});

  @override
  State<MedicalCardChild3Widget> createState() =>
      _MedicalCardChild3WidgetState();
}

class _MedicalCardChild3WidgetState extends State<MedicalCardChild3Widget> {
  late MedicalCardChild3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicalCardChild3Model());
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
