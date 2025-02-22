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
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({super.key});

  static String routeName = 'DeleteAccount';
  static String routePath = '/deleteAccount';

  @override
  State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget> {
  late DeleteAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());

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
                    wrapWithModel(
                      model: _model.icBackTitleModel,
                      updateCallback: () => safeSetState(() {}),
                      child: IcBackTitleWidget(
                        title: 'Delete Account',
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
                                  0.0, 33.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.onboardingHeadingTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: OnboardingHeadingTextWidget(
                                  headingText: 'Delete Account',
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
                                      'Enter your password to delete\nyour account',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 35.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldLabelTextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TextFieldLabelTextWidget(
                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 110.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFF717171),
                                      letterSpacing: 0.0,
                                      shadows: [
                                        Shadow(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                        )
                                      ],
                                    ),
                                    hintText: 'Enter your password',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
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
                                        fontFamily: 'Comfortaa',
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
                                  validator: _model.textControllerValidator
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
              child: Builder(
                builder: (context) => Padding(
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
                      title: 'Delete Account',
                      isLoading: false,
                      passOnTapCallback: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: CustomConfirmationDialogWidget(
                                    title:
                                        'Are you sure you want to delete your account?',
                                    onYesTap: () async {
                                      var _shouldSetState = false;
                                      context.safePop();
                                      unawaited(
                                        () async {
                                          await actions.showBaseLoader(
                                            context,
                                          );
                                        }(),
                                      );
                                      _model.apiStatus =
                                          await HandyFindersAPIsGroup
                                              .deleteAccountCall
                                              .call(
                                        password: _model.textController.text,
                                        authToken: FFAppState().authToken,
                                      );

                                      _shouldSetState = true;
                                      context.pop();
                                      if ((_model.apiStatus?.statusCode ??
                                              200) ==
                                          FFAppConstants.apiStatus201) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup
                                                  .deleteAccountCall
                                                  .apiMessage(
                                                (_model.apiStatus?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                        FFAppState().authToken = '';
                                        FFAppState().deviceToken =
                                            'dummydevicetoken';
                                        FFAppState().deviceUniqueId =
                                            'dummyuniqueid';
                                        FFAppState().userProfileImageUrl = '';
                                        FFAppState().userName = '';
                                        FFAppState().userEmail = '';
                                        FFAppState().IsRememberMe = true;
                                        FFAppState().userMobile = '';
                                        FFAppState().userDob = '';
                                        FFAppState().userCountryCode = '';
                                        FFAppState().isProfileCreated = 0;

                                        context.goNamed(
                                          LoginWidget.routeName,
                                          queryParameters: {
                                            'showBackButton': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );

                                        return;
                                      } else if (HandyFindersAPIsGroup
                                          .deleteAccountCall
                                          .apiStatus(
                                        (_model.apiStatus?.jsonBody ?? ''),
                                      )!) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup
                                                  .deleteAccountCall
                                                  .apiMessage(
                                                (_model.apiStatus?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                        FFAppState().authToken = '';
                                        FFAppState().deviceToken =
                                            'dummydevicetoken';
                                        FFAppState().deviceUniqueId =
                                            'dummyuniqueid';
                                        FFAppState().userProfileImageUrl = '';
                                        FFAppState().userName = '';
                                        FFAppState().userEmail = '';
                                        FFAppState().IsRememberMe = true;
                                        FFAppState().userMobile = '';
                                        FFAppState().userDob = '';
                                        FFAppState().userCountryCode = '';
                                        FFAppState().isProfileCreated = 0;

                                        context.goNamed(
                                          LoginWidget.routeName,
                                          queryParameters: {
                                            'showBackButton': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );

                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup
                                                  .deleteAccountCall
                                                  .apiMessage(
                                                (_model.apiStatus?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                        return;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                        safeSetState(() {});
                      },
                    ),
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
