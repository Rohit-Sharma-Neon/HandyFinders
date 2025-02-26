import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_title_widget.dart';
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
import 'package:provider/provider.dart';
import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  static String routeName = 'ChangePassword';
  static String routePath = '/changePassword';

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late ChangePasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
              autovalidateMode: AutovalidateMode.always,
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
                    wrapWithModel(
                      model: _model.icBackTitleModel,
                      updateCallback: () => safeSetState(() {}),
                      child: IcBackTitleWidget(
                        title: 'Change Password',
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
                                  0.0, 35.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.onboardingHeadingTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: OnboardingHeadingTextWidget(
                                  headingText: 'Change Password',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.onboardingSubHeadingTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: OnboardingSubHeadingTextWidget(
                                  subHeadingText:
                                      'Set new password for your account',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 35.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldLabelTextModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: TextFieldLabelTextWidget(
                                  labelText: 'Old Password',
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: false,
                                obscureText: !_model.passwordVisibility1,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF717171),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Enter your old password',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .hintTextColor,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                  suffixIcon: InkWell(
                                    onTap: () => safeSetState(
                                      () => _model.passwordVisibility1 =
                                          !_model.passwordVisibility1,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility1
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
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldLabelTextModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: TextFieldLabelTextWidget(
                                  labelText: 'New Password',
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: false,
                                obscureText: !_model.passwordVisibility2,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF717171),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Enter your new password',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .hintTextColor,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                  suffixIcon: InkWell(
                                    onTap: () => safeSetState(
                                      () => _model.passwordVisibility2 =
                                          !_model.passwordVisibility2,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility2
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldLabelTextModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: TextFieldLabelTextWidget(
                                  labelText: 'Confirm New Password',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 110.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController3,
                                  focusNode: _model.textFieldFocusNode3,
                                  autofocus: false,
                                  obscureText: !_model.passwordVisibility3,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF717171),
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Enter your confirm password',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .hintTextColor,
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
                                    suffixIcon: InkWell(
                                      onTap: () => safeSetState(
                                        () => _model.passwordVisibility3 =
                                            !_model.passwordVisibility3,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility3
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
                                  validator: _model.textController3Validator
                                      .asValidator(context),
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
                    title: 'Update Password',
                    isLoading: false,
                    passOnTapCallback: () async {
                      var _shouldSetState = false;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if (_model.textController3.text ==
                          _model.textController2.text) {
                        unawaited(
                          () async {
                            await actions.showBaseLoader(
                              context,
                            );
                          }(),
                        );
                        _model.apiStatus =
                            await HandyFindersAPIsGroup.changePasswordCall.call(
                          currentPassword: _model.textController1.text,
                          newPassword: _model.textController3.text,
                          authToken: FFAppState().authToken,
                        );

                        _shouldSetState = true;
                        context.safePop();
                        if ((_model.apiStatus?.statusCode ?? 200) ==
                            FFAppConstants.apiStatus201) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.changePasswordCall
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
                          FFAppState().authToken = '';
                          FFAppState().deviceToken = 'dummydevicetoken';
                          FFAppState().deviceUniqueId = 'dummyuniqueid';
                          FFAppState().userProfileImageUrl = '';
                          FFAppState().userName = '';
                          FFAppState().userEmail = '';
                          FFAppState().IsRememberMe = true;
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
                        } else if (HandyFindersAPIsGroup.changePasswordCall
                            .apiStatus(
                          (_model.apiStatus?.jsonBody ?? ''),
                        )!) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.changePasswordCall
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
                          FFAppState().rememberMePassword = '';
                          context.safePop();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.changePasswordCall
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Password and Confirm password must be same.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
