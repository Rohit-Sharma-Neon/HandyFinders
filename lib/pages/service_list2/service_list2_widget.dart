import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'service_list2_model.dart';
export 'service_list2_model.dart';

class ServiceList2Widget extends StatefulWidget {
  const ServiceList2Widget({
    super.key,
    required this.type,
  });

  final String? type;

  static String routeName = 'ServiceList2';
  static String routePath = '/serviceList2';

  @override
  State<ServiceList2Widget> createState() => _ServiceList2WidgetState();
}

class _ServiceList2WidgetState extends State<ServiceList2Widget> {
  late ServiceList2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceList2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.servicesListResponse =
          await HandyFindersAPIsGroup.allSaleServiceListCall.call(
        authToken: FFAppState().authToken,
        page: _model.currentPageIndex,
        type: widget.type,
      );

      _model.isFetchingApi = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.allSaleServiceListCall.apiStatus(
        (_model.servicesListResponse?.jsonBody ?? ''),
      )!) {
        _model.itemsList = HandyFindersAPIsGroup.allSaleServiceListCall
            .apiList(
              (_model.servicesListResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.currentPageIndex = 2;
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.allSaleServiceListCall.apiMessage(
                (_model.servicesListResponse?.jsonBody ?? ''),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: wrapWithModel(
                  model: _model.icBackTitleModel,
                  updateCallback: () => safeSetState(() {}),
                  child: IcBackTitleWidget(
                    title: 'Services',
                    hideBackButton: false,
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.isFetchingApi) {
                      return wrapWithModel(
                        model: _model.baseLoaderComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BaseLoaderComponentWidget(
                          backgroundColor: Color(0x00FFFFFF),
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        key: Key('RefreshIndicator_25x6shug'),
                        onRefresh: () async {
                          _model.currentPageIndex = 1;
                          _model.refreshedSaleServiceListResponse =
                              await HandyFindersAPIsGroup.allSaleServiceListCall
                                  .call(
                            authToken: FFAppState().authToken,
                            page: _model.currentPageIndex,
                            type: widget.type,
                          );

                          if (HandyFindersAPIsGroup.allSaleServiceListCall
                              .apiStatus(
                            (_model.refreshedSaleServiceListResponse
                                    ?.jsonBody ??
                                ''),
                          )!) {
                            _model.itemsList =
                                HandyFindersAPIsGroup.allSaleServiceListCall
                                    .apiList(
                                      (_model.refreshedSaleServiceListResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                            _model.currentPageIndex = 2;
                            safeSetState(() {});
                            return;
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.allSaleServiceListCall
                                      .apiMessage(
                                    (_model.refreshedSaleServiceListResponse
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
                            return;
                          }
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final newestItems =
                                        _model.itemsList.toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 7.2,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.7,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: newestItems.length,
                                      itemBuilder: (context, newestItemsIndex) {
                                        final newestItemsItem =
                                            newestItems[newestItemsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ItemOrServiceDetailWidget
                                                  .routeName,
                                              queryParameters: {
                                                'listingType': serializeParam(
                                                  'Service',
                                                  ParamType.String,
                                                ),
                                                'id': serializeParam(
                                                  getJsonField(
                                                    newestItemsItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: Color(0xFFDFDFDF),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    0),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    0),
                                                        imageUrl:
                                                            '${FFAppConstants.baseImageUrl}${getJsonField(
                                                          newestItemsItem,
                                                          r'''$.item_images[0].image''',
                                                        ).toString()}',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.6,
                                                        height: 150.0,
                                                        fit: BoxFit.fill,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.6,
                                                          height: 150.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          newestItemsItem,
                                                          r'''$.category_id''',
                                                        ).toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: Color(
                                                                  0xFF8798AD),
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  7.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          newestItemsItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (getJsonField(
                                                              newestItemsItem,
                                                              r'''$.is_free''',
                                                            ) ==
                                                            0) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        5.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: '\$',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          decoration:
                                                                              TextDecoration.lineThrough,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      newestItemsItem,
                                                                      r'''$.price''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: ' \$',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      newestItemsItem,
                                                                      r'''$.sale_price''',
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        5.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Free',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Share.share(
                                                            'Post Sharing',
                                                            sharePositionOrigin:
                                                                getWidgetBoundingBox(
                                                                    context),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 35.0,
                                                          height: 35.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x3614181B),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        99.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/icShareWhite.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                10.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (getJsonField(
                                                              newestItemsItem,
                                                              r'''$.is_bookmarked''',
                                                            ) ==
                                                            1) {
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        unawaited(
                                                          () async {
                                                            await actions
                                                                .showBaseLoader(
                                                              context,
                                                            );
                                                          }(),
                                                        );
                                                        _model.bookmarkResponse =
                                                            await HandyFindersAPIsGroup
                                                                .bookmarkItemCall
                                                                .call(
                                                          authToken:
                                                              FFAppState()
                                                                  .authToken,
                                                          itemId: getJsonField(
                                                            newestItemsItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        );

                                                        _shouldSetState = true;
                                                        context.safePop();
                                                        if (HandyFindersAPIsGroup
                                                            .bookmarkItemCall
                                                            .apiStatus(
                                                          (_model.bookmarkResponse
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
                                                                    .bookmarkItemCall
                                                                    .apiMessage(
                                                                  (_model.bookmarkResponse
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
                                                                    .bookmarkItemCall
                                                                    .apiMessage(
                                                                  (_model.bookmarkResponse
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
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 35.0,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x3614181B),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      99.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (getJsonField(
                                                                  newestItemsItem,
                                                                  r'''$.is_bookmarked''',
                                                                ) ==
                                                                1) {
                                                              return Icon(
                                                                Icons.bookmark,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              );
                                                            } else {
                                                              return Icon(
                                                                Icons
                                                                    .bookmark_border,
                                                                color: Colors
                                                                    .white,
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
                                      },
                                    );
                                  },
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (HandyFindersAPIsGroup
                                          .allSaleServiceListCall
                                          .apiLastPage(
                                        (_model.servicesListResponse
                                                ?.jsonBody ??
                                            ''),
                                      )! <
                                      _model.currentPageIndex) {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 25.0),
                                        child: Text(
                                          'No More Data!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .hintTextColor,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: wrapWithModel(
                                        model: _model.baseButtonComponentModel,
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
                                            _model.loadMoreSaleServiceListResponse =
                                                await HandyFindersAPIsGroup
                                                    .allSaleServiceListCall
                                                    .call(
                                              authToken: FFAppState().authToken,
                                              page: _model.currentPageIndex,
                                              type: widget.type,
                                            );

                                            _shouldSetState = true;
                                            _model.isLoadingMore = false;
                                            safeSetState(() {});
                                            if (HandyFindersAPIsGroup
                                                .allSaleServiceListCall
                                                .apiStatus(
                                              (_model.loadMoreSaleServiceListResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            )!) {
                                              _model.returnedList =
                                                  await actions.addJsonList(
                                                _model.itemsList.toList(),
                                                HandyFindersAPIsGroup
                                                    .allSaleServiceListCall
                                                    .apiList(
                                                      (_model.loadMoreSaleServiceListResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList(),
                                              );
                                              _shouldSetState = true;
                                              _model.itemsList = _model
                                                  .returnedList!
                                                  .toList()
                                                  .cast<dynamic>();
                                              _model.currentPageIndex =
                                                  _model.currentPageIndex + 1;
                                              safeSetState(() {});
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    HandyFindersAPIsGroup
                                                        .allSaleServiceListCall
                                                        .apiMessage(
                                                      (_model.loadMoreSaleServiceListResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                        ),
                      );
                    }
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
