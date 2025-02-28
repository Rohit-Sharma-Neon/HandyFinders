import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/comments_bottom_sheet_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import '/pages/edit_remove_menu_pop_up/edit_remove_menu_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'your_post_model.dart';
export 'your_post_model.dart';

class YourPostWidget extends StatefulWidget {
  const YourPostWidget({super.key});

  static String routeName = 'YourPost';
  static String routePath = '/yourPost';

  @override
  State<YourPostWidget> createState() => _YourPostWidgetState();
}

class _YourPostWidgetState extends State<YourPostWidget>
    with TickerProviderStateMixin {
  late YourPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourPostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isPostFetching = true;
      safeSetState(() {});
      _model.postApiResponse = await HandyFindersAPIsGroup.yourPostCall.call(
        type: 'request',
        authToken: FFAppState().authToken,
        page: 1,
      );

      _model.isPostFetching = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.yourPostCall.apiStatus(
        (_model.postApiResponse?.jsonBody ?? ''),
      )!) {
        _model.currentPostPageIndex = 2;
        FFAppState().yourPostForumList = HandyFindersAPIsGroup.yourPostCall
            .apiDataList(
              (_model.postApiResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.yourPostCall.apiMessage(
                (_model.postApiResponse?.jsonBody ?? ''),
              )!,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 3000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        return;
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
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
                  title: 'Your Post',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9FCFF),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.selectedTabIndex != 0) {
                                _model.selectedTabIndex = 0;
                                safeSetState(() {});
                                await _model.pageViewController?.animateToPage(
                                  _model.selectedTabIndex,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                return;
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: 115.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: _model.selectedTabIndex == 0
                                    ? Colors.white
                                    : Color(0x00F1F4F8),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: _model.selectedTabIndex == 0
                                        ? 4.0
                                        : 0.0,
                                    color: _model.selectedTabIndex == 0
                                        ? Color(0x262B2B2B)
                                        : Colors.transparent,
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Post/Forum',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: _model.selectedTabIndex == 0
                                                ? Color(0xFF14181B)
                                                : Color(0xFF57636C),
                                            fontSize: 14.0,
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
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (_model.selectedTabIndex != 1) {
                                _model.selectedTabIndex = 1;
                                safeSetState(() {});
                                unawaited(
                                  () async {
                                    await _model.pageViewController
                                        ?.animateToPage(
                                      _model.selectedTabIndex,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  }(),
                                );
                                if (_model.isInitialTipLoaded) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                _model.isTipFetching = true;
                                safeSetState(() {});
                                _model.initialTipApiResponse =
                                    await HandyFindersAPIsGroup.yourPostCall
                                        .call(
                                  type: 'tip',
                                  authToken: FFAppState().authToken,
                                  page: 1,
                                );

                                _shouldSetState = true;
                                _model.isTipFetching = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.yourPostCall
                                    .apiStatus(
                                  (_model.initialTipApiResponse?.jsonBody ??
                                      ''),
                                )!) {
                                  FFAppState().yourTipAdviceList =
                                      HandyFindersAPIsGroup.yourPostCall
                                          .apiDataList(
                                            (_model.initialTipApiResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  _model.isInitialTipLoaded = true;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.yourPostCall
                                            .apiMessage(
                                          (_model.initialTipApiResponse
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
                              width: 115.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.selectedTabIndex == 1
                                      ? Colors.white
                                      : Color(0x00F2F8FB),
                                  Colors.transparent,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: _model.selectedTabIndex == 1
                                        ? 4.0
                                        : 0.0,
                                    color: _model.selectedTabIndex == 1
                                        ? Color(0x262B2B2B)
                                        : Colors.transparent,
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tip/Advice',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: _model.selectedTabIndex == 1
                                                ? Color(0xFF14181B)
                                                : Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['containerOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500.0,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Builder(
                        builder: (context) {
                          if (_model.isPostFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else {
                            return Builder(
                              builder: (context) {
                                if (HandyFindersAPIsGroup.yourPostCall
                                            .apiDataList(
                                          (_model.postApiResponse?.jsonBody ??
                                              ''),
                                        ) !=
                                        null &&
                                    (HandyFindersAPIsGroup.yourPostCall
                                            .apiDataList(
                                      (_model.postApiResponse?.jsonBody ?? ''),
                                    ))!
                                        .isNotEmpty) {
                                  return RefreshIndicator(
                                    key: Key('RefreshIndicator_5r2hqg0q'),
                                    onRefresh: () async {
                                      _model.isPostFetching = true;
                                      safeSetState(() {});
                                      _model.refreshedPostApiResponse =
                                          await HandyFindersAPIsGroup
                                              .yourPostCall
                                              .call(
                                        type: 'request',
                                        authToken: FFAppState().authToken,
                                        page: 1,
                                      );

                                      _model.isPostFetching = false;
                                      safeSetState(() {});
                                      if (HandyFindersAPIsGroup.yourPostCall
                                          .apiStatus(
                                        (_model.refreshedPostApiResponse
                                                ?.jsonBody ??
                                            ''),
                                      )!) {
                                        FFAppState().yourPostForumList =
                                            HandyFindersAPIsGroup.yourPostCall
                                                .apiDataList(
                                                  (_model.refreshedPostApiResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<dynamic>();
                                        _model.currentPostPageIndex = 2;
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup.yourPostCall
                                                  .apiMessage(
                                                (_model.refreshedPostApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        return;
                                      }
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final localPostList = FFAppState()
                                                  .yourPostForumList
                                                  .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        localPostList.length,
                                                        (localPostListIndex) {
                                                  final localPostListItem =
                                                      localPostList[
                                                          localPostListIndex];
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD5E1E9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(11.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFE6F1F9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            11.0,
                                                                            6.0,
                                                                            11.0,
                                                                            6.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        localPostListItem,
                                                                        r'''$.category_id''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Comfortaa',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.5,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .selectedTabIndex ==
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          11.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      localPostListItem,
                                                                      r'''$.cost''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Comfortaa',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                        ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showAlignedDialog(
                                                                          barrierColor:
                                                                              Color(0x00FFFFFF),
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              false,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(-1.9, 3.8).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: EditRemoveMenuPopUpWidget(
                                                                                    onEdit: () async {
                                                                                      Navigator.pop(context);

                                                                                      context.pushNamed(
                                                                                        PostRequestForumWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'isUpdating': serializeParam(
                                                                                            true,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'jsonData': serializeParam(
                                                                                            localPostListItem,
                                                                                            ParamType.JSON,
                                                                                          ),
                                                                                          'itemIndex': serializeParam(
                                                                                            localPostListIndex,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    onRemove: () async {
                                                                                      Navigator.pop(context);
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: CustomConfirmationDialogWidget(
                                                                                                  title: 'Are you sure you want to remove this comment ?',
                                                                                                  onYesTap: () async {
                                                                                                    context.safePop();
                                                                                                    unawaited(
                                                                                                      () async {
                                                                                                        await actions.showBaseLoader(
                                                                                                          context,
                                                                                                        );
                                                                                                      }(),
                                                                                                    );
                                                                                                    _model.removePostResponse = await HandyFindersAPIsGroup.removeRequestCall.call(
                                                                                                      authToken: FFAppState().authToken,
                                                                                                      postId: getJsonField(
                                                                                                        localPostListItem,
                                                                                                        r'''$.id''',
                                                                                                      ).toString(),
                                                                                                    );

                                                                                                    context.safePop();
                                                                                                    if (HandyFindersAPIsGroup.removeRequestCall.apiStatus(
                                                                                                      (_model.removePostResponse?.jsonBody ?? ''),
                                                                                                    )!) {
                                                                                                      ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            HandyFindersAPIsGroup.removeRequestCall.apiMessage(
                                                                                                              (_model.removePostResponse?.jsonBody ?? ''),
                                                                                                            )!,
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        ),
                                                                                                      );
                                                                                                      FFAppState().removeAtIndexFromYourPostForumList(localPostListIndex);
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            HandyFindersAPIsGroup.removeRequestCall.apiMessage(
                                                                                                              (_model.removePostResponse?.jsonBody ?? ''),
                                                                                                            )!,
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFE8E8E8),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .more_vert,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        13.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                localPostListItem,
                                                                r'''$.title''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions.primaryDateFormate(
                                                                  getJsonField(
                                                                    localPostListItem,
                                                                    r'''$.updated_at''',
                                                                  ).toString(),
                                                                  'MMMM dd, yyyy'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.5,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                localPostListItem,
                                                                r'''$.description''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (getJsonField(
                                                                    localPostListItem,
                                                                    r'''$.images[0].image''',
                                                                  ) !=
                                                                  null
                                                              ? true
                                                              : false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                    localPostListItem,
                                                                    r'''$.images[0].image''',
                                                                  ).toString()}',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (getJsonField(
                                                                              localPostListItem,
                                                                              r'''$.is_liked''',
                                                                            ) ==
                                                                            1) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              unawaited(
                                                                                () async {
                                                                                  await actions.showBaseLoader(
                                                                                    context,
                                                                                  );
                                                                                }(),
                                                                              );
                                                                              _model.primaryDislikeResponse = await HandyFindersAPIsGroup.likeDislikeCall.call(
                                                                                authToken: FFAppState().authToken,
                                                                                postId: getJsonField(
                                                                                  localPostListItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                                statusKey: 0,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              context.safePop();
                                                                              if (HandyFindersAPIsGroup.likeDislikeCall.apiStatus(
                                                                                (_model.primaryDislikeResponse?.jsonBody ?? ''),
                                                                              )!) {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.primaryDislikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                _model.returnedPrimaryDislikeJson = await actions.updateLikeStatusKeyValue(
                                                                                  localPostListItem,
                                                                                  false,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                FFAppState().updateYourPostForumListAtIndex(
                                                                                  localPostListIndex,
                                                                                  (_) => _model.returnedPrimaryDislikeJson!,
                                                                                );
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.primaryDislikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_rounded,
                                                                              color: Color(0xFFFF0000),
                                                                              size: 25.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              unawaited(
                                                                                () async {
                                                                                  await actions.showBaseLoader(
                                                                                    context,
                                                                                  );
                                                                                }(),
                                                                              );
                                                                              _model.primaryLikeResponse = await HandyFindersAPIsGroup.likeDislikeCall.call(
                                                                                authToken: FFAppState().authToken,
                                                                                postId: getJsonField(
                                                                                  localPostListItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                                statusKey: 1,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              context.safePop();
                                                                              if (HandyFindersAPIsGroup.likeDislikeCall.apiStatus(
                                                                                (_model.primaryLikeResponse?.jsonBody ?? ''),
                                                                              )!) {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.primaryLikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                _model.returnedPrimaryJson = await actions.updateLikeStatusKeyValue(
                                                                                  localPostListItem,
                                                                                  true,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                FFAppState().yourPostForumList = _model.returnedPrimaryJson!.toList().cast<dynamic>();
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.primaryLikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_border_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 25.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          localPostListItem,
                                                                          r'''$.total_liked''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Comfortaa',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                child: CommentsBottomSheetWidget(),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/icMessage.png',
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            localPostListItem,
                                                                            r'''$.total_comment''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Comfortaa',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await Share
                                                                          .share(
                                                                        'Post Share',
                                                                        sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/icShare.png',
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '5',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Comfortaa',
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(height: 16.0))
                                                    .addToEnd(SizedBox(
                                                        height: HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .apiLastPage(
                                                                  (_model.postApiResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )! >
                                                                1
                                                            ? 0.0
                                                            : 20.0)),
                                              );
                                            },
                                          ),
                                          if (HandyFindersAPIsGroup.yourPostCall
                                                  .apiLastPage(
                                                (_model.postApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )! >
                                              1)
                                            Builder(
                                              builder: (context) {
                                                if (_model
                                                        .currentPostPageIndex <=
                                                    HandyFindersAPIsGroup
                                                        .yourPostCall
                                                        .apiLastPage(
                                                      (_model.postApiResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .baseButtonComponentModel1,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          BaseButtonComponentWidget(
                                                        title: 'Load More',
                                                        buttonColor:
                                                            Color(0x00FFFFFF),
                                                        textColor:
                                                            Color(0xFF6E6E6E),
                                                        isLoading: _model
                                                            .isLoadingMorePost,
                                                        removeScaffoldPadding:
                                                            true,
                                                        passOnTapCallback:
                                                            () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model
                                                                  .currentPostPageIndex <=
                                                              HandyFindersAPIsGroup
                                                                  .yourPostCall
                                                                  .apiLastPage(
                                                                (_model.postApiResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!) {
                                                            _model.isLoadingMorePost =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.loadMorePostResponse =
                                                                await HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .call(
                                                              type: 'request',
                                                              authToken:
                                                                  FFAppState()
                                                                      .authToken,
                                                              page: 2,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (HandyFindersAPIsGroup
                                                                .yourPostCall
                                                                .apiStatus(
                                                              (_model.loadMorePostResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!) {
                                                              _model.returnedList =
                                                                  await actions
                                                                      .addJsonList(
                                                                FFAppState()
                                                                    .yourPostForumList
                                                                    .toList(),
                                                                HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .apiDataList(
                                                                      (_model.loadMorePostResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              FFAppState()
                                                                      .yourPostForumList =
                                                                  _model
                                                                      .returnedList!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              _model.isLoadingMorePost =
                                                                  false;
                                                              _model.currentPostPageIndex =
                                                                  _model.currentPostPageIndex +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    HandyFindersAPIsGroup
                                                                        .yourPostCall
                                                                        .apiMessage(
                                                                      (_model.loadMorePostResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 25.0),
                                                    child: Text(
                                                      'No More Data!',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Comfortaa',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .hintTextColor,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'No Post/Forum Found!',
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
                      Builder(
                        builder: (context) {
                          if (_model.isTipFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else {
                            return Builder(
                              builder: (context) {
                                if (HandyFindersAPIsGroup.yourPostCall
                                            .apiDataList(
                                          (_model.initialTipApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        null &&
                                    (HandyFindersAPIsGroup.yourPostCall
                                            .apiDataList(
                                      (_model.initialTipApiResponse?.jsonBody ??
                                          ''),
                                    ))!
                                        .isNotEmpty) {
                                  return RefreshIndicator(
                                    key: Key('RefreshIndicator_esp5po7e'),
                                    onRefresh: () async {
                                      _model.isPostFetching = true;
                                      safeSetState(() {});
                                      _model.refreshedTipApiResponse =
                                          await HandyFindersAPIsGroup
                                              .yourPostCall
                                              .call(
                                        type: 'tip',
                                        authToken: FFAppState().authToken,
                                        page: 1,
                                      );

                                      _model.isPostFetching = false;
                                      safeSetState(() {});
                                      if (HandyFindersAPIsGroup.yourPostCall
                                          .apiStatus(
                                        (_model.refreshedTipApiResponse
                                                ?.jsonBody ??
                                            ''),
                                      )!) {
                                        FFAppState().yourTipAdviceList =
                                            HandyFindersAPIsGroup.yourPostCall
                                                .apiDataList(
                                                  (_model.refreshedTipApiResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<dynamic>();
                                        _model.currentTipPageIndex = 2;
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup.yourPostCall
                                                  .apiMessage(
                                                (_model.refreshedTipApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        return;
                                      }
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final pageStateTipList =
                                                  FFAppState()
                                                      .yourTipAdviceList
                                                      .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        pageStateTipList.length,
                                                        (pageStateTipListIndex) {
                                                  final pageStateTipListItem =
                                                      pageStateTipList[
                                                          pageStateTipListIndex];
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD5E1E9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(11.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFE6F1F9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            11.0,
                                                                            6.0,
                                                                            11.0,
                                                                            6.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        pageStateTipListItem,
                                                                        r'''$.category_id''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Comfortaa',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.5,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .selectedTabIndex ==
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          11.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      pageStateTipListItem,
                                                                      r'''$.cost''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Comfortaa',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                        ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showAlignedDialog(
                                                                          barrierColor:
                                                                              Color(0x00FFFFFF),
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              false,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(-1.9, 3.8).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: EditRemoveMenuPopUpWidget(
                                                                                    onEdit: () async {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    onRemove: () async {
                                                                                      Navigator.pop(context);
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: CustomConfirmationDialogWidget(
                                                                                                  title: 'Are you sure you want to remove this item ?',
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
                                                                                                    _model.removeApiResponse = await HandyFindersAPIsGroup.removeRequestCall.call(
                                                                                                      authToken: FFAppState().authToken,
                                                                                                      postId: getJsonField(
                                                                                                        pageStateTipListItem,
                                                                                                        r'''$.id''',
                                                                                                      ).toString(),
                                                                                                    );

                                                                                                    _shouldSetState = true;
                                                                                                    context.safePop();
                                                                                                    if (HandyFindersAPIsGroup.removeRequestCall.apiStatus(
                                                                                                      (_model.removeApiResponse?.jsonBody ?? ''),
                                                                                                    )!) {
                                                                                                      ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            HandyFindersAPIsGroup.removeRequestCall.apiMessage(
                                                                                                              (_model.removeApiResponse?.jsonBody ?? ''),
                                                                                                            )!,
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        ),
                                                                                                      );
                                                                                                      FFAppState().removeAtIndexFromYourTipAdviceList(pageStateTipListIndex);
                                                                                                      safeSetState(() {});
                                                                                                      return;
                                                                                                    } else {
                                                                                                      ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            HandyFindersAPIsGroup.removeRequestCall.apiMessage(
                                                                                                              (_model.removeApiResponse?.jsonBody ?? ''),
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
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFE8E8E8),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .more_vert,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        13.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                pageStateTipListItem,
                                                                r'''$.title''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions.primaryDateFormate(
                                                                  getJsonField(
                                                                    pageStateTipListItem,
                                                                    r'''$.updated_at''',
                                                                  ).toString(),
                                                                  'MMMM dd, yyyy'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.5,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                pageStateTipListItem,
                                                                r'''$.description''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (getJsonField(
                                                                    pageStateTipListItem,
                                                                    r'''$.images[0].image''',
                                                                  ) !=
                                                                  null
                                                              ? true
                                                              : false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                    pageStateTipListItem,
                                                                    r'''$.images[0].image''',
                                                                  ).toString()}',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (getJsonField(
                                                                              pageStateTipListItem,
                                                                              r'''$.is_liked''',
                                                                            ) ==
                                                                            1) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              unawaited(
                                                                                () async {
                                                                                  await actions.showBaseLoader(
                                                                                    context,
                                                                                  );
                                                                                }(),
                                                                              );
                                                                              _model.secondaryDislikeResponse = await HandyFindersAPIsGroup.likeDislikeCall.call(
                                                                                authToken: FFAppState().authToken,
                                                                                postId: getJsonField(
                                                                                  pageStateTipListItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                                statusKey: 0,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              context.safePop();
                                                                              if (HandyFindersAPIsGroup.likeDislikeCall.apiStatus(
                                                                                (_model.secondaryDislikeResponse?.jsonBody ?? ''),
                                                                              )!) {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.secondaryDislikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                _model.returnedSecondaryDislikeJson = await actions.updateLikeStatusKeyValue(
                                                                                  pageStateTipListItem,
                                                                                  false,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                FFAppState().updateYourTipAdviceListAtIndex(
                                                                                  pageStateTipListIndex,
                                                                                  (_) => _model.returnedSecondaryDislikeJson!,
                                                                                );
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.secondaryDislikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_rounded,
                                                                              color: Color(0xFFFF0000),
                                                                              size: 25.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              unawaited(
                                                                                () async {
                                                                                  await actions.showBaseLoader(
                                                                                    context,
                                                                                  );
                                                                                }(),
                                                                              );
                                                                              _model.secondaryLikeResponse = await HandyFindersAPIsGroup.likeDislikeCall.call(
                                                                                authToken: FFAppState().authToken,
                                                                                postId: getJsonField(
                                                                                  pageStateTipListItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                                statusKey: 1,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              context.safePop();
                                                                              if (HandyFindersAPIsGroup.likeDislikeCall.apiStatus(
                                                                                (_model.secondaryLikeResponse?.jsonBody ?? ''),
                                                                              )!) {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.secondaryLikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                _model.returnedSecondaryJson = await actions.updateLikeStatusKeyValue(
                                                                                  pageStateTipListItem,
                                                                                  true,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                FFAppState().updateHomeTabPostListAtIndex(
                                                                                  pageStateTipListItem,
                                                                                  (_) => _model.returnedSecondaryJson!,
                                                                                );
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                        (_model.secondaryLikeResponse?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_border_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 25.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          pageStateTipListItem,
                                                                          r'''$.total_liked''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Comfortaa',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                child: CommentsBottomSheetWidget(),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/icMessage.png',
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            pageStateTipListItem,
                                                                            r'''$.total_comment''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Comfortaa',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await Share
                                                                          .share(
                                                                        'Post Share',
                                                                        sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/icShare.png',
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '5',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Comfortaa',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(height: 16.0))
                                                    .addToEnd(SizedBox(
                                                        height: HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .apiLastPage(
                                                                  (_model.initialTipApiResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )! >
                                                                1
                                                            ? 0.0
                                                            : 20.0)),
                                              );
                                            },
                                          ),
                                          if (HandyFindersAPIsGroup.yourPostCall
                                                  .apiLastPage(
                                                (_model.initialTipApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )! >
                                              1)
                                            Builder(
                                              builder: (context) {
                                                if (_model
                                                        .currentPostPageIndex <=
                                                    HandyFindersAPIsGroup
                                                        .yourPostCall
                                                        .apiLastPage(
                                                      (_model.postApiResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .baseButtonComponentModel2,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          BaseButtonComponentWidget(
                                                        title: 'Load More',
                                                        buttonColor:
                                                            Color(0x00FFFFFF),
                                                        textColor:
                                                            Color(0xFF6E6E6E),
                                                        isLoading: _model
                                                            .isLoadingMoreTip,
                                                        removeScaffoldPadding:
                                                            true,
                                                        passOnTapCallback:
                                                            () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model
                                                                  .currentTipPageIndex <=
                                                              HandyFindersAPIsGroup
                                                                  .yourPostCall
                                                                  .apiLastPage(
                                                                (_model.initialTipApiResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!) {
                                                            _model.isLoadingMoreTip =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.loadMoreTipResponse =
                                                                await HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .call(
                                                              type: 'tip',
                                                              authToken:
                                                                  FFAppState()
                                                                      .authToken,
                                                              page: 2,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (HandyFindersAPIsGroup
                                                                .yourPostCall
                                                                .apiStatus(
                                                              (_model.loadMoreTipResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!) {
                                                              _model.returnedTipList =
                                                                  await actions
                                                                      .addJsonList(
                                                                FFAppState()
                                                                    .yourTipAdviceList
                                                                    .toList(),
                                                                HandyFindersAPIsGroup
                                                                    .yourPostCall
                                                                    .apiDataList(
                                                                      (_model.loadMoreTipResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              FFAppState()
                                                                      .yourTipAdviceList =
                                                                  _model
                                                                      .returnedTipList!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              safeSetState(
                                                                  () {});
                                                              _model.isLoadingMoreTip =
                                                                  false;
                                                              _model.currentTipPageIndex =
                                                                  _model.currentTipPageIndex +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    HandyFindersAPIsGroup
                                                                        .yourPostCall
                                                                        .apiMessage(
                                                                      (_model.loadMoreTipResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 25.0),
                                                    child: Text(
                                                      'No More Data!',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Comfortaa',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .hintTextColor,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'No Tip/Advice Found!',
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
                    ],
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
