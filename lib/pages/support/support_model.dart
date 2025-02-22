import '/components/ic_back_title_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'support_widget.dart' show SupportWidget;
import 'package:flutter/material.dart';

class SupportModel extends FlutterFlowModel<SupportWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for OnboardingHeadingText component.
  late OnboardingHeadingTextModel onboardingHeadingTextModel;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    onboardingHeadingTextModel =
        createModel(context, () => OnboardingHeadingTextModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    onboardingHeadingTextModel.dispose();
  }
}
