import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'update_email_dialog_model.dart';
export 'update_email_dialog_model.dart';

class UpdateEmailDialogWidget extends StatefulWidget {
  const UpdateEmailDialogWidget({super.key});

  @override
  State<UpdateEmailDialogWidget> createState() =>
      _UpdateEmailDialogWidgetState();
}

class _UpdateEmailDialogWidgetState extends State<UpdateEmailDialogWidget> {
  late UpdateEmailDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEmailDialogModel());

    _model.dialogEmailTextController ??= TextEditingController();
    _model.dialogEmailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Email',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/icCross.png',
                            width: 12.0,
                            height: 12.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                endIndent: 8.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'New Email',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF24272E),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.dialogEmailTextController,
                      focusNode: _model.dialogEmailFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF717171),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Enter your new email',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).hintTextColor,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.primaryBorderRadius,
                            0.0,
                          )),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.primaryBorderRadius,
                            0.0,
                          )),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.primaryBorderRadius,
                            0.0,
                          )),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.primaryBorderRadius,
                            0.0,
                          )),
                        ),
                        filled: true,
                        fillColor: Color(0xFFE7E7E7),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 23.0, 0.0, 23.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                      maxLength: 30,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.dialogEmailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.baseButtonComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BaseButtonComponentWidget(
                    title: 'Done',
                    isLoading: false,
                    removeScaffoldPadding: true,
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
                      _model.sendOtpResponse =
                          await HandyFindersAPIsGroup.sendOTPCall.call(
                        email: _model.dialogEmailTextController.text,
                        userEmailId: FFAppState().userId,
                        isUpdatingEmail: 1,
                      );

                      _shouldSetState = true;
                      context.safePop();
                      Navigator.pop(context);
                      if (HandyFindersAPIsGroup.sendOTPCall.apiStatus(
                        (_model.sendOtpResponse?.jsonBody ?? ''),
                      )!) {
                        context.pushNamed(
                          VerifyEmailOtpWidget.routeName,
                          queryParameters: {
                            'email': serializeParam(
                              _model.dialogEmailTextController.text,
                              ParamType.String,
                            ),
                            'isForgettingPassword': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                            'isUpdatingEmail': serializeParam(
                              1,
                              ParamType.int,
                            ),
                            'password': serializeParam(
                              '',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              HandyFindersAPIsGroup.sendOTPCall.apiMessage(
                                (_model.sendOtpResponse?.jsonBody ?? ''),
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
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
