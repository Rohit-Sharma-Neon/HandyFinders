import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'comments_bottom_sheet_model.dart';
export 'comments_bottom_sheet_model.dart';

class CommentsBottomSheetWidget extends StatefulWidget {
  const CommentsBottomSheetWidget({
    super.key,
    this.id,
    this.index,
  });

  final int? id;
  final int? index;

  @override
  State<CommentsBottomSheetWidget> createState() =>
      _CommentsBottomSheetWidgetState();
}

class _CommentsBottomSheetWidgetState extends State<CommentsBottomSheetWidget> {
  late CommentsBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.commentResponse =
          await HandyFindersAPIsGroup.requestTipCommentListCall.call(
        authToken: FFAppState().authToken,
        postId: widget.id,
        page: _model.currentPageIndex,
      );

      _model.commentsList = HandyFindersAPIsGroup.requestTipCommentListCall
          .apiList(
            (_model.commentResponse?.jsonBody ?? ''),
          )!
          .toList()
          .cast<dynamic>();
      _model.isFetchingComments = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.requestTipCommentListCall.apiStatus(
        (_model.commentResponse?.jsonBody ?? ''),
      )!) {
        _model.currentPageIndex = 2;
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.requestTipCommentListCall.apiMessage(
                (_model.commentResponse?.jsonBody ?? ''),
              )!,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        return;
      }
    });

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 17.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                child: Container(
                  width: 60.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Color(0x4C24272E),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Text(
                  'Comments',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Comfortaa',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (_model.isFetchingComments) {
                    return wrapWithModel(
                      model: _model.baseLoaderComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BaseLoaderComponentWidget(),
                    );
                  } else {
                    return Builder(
                      builder: (context) {
                        if (_model.commentsList.isNotEmpty) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final comments =
                                        _model.commentsList.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(comments.length,
                                              (commentsIndex) {
                                        final commentsItem =
                                            comments[commentsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  OtherUserProfileWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'userId': serializeParam(
                                                      getJsonField(
                                                        commentsItem,
                                                        r'''$.user_detail.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99.0),
                                                    child: Image.network(
                                                      '${FFAppConstants.baseImageUrl}${getJsonField(
                                                        commentsItem,
                                                        r'''$.user_detail.profile_picture''',
                                                      ).toString()}',
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        commentsItem,
                                                        r'''$.user_detail.user_name''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.5,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 5.5,
                                                      height: 5.5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x4C24272E),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 3.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      functions.getTimeAgo(
                                                          getJsonField(
                                                        commentsItem,
                                                        r'''$.updated_at''',
                                                      ).toString()),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Color(
                                                                0xFFB4BBC6),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 9.0, 0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  commentsItem,
                                                  r'''$.comment''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xC024272E),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        );
                                      })
                                          .divide(SizedBox(height: 20.0))
                                          .addToEnd(SizedBox(height: 15.0)),
                                    );
                                  },
                                ),
                                if (_model.commentsList.length >= 10)
                                  Builder(
                                    builder: (context) {
                                      if (HandyFindersAPIsGroup
                                              .requestTipCommentListCall
                                              .apiLastPage(
                                            (_model.commentResponse?.jsonBody ??
                                                ''),
                                          )! <
                                          _model.currentPageIndex) {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 25.0),
                                            child: Text(
                                              'No More Data!',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .hintTextColor,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.baseButtonComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: BaseButtonComponentWidget(
                                              title: 'Load More',
                                              buttonColor: Color(0x00FFFFFF),
                                              textColor: Color(0xFF6E6E6E),
                                              isLoading: _model.isLoadingMore,
                                              removeScaffoldPadding: true,
                                              passOnTapCallback: () async {
                                                var _shouldSetState = false;
                                                _model.isLoadingMore = true;
                                                safeSetState(() {});
                                                _model.loadMoreCommentResponse =
                                                    await HandyFindersAPIsGroup
                                                        .requestTipCommentListCall
                                                        .call(
                                                  authToken:
                                                      FFAppState().authToken,
                                                  postId: widget.id,
                                                  page: _model.currentPageIndex,
                                                );

                                                _shouldSetState = true;
                                                _model.isLoadingMore = false;
                                                safeSetState(() {});
                                                if (HandyFindersAPIsGroup
                                                    .requestTipCommentListCall
                                                    .apiStatus(
                                                  (_model.loadMoreCommentResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!) {
                                                  _model.returnedList =
                                                      await actions.addJsonList(
                                                    _model.commentsList
                                                        .toList(),
                                                    HandyFindersAPIsGroup
                                                        .requestTipCommentListCall
                                                        .apiList(
                                                          (_model.loadMoreCommentResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .toList(),
                                                  );
                                                  _shouldSetState = true;
                                                  _model.commentsList = _model
                                                      .returnedList!
                                                      .toList()
                                                      .cast<dynamic>();
                                                  _model.currentPageIndex =
                                                      _model.currentPageIndex +
                                                          1;
                                                  safeSetState(() {});
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
                                                            .requestTipCommentListCall
                                                            .apiMessage(
                                                          (_model.loadMoreCommentResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                              ],
                            ),
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'No Comment Found!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .hintTextColor,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: 45.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () async {
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Add a comment...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFE5E5E5),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          minLines: 1,
                          maxLength: 500,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: TextInputType.multiline,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.isSendingComment) {
                        return Lottie.network(
                          'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                          width: 45.0,
                          height: 45.0,
                          fit: BoxFit.fitHeight,
                          animate: true,
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (_model.textController.text != '') {
                                _model.isSendingComment = true;
                                safeSetState(() {});
                                _model.addCommentResponse =
                                    await HandyFindersAPIsGroup.addCommentCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  postId: widget.id,
                                  comment: _model.textController.text,
                                );

                                _shouldSetState = true;
                                _model.isSendingComment = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.addCommentCall
                                    .apiStatus(
                                  (_model.addCommentResponse?.jsonBody ?? ''),
                                )!) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.addCommentCall
                                            .apiMessage(
                                          (_model.addCommentResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.updatedPostJson =
                                      await actions.updateCommentsCount(
                                    FFAppState()
                                        .homeTabPostList
                                        .elementAtOrNull(widget.index!)!,
                                    valueOrDefault<int>(
                                      _model.commentsList.length,
                                      0,
                                    ),
                                  );
                                  _shouldSetState = true;
                                  FFAppState().updateHomeTabPostListAtIndex(
                                    widget.index!,
                                    (_) => _model.updatedPostJson!,
                                  );
                                  _model.updatePage(() {});
                                  _model.addToCommentsList(HandyFindersAPIsGroup
                                      .addCommentCall
                                      .apiCommentObject(
                                    (_model.addCommentResponse?.jsonBody ?? ''),
                                  ));
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.addCommentCall
                                            .apiMessage(
                                          (_model.addCommentResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            child: Container(
                              width: 50.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: _model.textController.text != ''
                                    ? FlutterFlowTheme.of(context).primary
                                    : Color(0xFFE5E5E5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(11.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/icSend.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
