import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_widget.dart';
import '/components/logo_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'o_t_p_verify_model.dart';
export 'o_t_p_verify_model.dart';

class OTPVerifyWidget extends StatefulWidget {
  const OTPVerifyWidget({
    super.key,
    required this.email,
    bool? isForgettingPassword,
    this.password,
  }) : this.isForgettingPassword = isForgettingPassword ?? false;

  final String? email;
  final bool isForgettingPassword;
  final String? password;

  static String routeName = 'OTPVerify';
  static String routePath = '/oTPVerify';

  @override
  State<OTPVerifyWidget> createState() => _OTPVerifyWidgetState();
}

class _OTPVerifyWidgetState extends State<OTPVerifyWidget> {
  late OTPVerifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPVerifyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.gradientBackgroundModel,
              updateCallback: () => safeSetState(() {}),
              child: GradientBackgroundWidget(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    FFAppConstants.scaffoldHorizontalPadding,
                    0.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    FFAppConstants.scaffoldHorizontalPadding,
                    0.0,
                  ),
                  0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: wrapWithModel(
                      model: _model.icBackModel,
                      updateCallback: () => safeSetState(() {}),
                      child: IcBackWidget(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.logoComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LogoComponentWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.onboardingHeadingTextModel,
                              updateCallback: () => safeSetState(() {}),
                              child: OnboardingHeadingTextWidget(
                                headingText: 'OTP Verification',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'A 6-digit verification code\nwas just sent to ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF6A7284),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget.email,
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF6A7284),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFF6A7284),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 36.0, 0.0, 0.0),
                              child: PinCodeTextField(
                                autoDisposeControllers: false,
                                appContext: context,
                                length: 6,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                    ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                enableActiveFill: true,
                                autoFocus: true,
                                focusNode: _model.pinCodeFocusNode,
                                enablePinAutofill: false,
                                errorTextSpace: 23.0,
                                showCursor: true,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                obscureText: false,
                                hintCharacter: '*',
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  fieldHeight: 50.0,
                                  fieldWidth: 50.0,
                                  borderWidth: 0.0,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: PinCodeFieldShape.box,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor: Color(0xFFF7F8F5),
                                  selectedColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeFillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveFillColor: Color(0xFFF7F8F5),
                                  selectedFillColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (_) {},
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: _model.pinCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 100.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    if (_model.timerValue == '00') {
                                      if (widget.isForgettingPassword) {
                                        _model.timerController.timer
                                            .setPresetTime(
                                                mSec: 60000, add: false);
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();
                                        safeSetState(() {
                                          _model.pinCodeController?.clear();
                                        });

                                        safeSetState(() {});
                                        _model.resendOtpStatus =
                                            await HandyFindersAPIsGroup
                                                .resendOTPCall
                                                .call(
                                          email: widget.email,
                                        );

                                        _shouldSetState = true;
                                        if (HandyFindersAPIsGroup.resendOTPCall
                                            .apiStatus(
                                          (_model.resendOtpStatus?.jsonBody ??
                                              ''),
                                        )!) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                HandyFindersAPIsGroup
                                                    .resendOTPCall
                                                    .apiMessage(
                                                  (_model.resendOtpStatus
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                HandyFindersAPIsGroup
                                                    .resendOTPCall
                                                    .apiMessage(
                                                  (_model.resendOtpStatus
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        _model.timerController.timer
                                            .setPresetTime(
                                                mSec: 60000, add: false);
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();
                                        safeSetState(() {
                                          _model.pinCodeController?.clear();
                                        });

                                        safeSetState(() {});
                                        _model.resendStatus =
                                            await HandyFindersAPIsGroup
                                                .checkUserCall
                                                .call(
                                          email: widget.email,
                                        );

                                        _shouldSetState = true;
                                        if (HandyFindersAPIsGroup.checkUserCall
                                            .apiSuccess(
                                          (_model.resendStatus?.jsonBody ?? ''),
                                        )!) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                HandyFindersAPIsGroup
                                                    .checkUserCall
                                                    .apiMessage(
                                                  (_model.resendStatus
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                HandyFindersAPIsGroup
                                                    .checkUserCall
                                                    .apiMessage(
                                                  (_model.resendStatus
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 28.0, 0.0, 17.0),
                                      child: Text(
                                        'Resend ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.timerValue == '00'
                                                  ? Color(0xFF0000FF)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.timerMilliseconds > 01)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 17.0),
                                    child: Text(
                                      'In : ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                if (_model.timerMilliseconds > 01)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 17.0),
                                    child: FlutterFlowTimer(
                                      initialTime: _model.timerInitialTimeMs,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        minute: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timerController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) safeSetState(() {});
                                      },
                                      onEnded: () async {
                                        safeSetState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                if (_model.timerMilliseconds > 01)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 20.0, 17.0),
                                    child: Text(
                                      ' sec',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: wrapWithModel(
                  model: _model.baseButtonComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BaseButtonComponentWidget(
                    title: 'Verify',
                    passOnTapCallback: () async {
                      var _shouldSetState = false;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      unawaited(
                        () async {
                          await actions.showBaseLoader(
                            context,
                          );
                        }(),
                      );
                      if (!widget.isForgettingPassword) {
                        _model.deviceId = await actions.getDeviceUniqueId();
                        _shouldSetState = true;
                        FFAppState().deviceUniqueId =
                            _model.deviceId != null && _model.deviceId != ''
                                ? _model.deviceId!
                                : '';
                        _model.signUpApiStatus =
                            await HandyFindersAPIsGroup.signUpCall.call(
                          email: widget.email,
                          password: widget.password,
                          deviceType: isAndroid == true ? 'ANDROID' : 'IOS',
                          deviceToken: FFAppState().deviceToken,
                          deviceUniqueid: _model.deviceId,
                          otp: _model.pinCodeController!.text,
                          isdontAskon: '1',
                        );

                        _shouldSetState = true;
                        context.safePop();
                        if ((_model.signUpApiStatus?.statusCode ?? 200) ==
                            FFAppConstants.apiStatus201) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.signUpCall.apiMessage(
                                  (_model.signUpApiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          FFAppState().userEmail = '';
                          FFAppState().userName = '';
                          FFAppState().userProfileImageUrl = '';
                          FFAppState().deviceToken = 'dummydevicetoken';
                          FFAppState().deviceUniqueId = 'dummyuniqueid';
                          FFAppState().userMobile = '';
                          FFAppState().userDob = '';
                          FFAppState().userCountryCode = '';

                          context.goNamed(
                            LoginWidget.routeName,
                            queryParameters: {
                              'showBackButton': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (HandyFindersAPIsGroup.signUpCall.apiStatus(
                          (_model.signUpApiStatus?.jsonBody ?? ''),
                        )!) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.signUpCall.apiMessage(
                                  (_model.signUpApiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).successSnackBar,
                            ),
                          );
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            CreateUpdateProfileWidget.routeName,
                            queryParameters: {
                              'isUpdating': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'authToken': serializeParam(
                                HandyFindersAPIsGroup.signUpCall.authToken(
                                  (_model.signUpApiStatus?.jsonBody ?? ''),
                                ),
                                ParamType.String,
                              ),
                              'userEmail': serializeParam(
                                widget.email,
                                ParamType.String,
                              ),
                              'hideBackButton': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.signUpCall.apiMessage(
                                  (_model.signUpApiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).errorSnackBar,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        _model.apiStatus =
                            await HandyFindersAPIsGroup.verifyOtpCall.call(
                          email: widget.email,
                          otp: _model.pinCodeController!.text,
                        );

                        _shouldSetState = true;
                        context.safePop();
                        if ((_model.apiStatus?.statusCode ?? 200) ==
                            FFAppConstants.apiStatus201) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.verifyOtpCall.apiMessage(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          FFAppState().userEmail = '';
                          FFAppState().userName = '';
                          FFAppState().userProfileImageUrl = '';
                          FFAppState().deviceToken = 'dummydevicetoken';
                          FFAppState().deviceUniqueId = 'dummyuniqueid';
                          FFAppState().userMobile = '';
                          FFAppState().userDob = '';
                          FFAppState().userCountryCode = '';

                          context.goNamed(
                            LoginWidget.routeName,
                            queryParameters: {
                              'showBackButton': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (HandyFindersAPIsGroup.verifyOtpCall
                            .apiSuccess(
                          (_model.apiStatus?.jsonBody ?? ''),
                        )!) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.verifyOtpCall.apiMessage(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          context.pushNamed(
                            ResetPasswordWidget.routeName,
                            queryParameters: {
                              'email': serializeParam(
                                widget.email,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.verifyOtpCall.apiMessage(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
