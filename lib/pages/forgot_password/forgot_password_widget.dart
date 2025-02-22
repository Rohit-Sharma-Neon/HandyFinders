import '/backend/api_requests/api_calls.dart';
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
import 'package:flutter/services.dart';
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  static String routeName = 'ForgotPassword';
  static String routePath = '/forgotPassword';

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                headingText: 'Forgot Password?',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.onboardingSubHeadingTextModel,
                              updateCallback: () => safeSetState(() {}),
                              child: OnboardingSubHeadingTextWidget(
                                subHeadingText:
                                    'Enter your registered email address \nto receive OTP',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldLabelTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TextFieldLabelTextWidget(
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 110.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
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
                                    fillColor: FlutterFlowTheme.of(context)
                                        .textFieldFillColor,
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
                                  maxLength: 50,
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
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.primaryButtonBottomPadding,
                      0.0,
                    )),
                child: wrapWithModel(
                  model: _model.baseButtonComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BaseButtonComponentWidget(
                    title: 'Send OTP',
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
                      _model.apiStatus =
                          await HandyFindersAPIsGroup.forgotPasswordCall.call(
                        email: _model.textController.text,
                      );

                      _shouldSetState = true;
                      context.safePop();
                      if ((_model.apiStatus?.statusCode ?? 200) ==
                          FFAppConstants.apiStatus201) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              HandyFindersAPIsGroup.forgotPasswordCall
                                  .apiMessage(
                                (_model.apiStatus?.jsonBody ?? ''),
                              )!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                      } else {
                        if (HandyFindersAPIsGroup.forgotPasswordCall.apiStatus(
                          (_model.apiStatus?.jsonBody ?? ''),
                        )!) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.forgotPasswordCall
                                    .apiMessage(
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
                            OTPVerifyWidget.routeName,
                            queryParameters: {
                              'email': serializeParam(
                                _model.textController.text,
                                ParamType.String,
                              ),
                              'isForgettingPassword': serializeParam(
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
                                HandyFindersAPIsGroup.forgotPasswordCall
                                    .apiMessage(
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
