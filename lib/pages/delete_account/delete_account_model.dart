import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/logo_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/components/onboarding_sub_heading_text_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'delete_account_widget.dart' show DeleteAccountWidget;
import 'package:flutter/material.dart';

class DeleteAccountModel extends FlutterFlowModel<DeleteAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for gradientBackground component.
  late GradientBackgroundModel gradientBackgroundModel;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for LogoComponent component.
  late LogoComponentModel logoComponentModel;
  // Model for OnboardingHeadingText component.
  late OnboardingHeadingTextModel onboardingHeadingTextModel;
  // Model for OnboardingSubHeadingText component.
  late OnboardingSubHeadingTextModel onboardingSubHeadingTextModel;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Delete Account)] action in BaseButtonComponent widget.
  ApiCallResponse? apiStatus;

  @override
  void initState(BuildContext context) {
    gradientBackgroundModel =
        createModel(context, () => GradientBackgroundModel());
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    logoComponentModel = createModel(context, () => LogoComponentModel());
    onboardingHeadingTextModel =
        createModel(context, () => OnboardingHeadingTextModel());
    onboardingSubHeadingTextModel =
        createModel(context, () => OnboardingSubHeadingTextModel());
    textFieldLabelTextModel =
        createModel(context, () => TextFieldLabelTextModel());
    passwordVisibility = false;
    textControllerValidator = _textControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    gradientBackgroundModel.dispose();
    icBackTitleModel.dispose();
    logoComponentModel.dispose();
    onboardingHeadingTextModel.dispose();
    onboardingSubHeadingTextModel.dispose();
    textFieldLabelTextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
