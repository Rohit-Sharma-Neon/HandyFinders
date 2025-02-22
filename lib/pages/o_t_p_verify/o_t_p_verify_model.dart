import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_widget.dart';
import '/components/logo_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'o_t_p_verify_widget.dart' show OTPVerifyWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class OTPVerifyModel extends FlutterFlowModel<OTPVerifyWidget> {
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
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid OTP';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Resend OTP)] action in Container widget.
  ApiCallResponse? resendOtpStatus;
  // Stores action output result for [Backend Call - API (CheckUser)] action in Container widget.
  ApiCallResponse? resendStatus;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Custom Action - getDeviceUniqueId] action in BaseButtonComponent widget.
  String? deviceId;
  // Stores action output result for [Backend Call - API (SignUp)] action in BaseButtonComponent widget.
  ApiCallResponse? signUpApiStatus;
  // Stores action output result for [Backend Call - API (VerifyOtp)] action in BaseButtonComponent widget.
  ApiCallResponse? apiStatus;

  @override
  void initState(BuildContext context) {
    gradientBackgroundModel =
        createModel(context, () => GradientBackgroundModel());
    icBackModel = createModel(context, () => IcBackModel());
    logoComponentModel = createModel(context, () => LogoComponentModel());
    onboardingHeadingTextModel =
        createModel(context, () => OnboardingHeadingTextModel());
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    gradientBackgroundModel.dispose();
    icBackModel.dispose();
    logoComponentModel.dispose();
    onboardingHeadingTextModel.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
    baseButtonComponentModel.dispose();
  }
}
