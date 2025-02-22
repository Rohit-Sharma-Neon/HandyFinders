import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'select_user_dialog_model.dart';
export 'select_user_dialog_model.dart';

class SelectUserDialogWidget extends StatefulWidget {
  const SelectUserDialogWidget({
    super.key,
    required this.requestId,
    required this.itemIndex,
  });

  final int? requestId;
  final int? itemIndex;

  @override
  State<SelectUserDialogWidget> createState() => _SelectUserDialogWidgetState();
}

class _SelectUserDialogWidgetState extends State<SelectUserDialogWidget> {
  late SelectUserDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectUserDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isFetchingUsers = true;
      safeSetState(() {});
      _model.usersListResponse = await HandyFindersAPIsGroup.usersListCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isFetchingUsers = false;
      safeSetState(() {});
    });
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
                    'Select User',
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
                  'Username',
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
                autovalidateMode: AutovalidateMode.disabled,
                child: Builder(
                  builder: (context) {
                    if (_model.isFetchingUsers) {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Lottie.network(
                            'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 55.0,
                            fit: BoxFit.fitHeight,
                            animate: true,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.userDropDownValueController ??=
                              FormFieldController<String>(null),
                          options: HandyFindersAPIsGroup.usersListCall
                              .apiList(
                                (_model.usersListResponse?.jsonBody ?? ''),
                              )!
                              .map((e) => getJsonField(
                                    e,
                                    r'''$.user_name''',
                                  ))
                              .toList()
                              .map((e) => e.toString())
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.userDropDownValue = val),
                          width: double.infinity,
                          height: 55.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0x7F24272E),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Comfortaa',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select User',
                          searchHintText: 'Search User',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0x8024272E),
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFE7E7E7),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      );
                    }
                  },
                ),
              ),
              Builder(
                builder: (context) {
                  if (_model.isUserNotSelected ?? false) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Please select username',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0x00FFFFFF),
                              fontSize: 1.0,
                              letterSpacing: 0.0,
                              lineHeight: 0.0,
                            ),
                      ),
                    );
                  }
                },
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
                      if (_model.userDropDownValue == null) {
                        return;
                      }
                      if (_model.userDropDownValue != null &&
                          _model.userDropDownValue != '') {
                        _model.isUserNotSelected = false;
                        safeSetState(() {});
                        unawaited(
                          () async {
                            await actions.showBaseLoader(
                              context,
                            );
                          }(),
                        );
                        _model.apiResponse = await HandyFindersAPIsGroup
                            .markRequestAsCompletedCall
                            .call(
                          authToken: FFAppState().authToken,
                          postId: widget.requestId,
                          userName: _model.userDropDownValue,
                        );

                        _shouldSetState = true;
                        context.safePop();
                        Navigator.pop(context);
                        if (HandyFindersAPIsGroup.markRequestAsCompletedCall
                            .apiStatus(
                          (_model.apiResponse?.jsonBody ?? ''),
                        )!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.markRequestAsCompletedCall
                                    .apiMessage(
                                  (_model.apiResponse?.jsonBody ?? ''),
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
                          FFAppState().removeAtIndexFromRequestTabCurrentList(
                              widget.itemIndex!);
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.markRequestAsCompletedCall
                                    .apiMessage(
                                  (_model.apiResponse?.jsonBody ?? ''),
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
                        _model.isUserNotSelected = true;
                        safeSetState(() {});
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
