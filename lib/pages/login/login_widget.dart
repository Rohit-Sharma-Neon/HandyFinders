import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_widget.dart';
import '/components/logo_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/components/onboarding_sub_heading_text_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    this.showBackButton,
  });

  final bool? showBackButton;

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deviceId = await actions.getDeviceUniqueId();
      FFAppState().deviceUniqueId =
          _model.deviceId != null && _model.deviceId != ''
              ? _model.deviceId!
              : '';
      safeSetState(() {
        _model.textController1?.text =
            (FFAppState().IsRememberMe ? FFAppState().rememberMeEmail : '');
      });
      safeSetState(() {
        _model.textController2?.text =
            (FFAppState().IsRememberMe ? FFAppState().rememberMePassword : '');
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
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
                      child: Builder(
                        builder: (context) {
                          if (valueOrDefault<bool>(
                            widget.showBackButton,
                            true,
                          )) {
                            return wrapWithModel(
                              model: _model.icBackModel,
                              updateCallback: () => safeSetState(() {}),
                              child: IcBackWidget(),
                            );
                          } else {
                            return Container(
                              width: 1.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.logoComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LogoComponentWidget(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.onboardingHeadingTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: OnboardingHeadingTextWidget(
                                  headingText: 'Welcome Back!',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.onboardingSubHeadingTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: OnboardingSubHeadingTextWidget(
                                  subHeadingText:
                                      'Enter your login details to\naccess your account',
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.textFieldLabelTextModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TextFieldLabelTextWidget(
                                    labelText: 'Email',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF717171),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Enter your email',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .hintTextColor,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE7E7E7),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 23.0, 0.0, 23.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLength: 30,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 18.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.textFieldLabelTextModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TextFieldLabelTextWidget(
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: false,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF717171),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Enter your password',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .hintTextColor,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE7E7E7),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 23.0, 0.0, 23.0),
                                    suffixIcon: InkWell(
                                      onTap: () => safeSetState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLength: 15,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 150.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??=
                                          FFAppState().IsRememberMe,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState().IsRememberMe = true;
                                          safeSetState(() {});
                                        } else {
                                          FFAppState().IsRememberMe = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  Text(
                                    'Remember Me',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ForgotPasswordWidget.routeName);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Forgot Password',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            ),
                                          ),
                                        ),
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
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    wrapWithModel(
                      model: _model.baseButtonComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BaseButtonComponentWidget(
                        title: 'Login',
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
                          _model.customActionDeviceId =
                              await actions.getDeviceUniqueId();
                          _shouldSetState = true;
                          _model.apiStatus =
                              await HandyFindersAPIsGroup.loginCall.call(
                            email: _model.textController1.text,
                            password: _model.textController2.text,
                            deviceToken: FFAppState().deviceToken,
                            deviceType: isAndroid == true ? 'ANDROID' : 'IOS',
                            deviceUniqueid:
                                _model.customActionDeviceId != null &&
                                        _model.customActionDeviceId != ''
                                    ? _model.customActionDeviceId
                                    : FFAppState().deviceUniqueId,
                          );

                          _shouldSetState = true;
                          context.safePop();
                          if ((_model.apiStatus?.statusCode ?? 200) ==
                              FFAppConstants.apiStatus201) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.loginCall
                                      .responseMessage(
                                    (_model.apiStatus?.jsonBody ?? ''),
                                  )!,
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else if (HandyFindersAPIsGroup.loginCall.apiStatus(
                            (_model.apiStatus?.jsonBody ?? ''),
                          )!) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  valueOrDefault<String>(
                                    HandyFindersAPIsGroup.loginCall
                                        .responseMessage(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    ),
                                    'null',
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            if (HandyFindersAPIsGroup.loginCall
                                    .isProfileCreated(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                ) ==
                                1) {
                              FFAppState().authToken =
                                  HandyFindersAPIsGroup.loginCall.bearerToken(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().userEmail =
                                  HandyFindersAPIsGroup.loginCall.userEmail(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().userName = HandyFindersAPIsGroup
                                              .loginCall
                                              .userName(
                                            (_model.apiStatus?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      HandyFindersAPIsGroup.loginCall.userName(
                                            (_model.apiStatus?.jsonBody ?? ''),
                                          ) !=
                                          ''
                                  ? HandyFindersAPIsGroup.loginCall.userName(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    )!
                                  : '';
                              FFAppState()
                                  .userProfileImageUrl = HandyFindersAPIsGroup
                                              .loginCall
                                              .apiProfilePictureUrl(
                                            (_model.apiStatus?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      HandyFindersAPIsGroup.loginCall
                                              .apiProfilePictureUrl(
                                            (_model.apiStatus?.jsonBody ?? ''),
                                          ) !=
                                          ''
                                  ? HandyFindersAPIsGroup.loginCall
                                      .apiProfilePictureUrl(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    )!
                                  : '';
                              FFAppState().deviceToken =
                                  FFAppState().deviceToken;
                              FFAppState().isProfileCreated = 1;
                              FFAppState().rememberMeEmail = _model
                                      .checkboxValue!
                                  ? HandyFindersAPIsGroup.loginCall.userEmail(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    )!
                                  : '';
                              FFAppState().rememberMePassword =
                                  _model.checkboxValue!
                                      ? _model.textController2.text
                                      : '';
                              FFAppState().userId =
                                  HandyFindersAPIsGroup.loginCall
                                      .apiUserId(
                                        (_model.apiStatus?.jsonBody ?? ''),
                                      )!
                                      .toString();
                              FFAppState().notificationStatus =
                                  (HandyFindersAPIsGroup.loginCall
                                          .apiNotificationStatus(
                                        (_model.apiStatus?.jsonBody ?? ''),
                                      )!) ==
                                      1;
                              FFAppState().userFirstName =
                                  HandyFindersAPIsGroup.loginCall.apiFirstName(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().userLastName =
                                  HandyFindersAPIsGroup.loginCall.apiLastName(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().userDetailsAppState =
                                  UserDataTypeStruct(
                                username:
                                    HandyFindersAPIsGroup.loginCall.userName(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                ),
                                firstName: HandyFindersAPIsGroup.loginCall
                                    .apiFirstName(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                ),
                                lastName:
                                    HandyFindersAPIsGroup.loginCall.apiLastName(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                ),
                                userProfilePhotoUrl: HandyFindersAPIsGroup
                                    .loginCall
                                    .apiProfilePictureUrl(
                                  (_model.apiStatus?.jsonBody ?? ''),
                                ),
                                userRatings: 0.0,
                              );

                              context.goNamed(HomeTabWidget.routeName);

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              FFAppState().authToken =
                                  HandyFindersAPIsGroup.loginCall.bearerToken(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().userEmail =
                                  HandyFindersAPIsGroup.loginCall.userEmail(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!;
                              FFAppState().deviceToken =
                                  FFAppState().deviceToken;
                              FFAppState().isProfileCreated = 0;
                              FFAppState().userId =
                                  HandyFindersAPIsGroup.loginCall
                                      .apiUserId(
                                        (_model.apiStatus?.jsonBody ?? ''),
                                      )!
                                      .toString();

                              context.goNamed(
                                CreateUpdateProfileWidget.routeName,
                                queryParameters: {
                                  'isUpdating': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'authToken': serializeParam(
                                    HandyFindersAPIsGroup.loginCall.bearerToken(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    ),
                                    ParamType.String,
                                  ),
                                  'userEmail': serializeParam(
                                    HandyFindersAPIsGroup.loginCall.userEmail(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    ),
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
                            }
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  valueOrDefault<String>(
                                    HandyFindersAPIsGroup.loginCall
                                        .responseMessage(
                                      (_model.apiStatus?.jsonBody ?? ''),
                                    ),
                                    'null',
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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

                          if (_shouldSetState) safeSetState(() {});
                        },
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(SignUpWidget.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(SignUpWidget.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 14.0, 0.0, 24.0),
                                child: Text(
                                  'Don’t have an account? ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 14.0, 20.0, 24.0),
                                child: Text(
                                  'Sign Up',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
