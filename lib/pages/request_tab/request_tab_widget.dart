import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/comments_bottom_sheet_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/leave_review_dialog_widget.dart';
import '/components/select_user_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import '/pages/edit_remove_menu_pop_up/edit_remove_menu_pop_up_widget.dart';
import '/pages/remove_menu_pop_up/remove_menu_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'request_tab_model.dart';
export 'request_tab_model.dart';

class RequestTabWidget extends StatefulWidget {
  const RequestTabWidget({super.key});

  static String routeName = 'RequestTab';
  static String routePath = '/requestTab';

  @override
  State<RequestTabWidget> createState() => _RequestTabWidgetState();
}

class _RequestTabWidgetState extends State<RequestTabWidget>
    with TickerProviderStateMixin {
  late RequestTabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestTabModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isRequestTabPrimaryApiLoaded) {
        return;
      }

      _model.isPrimaryApiFetching = true;
      _model.isPrimaryApiFetching = true;
      safeSetState(() {});
      _model.initialPrimaryApiResponse =
          await HandyFindersAPIsGroup.requestBottomTabCall.call(
        authToken: FFAppState().authToken,
        type: 'current',
        page: 1,
      );

      _model.getNotificationCountResponse =
          await HandyFindersAPIsGroup.getNotificationCountCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isPrimaryApiFetching = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.requestBottomTabCall.apiStatus(
        (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
      )!) {
        FFAppState().requestTabCurrentList =
            HandyFindersAPIsGroup.requestBottomTabCall
                .apiList(
                  (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
                )!
                .toList()
                .cast<dynamic>();
        FFAppState().isRequestTabPrimaryApiLoaded = true;
        FFAppState().requestTabPrimaryPageIndex = 2;
        FFAppState().requestTabPrimaryLastPage =
            HandyFindersAPIsGroup.requestBottomTabCall.apiLastPage(
          (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
        )!;
        FFAppState().notificationCount = valueOrDefault<int>(
          HandyFindersAPIsGroup.getNotificationCountCall.apiNotificationCount(
            (_model.getNotificationCountResponse?.jsonBody ?? ''),
          ),
          0,
        );
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.requestBottomTabCall.apiMessage(
                (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
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

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
                  title: 'Your Requests',
                  hideBackButton: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 16.0),
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
                                      'Current',
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
                                if (_model.isSecondaryApiLoaded) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                _model.isSecondaryApiFetching = true;
                                safeSetState(() {});
                                _model.initialSecondaryApiResponse =
                                    await HandyFindersAPIsGroup
                                        .requestBottomTabCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  type: 'completed',
                                  page: 1,
                                );

                                _shouldSetState = true;
                                _model.isSecondaryApiFetching = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.requestBottomTabCall
                                    .apiStatus(
                                  (_model.initialSecondaryApiResponse
                                          ?.jsonBody ??
                                      ''),
                                )!) {
                                  FFAppState().requestTabCompletedList =
                                      HandyFindersAPIsGroup.requestBottomTabCall
                                          .apiList(
                                            (_model.initialSecondaryApiResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  FFAppState().requestTabSecondaryLastPage =
                                      HandyFindersAPIsGroup.requestBottomTabCall
                                          .apiLastPage(
                                    (_model.initialSecondaryApiResponse
                                            ?.jsonBody ??
                                        ''),
                                  )!;
                                  _model.isSecondaryApiLoaded = true;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup
                                            .requestBottomTabCall
                                            .apiMessage(
                                          (_model.initialSecondaryApiResponse
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
                                      'Completed',
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
              Flexible(
                child: Container(
                  width: double.infinity,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Builder(
                        builder: (context) {
                          if (_model.isPrimaryApiFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState()
                                          .requestTabCurrentList
                                          .isNotEmpty) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00F1F4F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/icSearchBlue.png',
                                                          height: 25.0,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.77,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController1,
                                                        focusNode: _model
                                                            .textFieldFocusNode1,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText: 'Search...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      18.0,
                                                                      10.0,
                                                                      18.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textController1Validator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: RefreshIndicator(
                                                key: Key(
                                                    'RefreshIndicator_qpbni06u'),
                                                onRefresh: () async {
                                                  _model.refreshedPrimaryApiResponse =
                                                      await HandyFindersAPIsGroup
                                                          .requestBottomTabCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    type: 'current',
                                                    page: 1,
                                                  );

                                                  if (HandyFindersAPIsGroup
                                                      .requestBottomTabCall
                                                      .apiStatus(
                                                    (_model.refreshedPrimaryApiResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!) {
                                                    FFAppState()
                                                            .requestTabCurrentList =
                                                        HandyFindersAPIsGroup
                                                            .requestBottomTabCall
                                                            .apiList(
                                                              (_model.refreshedPrimaryApiResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    FFAppState()
                                                        .requestTabPrimaryPageIndex = 2;
                                                    safeSetState(() {});
                                                    return;
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          HandyFindersAPIsGroup
                                                              .requestBottomTabCall
                                                              .apiMessage(
                                                            (_model.refreshedPrimaryApiResponse
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
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final primaryTabList =
                                                              FFAppState()
                                                                  .requestTabCurrentList
                                                                  .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                    primaryTabList
                                                                        .length,
                                                                    (primaryTabListIndex) {
                                                              final primaryTabListItem =
                                                                  primaryTabList[
                                                                      primaryTabListIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD5E1E9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              11.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFE6F1F9),
                                                                              borderRadius: BorderRadius.circular(99.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(11.0, 6.0, 11.0, 6.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    primaryTabListItem,
                                                                                    r'''$.category_id''',
                                                                                  ).toString(),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Comfortaa',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.5,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                primaryTabListItem,
                                                                                r'''$.cost''',
                                                                              ) !=
                                                                              null)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 0.0, 0.0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: '\$ ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Comfortaa',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w800,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        primaryTabListItem,
                                                                                        r'''$.cost''',
                                                                                      ).toString(),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Comfortaa',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w800,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showAlignedDialog(
                                                                                      barrierColor: Color(0x00FFFFFF),
                                                                                      context: context,
                                                                                      isGlobal: false,
                                                                                      avoidOverflow: false,
                                                                                      targetAnchor: AlignmentDirectional(-1.9, 3.8).resolve(Directionality.of(context)),
                                                                                      followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      builder: (dialogContext) {
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
                                                                                                  if ((String type) {
                                                                                                    return type.toLowerCase() == "request";
                                                                                                  }(getJsonField(
                                                                                                    primaryTabListItem,
                                                                                                    r'''$.type''',
                                                                                                  ).toString())) {
                                                                                                    context.pushNamed(
                                                                                                      PostRequestForumWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'isUpdating': serializeParam(
                                                                                                          true,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'jsonData': serializeParam(
                                                                                                          primaryTabListItem,
                                                                                                          ParamType.JSON,
                                                                                                        ),
                                                                                                        'itemIndex': serializeParam(
                                                                                                          primaryTabListIndex,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                        'isUpdatingRequestBottomTab': serializeParam(
                                                                                                          true,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );

                                                                                                    return;
                                                                                                  } else {
                                                                                                    context.pushNamed(PostTipAdviceWidget.routeName);

                                                                                                    return;
                                                                                                  }
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
                                                                                                                var _shouldSetState = false;
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
                                                                                                                    primaryTabListItem,
                                                                                                                    r'''$.id''',
                                                                                                                  ).toString(),
                                                                                                                );

                                                                                                                _shouldSetState = true;
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
                                                                                                                  FFAppState().removeAtIndexFromRequestTabCurrentList(primaryTabListIndex);
                                                                                                                  safeSetState(() {});
                                                                                                                  return;
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

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFE8E8E8),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.more_vert,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            13.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            primaryTabListItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.primaryDateFormate(
                                                                              getJsonField(
                                                                                primaryTabListItem,
                                                                                r'''$.updated_at''',
                                                                              ).toString(),
                                                                              'MMMM dd, yyyy'),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            6.5,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            primaryTabListItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (getJsonField(
                                                                                primaryTabListItem,
                                                                                r'''$.images[0].image''',
                                                                              ) !=
                                                                              null
                                                                          ? true
                                                                          : false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 0),
                                                                              fadeOutDuration: Duration(milliseconds: 0),
                                                                              imageUrl: '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                                primaryTabListItem,
                                                                                r'''$.images[0].image''',
                                                                              ).toString()}',
                                                                              width: double.infinity,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fill,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (getJsonField(
                                                                                          primaryTabListItem,
                                                                                          r'''$.is_liked''',
                                                                                        ) ==
                                                                                        1) {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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
                                                                                              primaryTabListItem,
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
                                                                                              primaryTabListItem,
                                                                                              false,
                                                                                            );
                                                                                            _shouldSetState = true;
                                                                                            FFAppState().updateRequestTabCurrentListAtIndex(
                                                                                              primaryTabListIndex,
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

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.favorite_rounded,
                                                                                          color: Color(0xFFFF0000),
                                                                                          size: 25.0,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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
                                                                                              primaryTabListItem,
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
                                                                                              primaryTabListItem,
                                                                                              true,
                                                                                            );
                                                                                            _shouldSetState = true;
                                                                                            FFAppState().updateHomeTabPostListAtIndex(
                                                                                              primaryTabListIndex,
                                                                                              (_) => _model.returnedPrimaryJson!,
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

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.favorite_border_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      primaryTabListItem,
                                                                                      r'''$.total_liked''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Comfortaa',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: CommentsBottomSheetWidget(
                                                                                              id: getJsonField(
                                                                                                primaryTabListItem,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                              index: primaryTabListIndex,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/icMessage.png',
                                                                                        width: 25.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        primaryTabListItem,
                                                                                        r'''$.total_comment''',
                                                                                      ).toString(),
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
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await Share.share(
                                                                                    'Post Share',
                                                                                    sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/icShare.png',
                                                                                          width: 25.0,
                                                                                          height: 25.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if (false)
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            primaryTabListItem,
                                                                                            r'''$.total_share''',
                                                                                          ).toString(),
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              13.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
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
                                                                                        child: SelectUserDialogWidget(
                                                                                          requestId: getJsonField(
                                                                                            primaryTabListItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                          itemIndex: primaryTabListIndex,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 45.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF24272E),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'Mark as Complete',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Color(0xBEFFFFFF),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                                .divide(SizedBox(
                                                                    height:
                                                                        16.0))
                                                                .addToEnd(SizedBox(
                                                                    height: FFAppState().requestTabPrimaryLastPage >
                                                                            1
                                                                        ? 0.0
                                                                        : 20.0)),
                                                          );
                                                        },
                                                      ),
                                                      if (FFAppState()
                                                              .requestTabPrimaryLastPage >
                                                          1)
                                                        Builder(
                                                          builder: (context) {
                                                            if (FFAppState()
                                                                    .requestTabPrimaryPageIndex <=
                                                                FFAppState()
                                                                    .requestTabPrimaryLastPage) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .baseButtonComponentModel1,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      BaseButtonComponentWidget(
                                                                    title:
                                                                        'Load More',
                                                                    buttonColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF6E6E6E),
                                                                    isLoading:
                                                                        _model
                                                                            .isPrimaryLoadingMore,
                                                                    removeScaffoldPadding:
                                                                        true,
                                                                    passOnTapCallback:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (FFAppState()
                                                                              .requestTabPrimaryPageIndex <=
                                                                          FFAppState()
                                                                              .requestTabPrimaryLastPage) {
                                                                        _model.isPrimaryLoadingMore =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.primaryLoadMoreResponse = await HandyFindersAPIsGroup
                                                                            .requestBottomTabCall
                                                                            .call(
                                                                          authToken:
                                                                              FFAppState().authToken,
                                                                          type:
                                                                              'current',
                                                                          page:
                                                                              FFAppState().requestTabPrimaryPageIndex,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        if (HandyFindersAPIsGroup
                                                                            .requestBottomTabCall
                                                                            .apiStatus(
                                                                          (_model.primaryLoadMoreResponse?.jsonBody ??
                                                                              ''),
                                                                        )!) {
                                                                          _model.returnedPrimaryList =
                                                                              await actions.addJsonList(
                                                                            FFAppState().requestTabCurrentList.toList(),
                                                                            HandyFindersAPIsGroup.requestBottomTabCall
                                                                                .apiList(
                                                                                  (_model.primaryLoadMoreResponse?.jsonBody ?? ''),
                                                                                )!
                                                                                .toList(),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.isPrimaryLoadingMore =
                                                                              false;
                                                                          FFAppState().requestTabCurrentList = _model
                                                                              .returnedPrimaryList!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          FFAppState().requestTabPrimaryPageIndex =
                                                                              FFAppState().requestTabPrimaryPageIndex + 1;
                                                                          safeSetState(
                                                                              () {});
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
                                                                                HandyFindersAPIsGroup.requestBottomTabCall.apiMessage(
                                                                                  (_model.primaryLoadMoreResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                      } else {
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        0.0,
                                                                        25.0),
                                                                child: Text(
                                                                  'No More Data!',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Comfortaa',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .hintTextColor,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'No Request Found!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .hintTextColor,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.isSecondaryApiFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState()
                                          .requestTabCompletedList
                                          .isNotEmpty) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00F1F4F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/icSearchBlue.png',
                                                          height: 25.0,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.77,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController2,
                                                        focusNode: _model
                                                            .textFieldFocusNode2,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText: 'Search...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      18.0,
                                                                      10.0,
                                                                      18.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textController2Validator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: RefreshIndicator(
                                                key: Key(
                                                    'RefreshIndicator_szrcjkuo'),
                                                onRefresh: () async {
                                                  _model.refreshedSecondaryApiResponse =
                                                      await HandyFindersAPIsGroup
                                                          .requestBottomTabCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    type: 'completed',
                                                    page: 1,
                                                  );

                                                  if (HandyFindersAPIsGroup
                                                      .requestBottomTabCall
                                                      .apiStatus(
                                                    (_model.refreshedSecondaryApiResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!) {
                                                    FFAppState()
                                                            .requestTabCompletedList =
                                                        HandyFindersAPIsGroup
                                                            .requestBottomTabCall
                                                            .apiList(
                                                              (_model.refreshedSecondaryApiResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    FFAppState()
                                                        .requestTabSecondaryPageIndex = 2;
                                                    safeSetState(() {});
                                                    return;
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          HandyFindersAPIsGroup
                                                              .requestBottomTabCall
                                                              .apiMessage(
                                                            (_model.refreshedSecondaryApiResponse
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
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final secondaryTabList =
                                                              FFAppState()
                                                                  .requestTabCompletedList
                                                                  .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                    secondaryTabList
                                                                        .length,
                                                                    (secondaryTabListIndex) {
                                                              final secondaryTabListItem =
                                                                  secondaryTabList[
                                                                      secondaryTabListIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD5E1E9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              11.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
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
                                                                            context.pushNamed(
                                                                              OtherUserProfileWidget.routeName,
                                                                              queryParameters: {
                                                                                'userId': serializeParam(
                                                                                  getJsonField(
                                                                                    secondaryTabListItem,
                                                                                    r'''$.user_detail.id''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                                child: CachedNetworkImage(
                                                                                  fadeInDuration: Duration(milliseconds: 0),
                                                                                  fadeOutDuration: Duration(milliseconds: 0),
                                                                                  imageUrl: '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                                    secondaryTabListItem,
                                                                                    r'''$.complete_user_detail.profile_picture''',
                                                                                  ).toString()}',
                                                                                  width: 42.0,
                                                                                  height: 42.0,
                                                                                  fit: BoxFit.cover,
                                                                                  errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: 42.0,
                                                                                    height: 42.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      secondaryTabListItem,
                                                                                      r'''$.complete_user_detail.user_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFE6F1F9),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(11.0, 6.0, 11.0, 6.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      secondaryTabListItem,
                                                                                      r'''$.category_id''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Comfortaa',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 12.5,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (getJsonField(
                                                                                  secondaryTabListItem,
                                                                                  r'''$.cost''',
                                                                                ) !=
                                                                                null)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 0.0, 0.0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: '\$ ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Comfortaa',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w800,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: getJsonField(
                                                                                          secondaryTabListItem,
                                                                                          r'''$.cost''',
                                                                                        ).toString(),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Comfortaa',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w800,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showAlignedDialog(
                                                                                        barrierColor: Color(0x00FFFFFF),
                                                                                        context: context,
                                                                                        isGlobal: false,
                                                                                        avoidOverflow: false,
                                                                                        targetAnchor: AlignmentDirectional(-1.9, 2.8).resolve(Directionality.of(context)),
                                                                                        followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        builder: (dialogContext) {
                                                                                          return Material(
                                                                                            color: Colors.transparent,
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: RemoveMenuPopUpWidget(
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
                                                                                                                      secondaryTabListItem,
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
                                                                                                                    FFAppState().removeAtIndexFromRequestTabCompletedList(secondaryTabListIndex);
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

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 35.0,
                                                                                      height: 35.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFE8E8E8),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Icon(
                                                                                        Icons.more_vert,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            13.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            secondaryTabListItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.primaryDateFormate(
                                                                              getJsonField(
                                                                                secondaryTabListItem,
                                                                                r'''$.updated_at''',
                                                                              ).toString(),
                                                                              'MMMM dd, yyyy'),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            6.5,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            secondaryTabListItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (getJsonField(
                                                                                secondaryTabListItem,
                                                                                r'''$.images[0].image''',
                                                                              ) !=
                                                                              null
                                                                          ? true
                                                                          : false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 0),
                                                                              fadeOutDuration: Duration(milliseconds: 0),
                                                                              imageUrl: '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                                secondaryTabListItem,
                                                                                r'''$.images[0].image''',
                                                                              ).toString()}',
                                                                              width: double.infinity,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fill,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (getJsonField(
                                                                                          secondaryTabListItem,
                                                                                          r'''$.is_liked''',
                                                                                        ) ==
                                                                                        1) {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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
                                                                                              secondaryTabListItem,
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
                                                                                              secondaryTabListItem,
                                                                                              false,
                                                                                            );
                                                                                            _shouldSetState = true;
                                                                                            FFAppState().updateRequestTabCompletedListAtIndex(
                                                                                              secondaryTabListIndex,
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

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.favorite_rounded,
                                                                                          color: Color(0xFFFF0000),
                                                                                          size: 25.0,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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
                                                                                              secondaryTabListItem,
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
                                                                                              secondaryTabListItem,
                                                                                              true,
                                                                                            );
                                                                                            _shouldSetState = true;
                                                                                            FFAppState().updateHomeTabPostListAtIndex(
                                                                                              secondaryTabListIndex,
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

                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.favorite_border_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      secondaryTabListItem,
                                                                                      r'''$.total_liked''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Comfortaa',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: CommentsBottomSheetWidget(
                                                                                              id: getJsonField(
                                                                                                secondaryTabListItem,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                              index: secondaryTabListIndex,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/icMessage.png',
                                                                                        width: 25.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        secondaryTabListItem,
                                                                                        r'''$.total_comment''',
                                                                                      ).toString(),
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
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await Share.share(
                                                                                    'Post Share',
                                                                                    sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/icShare.png',
                                                                                          width: 25.0,
                                                                                          height: 25.0,
                                                                                          fit: BoxFit.cover,
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
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
                                                                                        child: LeaveReviewDialogWidget(
                                                                                          otherUserId: getJsonField(
                                                                                            secondaryTabListItem,
                                                                                            r'''$.complete_user_detail.id''',
                                                                                          ),
                                                                                          requestId: getJsonField(
                                                                                            secondaryTabListItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                          profilePhotoUrl: getJsonField(
                                                                                            secondaryTabListItem,
                                                                                            r'''$.complete_user_detail.profile_picture''',
                                                                                          ).toString(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 45.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF24272E),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'Leave a Review',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Color(0xBEFFFFFF),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                                .divide(SizedBox(
                                                                    height:
                                                                        16.0))
                                                                .addToEnd(SizedBox(
                                                                    height: FFAppState().requestTabSecondaryLastPage !=
                                                                            null
                                                                        ? 0.0
                                                                        : 20.0)),
                                                          );
                                                        },
                                                      ),
                                                      if (FFAppState()
                                                              .requestTabSecondaryLastPage >
                                                          1)
                                                        Builder(
                                                          builder: (context) {
                                                            if (FFAppState()
                                                                    .requestTabSecondaryPageIndex <=
                                                                HandyFindersAPIsGroup
                                                                    .requestBottomTabCall
                                                                    .apiLastPage(
                                                                  (_model.initialSecondaryApiResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .baseButtonComponentModel2,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      BaseButtonComponentWidget(
                                                                    title:
                                                                        'Load More',
                                                                    buttonColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    textColor:
                                                                        Color(
                                                                            0xFF6E6E6E),
                                                                    isLoading:
                                                                        _model
                                                                            .isSecondaryLoadingMore,
                                                                    removeScaffoldPadding:
                                                                        true,
                                                                    passOnTapCallback:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (FFAppState()
                                                                              .requestTabSecondaryPageIndex <=
                                                                          HandyFindersAPIsGroup
                                                                              .requestBottomTabCall
                                                                              .apiLastPage(
                                                                            (_model.initialSecondaryApiResponse?.jsonBody ??
                                                                                ''),
                                                                          )!) {
                                                                        _model.isSecondaryLoadingMore =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.loadMoreSecondaryResponse = await HandyFindersAPIsGroup
                                                                            .requestBottomTabCall
                                                                            .call(
                                                                          authToken:
                                                                              FFAppState().authToken,
                                                                          type:
                                                                              'completed',
                                                                          page:
                                                                              FFAppState().requestTabSecondaryPageIndex,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        if (HandyFindersAPIsGroup
                                                                            .requestBottomTabCall
                                                                            .apiStatus(
                                                                          (_model.loadMoreSecondaryResponse?.jsonBody ??
                                                                              ''),
                                                                        )!) {
                                                                          _model.returnedSecondaryList =
                                                                              await actions.addJsonList(
                                                                            FFAppState().requestTabCompletedList.toList(),
                                                                            HandyFindersAPIsGroup.requestBottomTabCall
                                                                                .apiList(
                                                                                  (_model.loadMoreSecondaryResponse?.jsonBody ?? ''),
                                                                                )!
                                                                                .toList(),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.isSecondaryLoadingMore =
                                                                              false;
                                                                          FFAppState().requestTabCompletedList = _model
                                                                              .returnedSecondaryList!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          FFAppState().requestTabSecondaryPageIndex =
                                                                              FFAppState().requestTabSecondaryPageIndex + 1;
                                                                          safeSetState(
                                                                              () {});
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
                                                                                HandyFindersAPIsGroup.requestBottomTabCall.apiMessage(
                                                                                  (_model.loadMoreSecondaryResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                      } else {
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        0.0,
                                                                        25.0),
                                                                child: Text(
                                                                  'No More Data!',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Comfortaa',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .hintTextColor,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'No Completed Request Found!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .hintTextColor,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
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
