import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_widget.dart';
import '/components/logo_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/components/onboarding_sub_heading_text_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for gradientBackground component.
  late GradientBackgroundModel gradientBackgroundModel;
  // Model for IcBack component.
  late IcBackModel icBackModel;
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
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email';
    }

    if (val.length > 50) {
      return 'Please enter valid email';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter valid email';
    }
    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (ForgotPassword)] action in BaseButtonComponent widget.
  ApiCallResponse? apiStatus;

  @override
  void initState(BuildContext context) {
    gradientBackgroundModel =
        createModel(context, () => GradientBackgroundModel());
    icBackModel = createModel(context, () => IcBackModel());
    logoComponentModel = createModel(context, () => LogoComponentModel());
    onboardingHeadingTextModel =
        createModel(context, () => OnboardingHeadingTextModel());
    onboardingSubHeadingTextModel =
        createModel(context, () => OnboardingSubHeadingTextModel());
    textFieldLabelTextModel =
        createModel(context, () => TextFieldLabelTextModel());
    textControllerValidator = _textControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    gradientBackgroundModel.dispose();
    icBackModel.dispose();
    logoComponentModel.dispose();
    onboardingHeadingTextModel.dispose();
    onboardingSubHeadingTextModel.dispose();
    textFieldLabelTextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
