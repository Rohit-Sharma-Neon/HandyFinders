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
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
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
  late TextFieldLabelTextModel textFieldLabelTextModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your old password';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 15) {
      return 'Maximum 15 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your new password';
    }

    if (val.length < 8) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    if (val.length > 15) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    if (!RegExp(
            '^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@\$!%*#?&])[A-Za-z\\d@\$!%*#?&]{8,}\$')
        .hasMatch(val)) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your confirm password';
    }

    if (val.length < 8) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    if (val.length > 15) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    if (!RegExp(
            '^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@\$!%*#?&])[A-Za-z\\d@\$!%*#?&]{8,}\$')
        .hasMatch(val)) {
      return 'Password should be between 8 to 15 characters\nand should contain atleast \none uppercase,\none lowercase,\none number,\none special character,';
    }
    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Change Password)] action in BaseButtonComponent widget.
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
    textFieldLabelTextModel1 =
        createModel(context, () => TextFieldLabelTextModel());
    passwordVisibility1 = false;
    textController1Validator = _textController1Validator;
    textFieldLabelTextModel2 =
        createModel(context, () => TextFieldLabelTextModel());
    passwordVisibility2 = false;
    textController2Validator = _textController2Validator;
    textFieldLabelTextModel3 =
        createModel(context, () => TextFieldLabelTextModel());
    passwordVisibility3 = false;
    textController3Validator = _textController3Validator;
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
    textFieldLabelTextModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldLabelTextModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldLabelTextModel3.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    baseButtonComponentModel.dispose();
  }
}
