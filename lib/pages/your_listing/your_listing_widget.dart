import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import '/pages/edit_remove_menu_pop_up/edit_remove_menu_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'your_listing_model.dart';
export 'your_listing_model.dart';

class YourListingWidget extends StatefulWidget {
  const YourListingWidget({
    super.key,
    bool? hideBackButton,
  }) : this.hideBackButton = hideBackButton ?? false;

  final bool hideBackButton;

  static String routeName = 'YourListing';
  static String routePath = '/yourListing';

  @override
  State<YourListingWidget> createState() => _YourListingWidgetState();
}

class _YourListingWidgetState extends State<YourListingWidget>
    with TickerProviderStateMixin {
  late YourListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourListingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isInitialItemsFetching = true;
      safeSetState(() {});
      _model.initialItemListingResponse =
          await HandyFindersAPIsGroup.userListingCall.call(
        authToken: FFAppState().authToken,
        type: 'item',
        page: 1,
      );

      _model.isInitialItemsFetching = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.userListingCall.apiStatus(
        (_model.initialItemListingResponse?.jsonBody ?? ''),
      )!) {
        FFAppState().yourListingItems = HandyFindersAPIsGroup.userListingCall
            .apiList(
              (_model.initialItemListingResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.userListingCall.apiMessage(
                (_model.initialItemListingResponse?.jsonBody ?? ''),
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
                  title: 'Your Listing',
                  hideBackButton: widget.hideBackButton,
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
                                      'Items',
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
                                if (_model.isInitialServiceLoaded) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                _model.isInitialServicesFetching = true;
                                safeSetState(() {});
                                _model.initialServiceApiResponse =
                                    await HandyFindersAPIsGroup.userListingCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  type: 'service',
                                  page: 1,
                                );

                                _shouldSetState = true;
                                _model.isInitialServicesFetching = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.userListingCall
                                    .apiStatus(
                                  (_model.initialServiceApiResponse?.jsonBody ??
                                      ''),
                                )!) {
                                  FFAppState().yourListingServices =
                                      HandyFindersAPIsGroup.userListingCall
                                          .apiList(
                                            (_model.initialServiceApiResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});
                                  _model.isInitialServiceLoaded = true;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.userListingCall
                                            .apiMessage(
                                          (_model.initialServiceApiResponse
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
                                      'Services',
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
                          if (_model.isInitialItemsFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else if (HandyFindersAPIsGroup.userListingCall
                                      .apiList(
                                    (_model.initialItemListingResponse
                                            ?.jsonBody ??
                                        ''),
                                  ) !=
                                  null &&
                              (HandyFindersAPIsGroup.userListingCall.apiList(
                                (_model.initialItemListingResponse?.jsonBody ??
                                    ''),
                              ))!
                                  .isNotEmpty) {
                            return RefreshIndicator(
                              key: Key('RefreshIndicator_lugbu282'),
                              onRefresh: () async {
                                _model.isInitialItemsFetching = true;
                                safeSetState(() {});
                                _model.refreshItemListingResponse =
                                    await HandyFindersAPIsGroup.userListingCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  type: 'item',
                                  page: 1,
                                );

                                _model.isInitialItemsFetching = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.userListingCall
                                    .apiStatus(
                                  (_model.refreshItemListingResponse
                                          ?.jsonBody ??
                                      ''),
                                )!) {
                                  FFAppState().yourListingItems =
                                      HandyFindersAPIsGroup.userListingCall
                                          .apiList(
                                            (_model.refreshItemListingResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  _model.currentItemsPageIndex = 2;
                                  safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.userListingCall
                                            .apiMessage(
                                          (_model.refreshItemListingResponse
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
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  return;
                                }
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final localItemListing = FFAppState()
                                            .yourListingItems
                                            .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                                  localItemListing.length,
                                                  (localItemListingIndex) {
                                            final localItemListingItem =
                                                localItemListing[
                                                    localItemListingIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFFD5E1E9),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child: Image.network(
                                                            '${FFAppConstants.baseImageUrl}${getJsonField(
                                                              localItemListingItem,
                                                              r'''$.item_images.image''',
                                                            ).toString()}',
                                                            width:
                                                                double.infinity,
                                                            height: 180.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: double
                                                                  .infinity,
                                                              height: 180.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  getJsonField(
                                                                    localItemListingItem,
                                                                    r'''$.category_id''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF8798AD),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'Post on • ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF8798AD),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          getJsonField(
                                                                        localItemListingItem,
                                                                        r'''$.updated_at''',
                                                                      ).toString(),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF8798AD),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              localItemListingItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '\$ ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    localItemListingItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFA9A9A9),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: ' ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    localItemListingItem,
                                                                    r'''$.sale_price''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Color(
                                                                  0x00FFFFFF),
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          -1.5,
                                                                          2.3)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          EditRemoveMenuPopUpWidget(
                                                                        onEdit:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              context);

                                                                          context
                                                                              .pushNamed(
                                                                            AddUpdateListingWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'isUpdating': serializeParam(
                                                                                true,
                                                                                ParamType.bool,
                                                                              ),
                                                                              'data': serializeParam(
                                                                                localItemListingItem,
                                                                                ParamType.JSON,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        onRemove:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              context);
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                                        _model.removeApiResponse = await HandyFindersAPIsGroup.removeItemCall.call(
                                                                                          authToken: FFAppState().authToken,
                                                                                          itemId: getJsonField(
                                                                                            localItemListingItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                        );

                                                                                        _shouldSetState = true;
                                                                                        context.safePop();
                                                                                        if (HandyFindersAPIsGroup.removeItemCall.apiStatus(
                                                                                          (_model.removeApiResponse?.jsonBody ?? ''),
                                                                                        )!) {
                                                                                          ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                HandyFindersAPIsGroup.removeItemCall.apiMessage(
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
                                                                                          FFAppState().removeAtIndexFromYourListingItems(localItemListingIndex);
                                                                                          safeSetState(() {});
                                                                                          return;
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                HandyFindersAPIsGroup.removeItemCall.apiMessage(
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
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x80000000),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.more_vert,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                              .divide(SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(
                                                  height: HandyFindersAPIsGroup
                                                              .userListingCall
                                                              .apiLastPage(
                                                            (_model.initialItemListingResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )! >
                                                          1
                                                      ? 0.0
                                                      : 20.0)),
                                        );
                                      },
                                    ),
                                    if (HandyFindersAPIsGroup.userListingCall
                                            .apiLastPage(
                                          (_model.initialItemListingResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )! >
                                        1)
                                      Builder(
                                        builder: (context) {
                                          if (_model.currentItemsPageIndex <=
                                              HandyFindersAPIsGroup
                                                  .userListingCall
                                                  .apiLastPage(
                                                (_model.initialItemListingResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!) {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                                                  textColor: Color(0xFF6E6E6E),
                                                  isLoading:
                                                      _model.isLoadingMoreItems,
                                                  removeScaffoldPadding: true,
                                                  passOnTapCallback: () async {
                                                    var _shouldSetState = false;
                                                    _model.isLoadingMoreItems =
                                                        true;
                                                    safeSetState(() {});
                                                    _model.loadMoreItemApiResponse =
                                                        await HandyFindersAPIsGroup
                                                            .userListingCall
                                                            .call(
                                                      authToken: FFAppState()
                                                          .authToken,
                                                      type: 'item',
                                                      page: _model
                                                          .currentItemsPageIndex,
                                                    );

                                                    _shouldSetState = true;
                                                    _model.isLoadingMoreItems =
                                                        false;
                                                    safeSetState(() {});
                                                    if ((_model.loadMoreItemApiResponse
                                                                ?.statusCode ??
                                                            200) ==
                                                        FFAppConstants
                                                            .apiStatus201) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            HandyFindersAPIsGroup
                                                                .userListingCall
                                                                .apiMessage(
                                                              (_model.loadMoreItemApiResponse
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
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                      FFAppState().authToken =
                                                          '';
                                                      FFAppState().deviceToken =
                                                          'dummydevicetoken';
                                                      FFAppState()
                                                              .deviceUniqueId =
                                                          'dummyuniqueid';
                                                      FFAppState()
                                                          .userProfileImageUrl = '';
                                                      FFAppState().userName =
                                                          '';
                                                      FFAppState().userEmail =
                                                          '';
                                                      FFAppState().userMobile =
                                                          '';
                                                      FFAppState().userDob = '';
                                                      FFAppState()
                                                          .userCountryCode = '';

                                                      context.goNamed(
                                                        LoginWidget.routeName,
                                                        queryParameters: {
                                                          'showBackButton':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else if (HandyFindersAPIsGroup
                                                        .userListingCall
                                                        .apiStatus(
                                                      (_model.loadMoreItemApiResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!) {
                                                      _model.returnedItemList =
                                                          await actions
                                                              .addJsonList(
                                                        FFAppState()
                                                            .yourListingItems
                                                            .toList(),
                                                        HandyFindersAPIsGroup
                                                            .userListingCall
                                                            .apiList(
                                                              (_model.loadMoreItemApiResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList(),
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState()
                                                              .yourListingItems =
                                                          _model
                                                              .returnedItemList!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      _model.isLoadingMoreItems =
                                                          false;
                                                      _model.currentItemsPageIndex =
                                                          _model.currentItemsPageIndex +
                                                              1;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
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
                                                                .userListingCall
                                                                .apiMessage(
                                                              (_model.loadMoreItemApiResponse
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
                                                              milliseconds:
                                                                  4000),
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
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 25.0),
                                              child: Text(
                                                'No More Data!',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                'No Item Found!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFFB1B1B1),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            );
                          }
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.isInitialServicesFetching) {
                            return wrapWithModel(
                              model: _model.baseLoaderComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: BaseLoaderComponentWidget(
                                backgroundColor: Color(0x00FFFFFF),
                              ),
                            );
                          } else if (HandyFindersAPIsGroup.userListingCall
                                      .apiList(
                                    (_model.initialServiceApiResponse
                                            ?.jsonBody ??
                                        ''),
                                  ) !=
                                  null &&
                              (HandyFindersAPIsGroup.userListingCall.apiList(
                                (_model.initialServiceApiResponse?.jsonBody ??
                                    ''),
                              ))!
                                  .isNotEmpty) {
                            return RefreshIndicator(
                              key: Key('RefreshIndicator_slik6v3u'),
                              onRefresh: () async {
                                _model.isInitialServicesFetching = true;
                                safeSetState(() {});
                                _model.refreshedServiceApiResponse =
                                    await HandyFindersAPIsGroup.userListingCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  type: 'service',
                                  page: 1,
                                );

                                _model.isInitialServicesFetching = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.userListingCall
                                    .apiStatus(
                                  (_model.refreshedServiceApiResponse
                                          ?.jsonBody ??
                                      ''),
                                )!) {
                                  FFAppState().yourListingServices =
                                      HandyFindersAPIsGroup.userListingCall
                                          .apiList(
                                            (_model.refreshedServiceApiResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  _model.isInitialServiceLoaded = true;
                                  _model.currentServicesPageIndex = 2;
                                  safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.userListingCall
                                            .apiMessage(
                                          (_model.refreshedServiceApiResponse
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
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  return;
                                }
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final localServiceListing = FFAppState()
                                            .yourListingServices
                                            .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                                  localServiceListing.length,
                                                  (localServiceListingIndex) {
                                            final localServiceListingItem =
                                                localServiceListing[
                                                    localServiceListingIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFFD5E1E9),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                                      localServiceListingItem,
                                                                      r'''$.item_images''',
                                                                    ) !=
                                                                    null
                                                                ? '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                    localServiceListingItem,
                                                                    r'''$.item_images[0].image''',
                                                                  ).toString()}'
                                                                : '',
                                                            width:
                                                                double.infinity,
                                                            height: 180.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: double
                                                                  .infinity,
                                                              height: 180.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  getJsonField(
                                                                    localServiceListingItem,
                                                                    r'''$.item_detail.category_id''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF8798AD),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'Post on • ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF8798AD),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          getJsonField(
                                                                        localServiceListingItem,
                                                                        r'''$.updated_at''',
                                                                      ).toString(),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF8798AD),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              localServiceListingItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '\$ ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    localServiceListingItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFA9A9A9),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: ' ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    localServiceListingItem,
                                                                    r'''$.sale_price''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Color(
                                                                  0x00FFFFFF),
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          -1.5,
                                                                          2.3)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          EditRemoveMenuPopUpWidget(
                                                                        onEdit:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        onRemove:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                                        _model.removeServiceResponse = await HandyFindersAPIsGroup.removeItemCall.call(
                                                                                          authToken: FFAppState().authToken,
                                                                                          itemId: getJsonField(
                                                                                            localServiceListingItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                        );

                                                                                        _shouldSetState = true;
                                                                                        context.safePop();
                                                                                        if (HandyFindersAPIsGroup.removeItemCall.apiStatus(
                                                                                          (_model.removeServiceResponse?.jsonBody ?? ''),
                                                                                        )!) {
                                                                                          ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                HandyFindersAPIsGroup.removeItemCall.apiMessage(
                                                                                                  (_model.removeServiceResponse?.jsonBody ?? ''),
                                                                                                )!,
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                          FFAppState().removeAtIndexFromYourListingItems(localServiceListingIndex);
                                                                                          safeSetState(() {});
                                                                                          return;
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                HandyFindersAPIsGroup.removeItemCall.apiMessage(
                                                                                                  (_model.removeServiceResponse?.jsonBody ?? ''),
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
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x80000000),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.more_vert,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                              .divide(SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(
                                                  height: HandyFindersAPIsGroup
                                                              .userListingCall
                                                              .apiLastPage(
                                                            (_model.initialItemListingResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )! >
                                                          1
                                                      ? 0.0
                                                      : 20.0)),
                                        );
                                      },
                                    ),
                                    if (HandyFindersAPIsGroup.userListingCall
                                            .apiLastPage(
                                          (_model.initialServiceApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )! >
                                        1)
                                      Builder(
                                        builder: (context) {
                                          if (_model.currentServicesPageIndex <=
                                              HandyFindersAPIsGroup
                                                  .userListingCall
                                                  .apiLastPage(
                                                (_model.initialServiceApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!) {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                                                  textColor: Color(0xFF6E6E6E),
                                                  isLoading: _model
                                                      .isLoadingMoreServices,
                                                  removeScaffoldPadding: true,
                                                  passOnTapCallback: () async {
                                                    var _shouldSetState = false;
                                                    _model.isLoadingMoreItems =
                                                        true;
                                                    safeSetState(() {});
                                                    _model.loadMoreServiceApiResponse =
                                                        await HandyFindersAPIsGroup
                                                            .userSavedListingCall
                                                            .call(
                                                      authToken: FFAppState()
                                                          .authToken,
                                                      type: 'service',
                                                      page: _model
                                                          .currentServicesPageIndex,
                                                    );

                                                    _shouldSetState = true;
                                                    _model.isLoadingMoreItems =
                                                        false;
                                                    safeSetState(() {});
                                                    if ((_model.loadMoreServiceApiResponse
                                                                ?.statusCode ??
                                                            200) ==
                                                        FFAppConstants
                                                            .apiStatus201) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            HandyFindersAPIsGroup
                                                                .userSavedListingCall
                                                                .apiMessage(
                                                              (_model.loadMoreServiceApiResponse
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
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                      FFAppState().authToken =
                                                          '';
                                                      FFAppState().deviceToken =
                                                          'dummydevicetoken';
                                                      FFAppState()
                                                              .deviceUniqueId =
                                                          'dummyuniqueid';
                                                      FFAppState()
                                                          .userProfileImageUrl = '';
                                                      FFAppState().userName =
                                                          '';
                                                      FFAppState().userEmail =
                                                          '';
                                                      FFAppState().userMobile =
                                                          '';
                                                      FFAppState().userDob = '';
                                                      FFAppState()
                                                          .userCountryCode = '';

                                                      context.goNamed(
                                                        LoginWidget.routeName,
                                                        queryParameters: {
                                                          'showBackButton':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else if (HandyFindersAPIsGroup
                                                        .userSavedListingCall
                                                        .apiStatus(
                                                      (_model.loadMoreServiceApiResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            HandyFindersAPIsGroup
                                                                .userSavedListingCall
                                                                .apiMessage(
                                                              (_model.loadMoreServiceApiResponse
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
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                      _model.returnedServiceList =
                                                          await actions
                                                              .addJsonList(
                                                        FFAppState()
                                                            .yourListingServices
                                                            .toList(),
                                                        HandyFindersAPIsGroup
                                                            .userSavedListingCall
                                                            .apiList(
                                                              (_model.loadMoreServiceApiResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList(),
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState()
                                                              .yourListingServices =
                                                          _model
                                                              .returnedServiceList!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      _model.isLoadingMoreItems =
                                                          false;
                                                      _model.currentServicesPageIndex =
                                                          _model.currentServicesPageIndex +
                                                              1;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
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
                                                                .userSavedListingCall
                                                                .apiMessage(
                                                              (_model.loadMoreServiceApiResponse
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
                                                              milliseconds:
                                                                  4000),
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
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 25.0),
                                              child: Text(
                                                'No More Data!',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                'No Service Found!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFFB1B1B1),
                                      letterSpacing: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
