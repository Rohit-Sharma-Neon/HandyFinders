import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'for_sale_tab_model.dart';
export 'for_sale_tab_model.dart';

class ForSaleTabWidget extends StatefulWidget {
  const ForSaleTabWidget({super.key});

  static String routeName = 'ForSaleTab';
  static String routePath = '/forSaleTab';

  @override
  State<ForSaleTabWidget> createState() => _ForSaleTabWidgetState();
}

class _ForSaleTabWidgetState extends State<ForSaleTabWidget>
    with TickerProviderStateMixin {
  late ForSaleTabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForSaleTabModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isForSalePrimaryApiLoaded) {
        return;
      }

      _model.isPrimaryApiFetching = true;
      safeSetState(() {});
      _model.initialPrimaryApiResponse =
          await HandyFindersAPIsGroup.forSaleListCall.call(
        authToken: FFAppState().authToken,
      );

      _model.getNotificationCountResponse =
          await HandyFindersAPIsGroup.getNotificationCountCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isPrimaryApiFetching = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.forSaleListCall.apiStatus(
        (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
      )!) {
        FFAppState().forSaleData = getJsonField(
          (_model.initialPrimaryApiResponse?.jsonBody ?? ''),
          r'''$.data1''',
        );
        FFAppState().isForSalePrimaryApiLoaded = true;
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
              HandyFindersAPIsGroup.forSaleListCall.apiMessage(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(AddUpdateListingWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/icAdd.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: wrapWithModel(
                model: _model.icBackTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: IcBackTitleWidget(
                  title: 'For Sale',
                  hideBackButton: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    FFAppConstants.scaffoldHorizontalPadding,
                    0.0,
                  ),
                  8.0,
                  valueOrDefault<double>(
                    FFAppConstants.scaffoldHorizontalPadding,
                    0.0,
                  ),
                  0.0),
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
                            _model.selectedTabIndex = 0;
                            safeSetState(() {});
                            await _model.pageViewController?.animateToPage(
                              _model.selectedTabIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
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
                                  blurRadius:
                                      _model.selectedTabIndex == 0 ? 4.0 : 0.0,
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
                                    'For Sale',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
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
                              if (FFAppState().isForSaleSecondaryApiLoaded) {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              _model.isSecondaryApiFetching = true;
                              safeSetState(() {});
                              _model.initialSecondaryApiResponse =
                                  await HandyFindersAPIsGroup.forFreeListCall
                                      .call(
                                authToken: FFAppState().authToken,
                              );

                              _shouldSetState = true;
                              _model.isSecondaryApiFetching = false;
                              safeSetState(() {});
                              if (HandyFindersAPIsGroup.forFreeListCall
                                  .apiStatus(
                                (_model.initialSecondaryApiResponse?.jsonBody ??
                                    ''),
                              )!) {
                                FFAppState().forFreeData = getJsonField(
                                  (_model.initialSecondaryApiResponse
                                          ?.jsonBody ??
                                      ''),
                                  r'''$.data1''',
                                );
                                FFAppState().isForSaleSecondaryApiLoaded = true;
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      HandyFindersAPIsGroup.forFreeListCall
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
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
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
                                  blurRadius:
                                      _model.selectedTabIndex == 1 ? 4.0 : 0.0,
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
                                    'For Free',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.baseLoaderComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(),
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          FFAppConstants
                                              .scaffoldHorizontalPadding,
                                          0.0,
                                        ),
                                        10.0,
                                        valueOrDefault<double>(
                                          FFAppConstants
                                              .scaffoldHorizontalPadding,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'What are you looking...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 18.0,
                                                              10.0, 18.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          FilterBottomSheetWidget(
                                                        searchedText: _model
                                                            .textController1
                                                            .text,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/ic_filter.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState()
                                      .ForSaleAppStateVariables
                                      .selectedCategories
                                      .isNotEmpty)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants
                                                .scaffoldHorizontalPadding,
                                            0.0,
                                          ),
                                          15.0,
                                          0.0,
                                          0.0),
                                      child: Text(
                                        'Filtered Categories',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 11.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final appStateCategories = FFAppState()
                                            .ForSaleAppStateVariables
                                            .selectedCategories
                                            .toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                    appStateCategories.length,
                                                    (appStateCategoriesIndex) {
                                              final appStateCategoriesItem =
                                                  appStateCategories[
                                                      appStateCategoriesIndex];
                                              return Stack(
                                                alignment: AlignmentDirectional(
                                                    1.2, -2.5),
                                                children: [
                                                  Container(
                                                    height: 27.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEFFAFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFAEDFFF),
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        appStateCategoriesItem,
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
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 20.0,
                                                    height: 20.14,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5.3),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/icCross.png',
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            })
                                                .divide(SizedBox(width: 13.0))
                                                .addToStart(SizedBox(
                                                    width: FFAppConstants
                                                        .scaffoldHorizontalPadding))
                                                .addToEnd(SizedBox(
                                                    width: FFAppConstants
                                                        .scaffoldHorizontalPadding)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: RefreshIndicator(
                                    key: Key('RefreshIndicator_w2ru23yj'),
                                    onRefresh: () async {
                                      _model.refreshedPrimaryApiResponse =
                                          await HandyFindersAPIsGroup
                                              .forSaleListCall
                                              .call(
                                        authToken: FFAppState().authToken,
                                      );

                                      if (HandyFindersAPIsGroup.forSaleListCall
                                          .apiStatus(
                                        (_model.refreshedPrimaryApiResponse
                                                ?.jsonBody ??
                                            ''),
                                      )!) {
                                        FFAppState().forSaleData = getJsonField(
                                          (_model.refreshedPrimaryApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data1''',
                                        );
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '',
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
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    10.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Newest Items',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      NewestItemsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'type': serializeParam(
                                                          'sale',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  3.0,
                                                                  5.0,
                                                                  3.0),
                                                      child: Text(
                                                        'View All',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    FFAppState().forSaleData,
                                                    r'''$.item_list''',
                                                  ) !=
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final newestItemList =
                                                          getJsonField(
                                                        FFAppState()
                                                            .forSaleData,
                                                        r'''$.item_list''',
                                                      )
                                                              .toList()
                                                              .take(5)
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  newestItemList
                                                                      .length,
                                                                  (newestItemListIndex) {
                                                            final newestItemListItem =
                                                                newestItemList[
                                                                    newestItemListIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ItemOrServiceDetailWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'listingType':
                                                                        serializeParam(
                                                                      'Item',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        newestItemListItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDFDFDF),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 0),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 0),
                                                                            imageUrl:
                                                                                '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.item_images[0].image''',
                                                                            ).toString()}',
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.6,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: MediaQuery.sizeOf(context).width * 0.6,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.category_id''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF8798AD),
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              7.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (getJsonField(
                                                                                  newestItemListItem,
                                                                                  r'''$.is_free''',
                                                                                ) ==
                                                                                1) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 8.0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: ' Free',
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 8.0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: '\$',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              decoration: TextDecoration.lineThrough,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: getJsonField(
                                                                                          newestItemListItem,
                                                                                          r'''$.price''',
                                                                                        ).toString(),
                                                                                        style: TextStyle(
                                                                                          decoration: TextDecoration.lineThrough,
                                                                                        ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' \$',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: getJsonField(
                                                                                          newestItemListItem,
                                                                                          r'''$.sale_price''',
                                                                                        ).toString(),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
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
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              10.0,
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
                                                                              await Share.share(
                                                                                'Post Sharing',
                                                                                sharePositionOrigin: getWidgetBoundingBox(context),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x3614181B),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(6.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/icShareWhite.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                            var _shouldSetState =
                                                                                false;
                                                                            unawaited(
                                                                              () async {
                                                                                await actions.showBaseLoader(
                                                                                  context,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            _model.bookmarkResponse =
                                                                                await HandyFindersAPIsGroup.bookmarkItemCall.call(
                                                                              authToken: FFAppState().authToken,
                                                                              itemId: getJsonField(
                                                                                newestItemListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              statusKey: functions.getUpdatedBookmarkFunction(newestItemListIndex, FFAppState().forSaleData, 'item').toString() == '1' ? 0 : 1,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            context.safePop();
                                                                            if (HandyFindersAPIsGroup.bookmarkItemCall.apiStatus(
                                                                              (_model.bookmarkResponse?.jsonBody ?? ''),
                                                                            )!) {
                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.bookmarkResponse?.jsonBody ?? ''),
                                                                                    )!,
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                              _model.returnedBookmarkResponse = await actions.updateItemBookmarkStatusKeyValue(
                                                                                FFAppState().forSaleData,
                                                                                newestItemListIndex,
                                                                                'item',
                                                                              );
                                                                              _shouldSetState = true;
                                                                              FFAppState().forSaleData = _model.returnedBookmarkResponse!;
                                                                              safeSetState(() {});
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.bookmarkResponse?.jsonBody ?? ''),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3614181B),
                                                                              borderRadius: BorderRadius.circular(99.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (functions.getUpdatedBookmarkFunction(newestItemListIndex, FFAppState().forSaleData, 'item').toString() == '1') {
                                                                                  return Icon(
                                                                                    Icons.bookmark,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                } else {
                                                                                  return Icon(
                                                                                    Icons.bookmark_border,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 18.0))
                                                              .addToStart(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding))
                                                              .addToEnd(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .scaffoldHorizontalPadding,
                                                                  0.0,
                                                                ),
                                                                8.0,
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'No Item Found!',
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    21.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Services',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      ServiceList2Widget
                                                          .routeName,
                                                      queryParameters: {
                                                        'type': serializeParam(
                                                          'sale',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  3.0,
                                                                  5.0,
                                                                  3.0),
                                                      child: Text(
                                                        'View All',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    FFAppState().forSaleData,
                                                    r'''$.service_list''',
                                                  ) !=
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 20.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final servicesList =
                                                          getJsonField(
                                                        FFAppState()
                                                            .forSaleData,
                                                        r'''$.service_list''',
                                                      )
                                                              .toList()
                                                              .take(5)
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  servicesList
                                                                      .length,
                                                                  (servicesListIndex) {
                                                            final servicesListItem =
                                                                servicesList[
                                                                    servicesListIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ItemOrServiceDetailWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'listingType':
                                                                        serializeParam(
                                                                      'Service',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        servicesListItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDFDFDF),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.item_images[0].image''',
                                                                            ).toString()}',
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.6,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: MediaQuery.sizeOf(context).width * 0.6,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fitWidth,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.category_id''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF8798AD),
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              7.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: '\$',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        decoration: TextDecoration.lineThrough,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: getJsonField(
                                                                                    servicesListItem,
                                                                                    r'''$.price''',
                                                                                  ).toString(),
                                                                                  style: TextStyle(
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: ' \$',
                                                                                  style: TextStyle(),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: getJsonField(
                                                                                    servicesListItem,
                                                                                    r'''$.sale_price''',
                                                                                  ).toString(),
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              10.0,
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
                                                                              await Share.share(
                                                                                'Post Sharing',
                                                                                sharePositionOrigin: getWidgetBoundingBox(context),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x3614181B),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(6.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/icShareWhite.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                            var _shouldSetState =
                                                                                false;
                                                                            unawaited(
                                                                              () async {
                                                                                await actions.showBaseLoader(
                                                                                  context,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            _model.serviceBookmarkResponse =
                                                                                await HandyFindersAPIsGroup.bookmarkItemCall.call(
                                                                              authToken: FFAppState().authToken,
                                                                              itemId: getJsonField(
                                                                                servicesListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              statusKey: getJsonField(
                                                                                        servicesListItem,
                                                                                        r'''$.is_bookmarked''',
                                                                                      ) ==
                                                                                      1
                                                                                  ? 0
                                                                                  : 1,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            context.safePop();
                                                                            if (HandyFindersAPIsGroup.bookmarkItemCall.apiStatus(
                                                                              (_model.serviceBookmarkResponse?.jsonBody ?? ''),
                                                                            )!) {
                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.serviceBookmarkResponse?.jsonBody ?? ''),
                                                                                    )!,
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                              _model.returnedBookmarkResponseCopy = await actions.updateItemBookmarkStatusKeyValue(
                                                                                FFAppState().forSaleData,
                                                                                servicesListIndex,
                                                                                'service',
                                                                              );
                                                                              _shouldSetState = true;
                                                                              FFAppState().forSaleData = _model.returnedBookmarkResponseCopy!;
                                                                              safeSetState(() {});
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.serviceBookmarkResponse?.jsonBody ?? ''),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3614181B),
                                                                              borderRadius: BorderRadius.circular(99.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (getJsonField(
                                                                                      servicesListItem,
                                                                                      r'''$.is_bookmarked''',
                                                                                    ) ==
                                                                                    1) {
                                                                                  return Icon(
                                                                                    Icons.bookmark,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                } else {
                                                                                  return Icon(
                                                                                    Icons.bookmark_border,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 18.0))
                                                              .addToStart(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding))
                                                              .addToEnd(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .scaffoldHorizontalPadding,
                                                                  0.0,
                                                                ),
                                                                8.0,
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'No Service Found!',
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ].addToEnd(SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  ),
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.baseLoaderComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(),
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          FFAppConstants
                                              .scaffoldHorizontalPadding,
                                          0.0,
                                        ),
                                        10.0,
                                        valueOrDefault<double>(
                                          FFAppConstants
                                              .scaffoldHorizontalPadding,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'What are you looking...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 18.0,
                                                              10.0, 18.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          FilterBottomSheetWidget(
                                                        searchedText: _model
                                                            .textController2
                                                            .text,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/ic_filter.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState()
                                      .ForSaleAppStateVariables
                                      .selectedCategories
                                      .isNotEmpty)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants
                                                .scaffoldHorizontalPadding,
                                            0.0,
                                          ),
                                          15.0,
                                          0.0,
                                          0.0),
                                      child: Text(
                                        'Filtered Categories',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 11.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final appStateCategories = FFAppState()
                                            .ForSaleAppStateVariables
                                            .selectedCategories
                                            .toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                    appStateCategories.length,
                                                    (appStateCategoriesIndex) {
                                              final appStateCategoriesItem =
                                                  appStateCategories[
                                                      appStateCategoriesIndex];
                                              return Stack(
                                                alignment: AlignmentDirectional(
                                                    1.2, -2.5),
                                                children: [
                                                  Container(
                                                    height: 27.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEFFAFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFAEDFFF),
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        appStateCategoriesItem,
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
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 20.0,
                                                    height: 20.14,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5.3),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/icCross.png',
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            })
                                                .divide(SizedBox(width: 13.0))
                                                .addToStart(SizedBox(
                                                    width: FFAppConstants
                                                        .scaffoldHorizontalPadding))
                                                .addToEnd(SizedBox(
                                                    width: FFAppConstants
                                                        .scaffoldHorizontalPadding)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: RefreshIndicator(
                                    key: Key('RefreshIndicator_nm2wz268'),
                                    onRefresh: () async {
                                      _model.refreshedSecondaryApiResponse =
                                          await HandyFindersAPIsGroup
                                              .forFreeListCall
                                              .call(
                                        authToken: FFAppState().authToken,
                                      );

                                      if (HandyFindersAPIsGroup.forFreeListCall
                                          .apiStatus(
                                        (_model.refreshedSecondaryApiResponse
                                                ?.jsonBody ??
                                            ''),
                                      )!) {
                                        FFAppState().forFreeData = getJsonField(
                                          (_model.refreshedSecondaryApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data1''',
                                        );
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              HandyFindersAPIsGroup
                                                  .forFreeListCall
                                                  .apiMessage(
                                                (_model.refreshedSecondaryApiResponse
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
                                                Duration(milliseconds: 4000),
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    10.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Newest Items',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      NewestItemsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'type': serializeParam(
                                                          'free',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  3.0,
                                                                  5.0,
                                                                  3.0),
                                                      child: Text(
                                                        'View All',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    FFAppState().forSaleData,
                                                    r'''$.item_list''',
                                                  ) !=
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final newestItemList =
                                                          getJsonField(
                                                        FFAppState()
                                                            .forFreeData,
                                                        r'''$.item_list''',
                                                      )
                                                              .toList()
                                                              .take(5)
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  newestItemList
                                                                      .length,
                                                                  (newestItemListIndex) {
                                                            final newestItemListItem =
                                                                newestItemList[
                                                                    newestItemListIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ItemOrServiceDetailWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'listingType':
                                                                        serializeParam(
                                                                      'Item',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        newestItemListItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDFDFDF),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.item_images[0].image''',
                                                                            ).toString()}',
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.6,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: MediaQuery.sizeOf(context).width * 0.6,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.category_id''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF8798AD),
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              7.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              newestItemListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: 'Free',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              10.0,
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
                                                                              await Share.share(
                                                                                'Post Sharing',
                                                                                sharePositionOrigin: getWidgetBoundingBox(context),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x3614181B),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(6.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/icShareWhite.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (getJsonField(
                                                                                  newestItemListItem,
                                                                                  r'''$.is_bookmarked''',
                                                                                ) ==
                                                                                1) {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            unawaited(
                                                                              () async {
                                                                                await actions.showBaseLoader(
                                                                                  context,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            _model.freeItemBookmarkResponse =
                                                                                await HandyFindersAPIsGroup.bookmarkItemCall.call(
                                                                              authToken: FFAppState().authToken,
                                                                              itemId: getJsonField(
                                                                                newestItemListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            context.safePop();
                                                                            if (HandyFindersAPIsGroup.bookmarkItemCall.apiStatus(
                                                                              (_model.freeItemBookmarkResponse?.jsonBody ?? ''),
                                                                            )!) {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.freeItemBookmarkResponse?.jsonBody ?? ''),
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
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.freeItemBookmarkResponse?.jsonBody ?? ''),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3614181B),
                                                                              borderRadius: BorderRadius.circular(99.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (getJsonField(
                                                                                      newestItemListItem,
                                                                                      r'''$.is_bookmarked''',
                                                                                    ) ==
                                                                                    1) {
                                                                                  return Icon(
                                                                                    Icons.bookmark,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                } else {
                                                                                  return Icon(
                                                                                    Icons.bookmark_border,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 18.0))
                                                              .addToStart(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding))
                                                              .addToEnd(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .scaffoldHorizontalPadding,
                                                                  0.0,
                                                                ),
                                                                8.0,
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'No Item Found!',
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    21.0,
                                                    valueOrDefault<double>(
                                                      FFAppConstants
                                                          .scaffoldHorizontalPadding,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Services',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      ServiceList2Widget
                                                          .routeName,
                                                      queryParameters: {
                                                        'type': serializeParam(
                                                          'free',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  3.0,
                                                                  5.0,
                                                                  3.0),
                                                      child: Text(
                                                        'View All',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    FFAppState().forSaleData,
                                                    r'''$.service_list''',
                                                  ) !=
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 20.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final servicesList =
                                                          getJsonField(
                                                        FFAppState()
                                                            .forFreeData,
                                                        r'''$.service_list''',
                                                      )
                                                              .toList()
                                                              .take(5)
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  servicesList
                                                                      .length,
                                                                  (servicesListIndex) {
                                                            final servicesListItem =
                                                                servicesList[
                                                                    servicesListIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ItemOrServiceDetailWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'listingType':
                                                                        serializeParam(
                                                                      'Service',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        servicesListItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDFDFDF),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.item_images[0].image''',
                                                                            ).toString()}',
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.6,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: MediaQuery.sizeOf(context).width * 0.6,
                                                                              height: 150.0,
                                                                              fit: BoxFit.fitWidth,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.category_id''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF8798AD),
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              7.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              servicesListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              5.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: 'Free',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              10.0,
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
                                                                              await Share.share(
                                                                                'Post Sharing',
                                                                                sharePositionOrigin: getWidgetBoundingBox(context),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x3614181B),
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(6.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/icShareWhite.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (getJsonField(
                                                                                  servicesListItem,
                                                                                  r'''$.is_bookmarked''',
                                                                                ) ==
                                                                                1) {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            unawaited(
                                                                              () async {
                                                                                await actions.showBaseLoader(
                                                                                  context,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            _model.freeServiceBookmarkResponse =
                                                                                await HandyFindersAPIsGroup.bookmarkItemCall.call(
                                                                              authToken: FFAppState().authToken,
                                                                              itemId: getJsonField(
                                                                                servicesListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            context.safePop();
                                                                            if (HandyFindersAPIsGroup.bookmarkItemCall.apiStatus(
                                                                              (_model.freeServiceBookmarkResponse?.jsonBody ?? ''),
                                                                            )!) {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.freeServiceBookmarkResponse?.jsonBody ?? ''),
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
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    HandyFindersAPIsGroup.bookmarkItemCall.apiMessage(
                                                                                      (_model.freeServiceBookmarkResponse?.jsonBody ?? ''),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3614181B),
                                                                              borderRadius: BorderRadius.circular(99.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (getJsonField(
                                                                                      servicesListItem,
                                                                                      r'''$.is_bookmarked''',
                                                                                    ) ==
                                                                                    1) {
                                                                                  return Icon(
                                                                                    Icons.bookmark,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                } else {
                                                                                  return Icon(
                                                                                    Icons.bookmark_border,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 18.0))
                                                              .addToStart(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding))
                                                              .addToEnd(SizedBox(
                                                                  width: FFAppConstants
                                                                      .scaffoldHorizontalPadding)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .scaffoldHorizontalPadding,
                                                                  0.0,
                                                                ),
                                                                8.0,
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'No Service Found!',
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
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ].addToEnd(SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  ),
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
    );
  }
}
