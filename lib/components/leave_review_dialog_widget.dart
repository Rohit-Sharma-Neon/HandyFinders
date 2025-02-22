import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'leave_review_dialog_model.dart';
export 'leave_review_dialog_model.dart';

class LeaveReviewDialogWidget extends StatefulWidget {
  const LeaveReviewDialogWidget({
    super.key,
    required this.otherUserId,
    required this.requestId,
  });

  final int? otherUserId;
  final int? requestId;

  @override
  State<LeaveReviewDialogWidget> createState() =>
      _LeaveReviewDialogWidgetState();
}

class _LeaveReviewDialogWidgetState extends State<LeaveReviewDialogWidget> {
  late LeaveReviewDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveReviewDialogModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                    'Leave a Review',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
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
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 2.0, 8.0),
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
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99.0),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1613145997970-db84a7975fbb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fHx8MTczNzg3NjgzNXww&ixlib=rb-4.0.3&q=80&w=1080',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'How was your experience interacting\nwith Darience?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF24272E),
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: RatingBar.builder(
                    onRatingUpdate: (newValue) =>
                        safeSetState(() => _model.ratingBarValue = newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB133),
                    ),
                    direction: Axis.horizontal,
                    initialRating: _model.ratingBarValue ??= 3.0,
                    unratedColor: Color(0xFFD7D7D7),
                    itemCount: 5,
                    itemSize: 45.0,
                    glowColor: Color(0xFFFFB133),
                  ),
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
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
                        hintText: 'Write description',
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
                      maxLines: 8,
                      maxLength: 300,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      keyboardType: TextInputType.multiline,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.baseButtonComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BaseButtonComponentWidget(
                  title: 'Submit',
                  isLoading: false,
                  removeScaffoldPadding: true,
                  passOnTapCallback: () async {
                    var _shouldSetState = false;
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    if (_model.ratingBarValue! < 1.0) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please select at least 1 star rating',
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
                    } else {
                      unawaited(
                        () async {
                          await actions.showBaseLoader(
                            context,
                          );
                        }(),
                      );
                      _model.givenReviewResponse =
                          await HandyFindersAPIsGroup.giveReviewCall.call(
                        authToken: FFAppState().authToken,
                        otherUserId: widget.otherUserId,
                        requestId: widget.requestId,
                        rating: _model.ratingBarValue?.toString(),
                        review: _model.textController.text,
                      );

                      _shouldSetState = true;
                      if (HandyFindersAPIsGroup.giveReviewCall.apiStatus(
                        (_model.givenReviewResponse?.jsonBody ?? ''),
                      )!) {
                        context.safePop();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              HandyFindersAPIsGroup.giveReviewCall.apiMessage(
                                (_model.givenReviewResponse?.jsonBody ?? ''),
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
                      } else {
                        context.safePop();
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              HandyFindersAPIsGroup.giveReviewCall.apiMessage(
                                (_model.givenReviewResponse?.jsonBody ?? ''),
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
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
