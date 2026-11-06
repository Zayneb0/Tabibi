import '/components/onboarding_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'below_the_medical_page_widget.dart' show BelowTheMedicalPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BelowTheMedicalPageModel
    extends FlutterFlowModel<BelowTheMedicalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OnboardingButton.
  late OnboardingButtonModel onboardingButtonModel;

  @override
  void initState(BuildContext context) {
    onboardingButtonModel = createModel(context, () => OnboardingButtonModel());
  }

  @override
  void dispose() {
    onboardingButtonModel.dispose();
  }
}
