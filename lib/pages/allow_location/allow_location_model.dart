import '/components/base_button_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/components/onboarding_sub_heading_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'allow_location_widget.dart' show AllowLocationWidget;
import 'package:flutter/material.dart';

class AllowLocationModel extends FlutterFlowModel<AllowLocationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OnboardingHeadingText component.
  late OnboardingHeadingTextModel onboardingHeadingTextModel;
  // Model for OnboardingSubHeadingText component.
  late OnboardingSubHeadingTextModel onboardingSubHeadingTextModel;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;

  @override
  void initState(BuildContext context) {
    onboardingHeadingTextModel =
        createModel(context, () => OnboardingHeadingTextModel());
    onboardingSubHeadingTextModel =
        createModel(context, () => OnboardingSubHeadingTextModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    onboardingHeadingTextModel.dispose();
    onboardingSubHeadingTextModel.dispose();
    baseButtonComponentModel.dispose();
  }
}
