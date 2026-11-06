import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medical_card_child_model.dart';
export 'medical_card_child_model.dart';

class MedicalCardChildWidget extends StatefulWidget {
  const MedicalCardChildWidget({super.key});

  @override
  State<MedicalCardChildWidget> createState() => _MedicalCardChildWidgetState();
}

class _MedicalCardChildWidgetState extends State<MedicalCardChildWidget> {
  late MedicalCardChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicalCardChildModel());
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
