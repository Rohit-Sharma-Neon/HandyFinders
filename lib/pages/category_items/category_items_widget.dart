import '/backend/api_requests/api_calls.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'category_items_model.dart';
export 'category_items_model.dart';

class CategoryItemsWidget extends StatefulWidget {
  const CategoryItemsWidget({
    super.key,
    String? appBarTitle,
    required this.categoryIdName,
  }) : this.appBarTitle = appBarTitle ?? '';

  final String appBarTitle;
  final String? categoryIdName;

  static String routeName = 'CategoryItems';
  static String routePath = '/categoryItems';

  @override
  State<CategoryItemsWidget> createState() => _CategoryItemsWidgetState();
}

class _CategoryItemsWidgetState extends State<CategoryItemsWidget> {
  late CategoryItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryItemsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initialApiResponse =
          await HandyFindersAPIsGroup.categoryItemsCall.call(
        authToken: FFAppState().authToken,
        categoryId: widget.categoryIdName,
        page: 1,
      );

      if (HandyFindersAPIsGroup.categoryItemsCall.apiStatus(
        (_model.initialApiResponse?.jsonBody ?? ''),
      )!) {
        _model.itemsJsonList = HandyFindersAPIsGroup.categoryItemsCall
            .apiList(
              (_model.initialApiResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.isFetchingInitialApi = false;
        _model.currentPageIndex = 2;
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.categoryItemsCall.apiMessage(
                (_model.initialApiResponse?.jsonBody ?? ''),
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
                    title: valueOrDefault<String>(
                      widget.appBarTitle,
                      'null',
                    ),
                    hideBackButton: false,
                  ),
                ),
              ),
              if (HandyFindersAPIsGroup.categoryItemsCall.apiList(
                        (_model.initialApiResponse?.jsonBody ?? ''),
                      ) !=
                      null &&
                  (HandyFindersAPIsGroup.categoryItemsCall.apiList(
                    (_model.initialApiResponse?.jsonBody ?? ''),
                  ))!
                      .isNotEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 12.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/icSearchBlue.png',
                              height: 25.0,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.74,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                var _shouldSetState = false;
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                _model.isFetchingInitialApi = true;
                                safeSetState(() {});
                                _model.searchResponse =
                                    await HandyFindersAPIsGroup
                                        .categoryItemsCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  categoryId: widget.categoryIdName,
                                  page: 1,
                                  search: _model.textController.text,
                                );

                                _shouldSetState = true;
                                _model.isFetchingInitialApi = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.categoryItemsCall
                                    .apiStatus(
                                  (_model.searchResponse?.jsonBody ?? ''),
                                )!) {
                                  _model.itemsJsonList = HandyFindersAPIsGroup
                                      .categoryItemsCall
                                      .apiList(
                                        (_model.searchResponse?.jsonBody ?? ''),
                                      )!
                                      .toList()
                                      .cast<dynamic>();
                                  _model.currentPageIndex = 2;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup.categoryItemsCall
                                            .apiMessage(
                                          (_model.searchResponse?.jsonBody ??
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

                                if (_shouldSetState) safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'What are you looking...',
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 18.0, 10.0, 18.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _model.refreshedApiResponse =
                        await HandyFindersAPIsGroup.categoryItemsCall.call(
                      authToken: FFAppState().authToken,
                      categoryId: widget.categoryIdName,
                      page: 1,
                      search: _model.textController.text,
                    );

                    if (HandyFindersAPIsGroup.categoryItemsCall.apiStatus(
                      (_model.refreshedApiResponse?.jsonBody ?? ''),
                    )!) {
                      _model.itemsJsonList =
                          HandyFindersAPIsGroup.categoryItemsCall
                              .apiList(
                                (_model.refreshedApiResponse?.jsonBody ?? ''),
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
                            HandyFindersAPIsGroup.categoryItemsCall.apiMessage(
                              (_model.refreshedApiResponse?.jsonBody ?? ''),
                            )!,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
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
                        Builder(
                          builder: (context) {
                            if (_model.isFetchingInitialApi) {
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Lottie.network(
                                  'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.fitHeight,
                                  animate: true,
                                ),
                              );
                            } else if (_model.itemsJsonList.isNotEmpty) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final items = _model.itemsJsonList.toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        10.0,
                                        0,
                                        30.0,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 7.0,
                                        mainAxisSpacing: 20.0,
                                        childAspectRatio: 0.74,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: items.length,
                                      itemBuilder: (context, itemsIndex) {
                                        final itemsItem = items[itemsIndex];
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  ItemOrServiceDetailWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'listingType':
                                                        serializeParam(
                                                      'Item',
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        itemsItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
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
                                                      child: Image.network(
                                                        '${FFAppConstants.baseImageUrl}${getJsonField(
                                                          itemsItem,
                                                          r'''$.item_images[0].image''',
                                                        ).toString()}',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.6,
                                                        height: 150.0,
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,
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
                                                          itemsItem,
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
                                                          itemsItem,
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
                                                              itemsItem,
                                                              r'''$.is_free''',
                                                            ) ==
                                                            1) {
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
                                                                      itemsItem,
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
                                                                      itemsItem,
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
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Builder(
                                                  builder: (context) => Padding(
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
                                                          color:
                                                              Color(0x3614181B),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x3614181B),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/icBookmark.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'No Items Found!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.of(context)
                                              .hintTextColor,
                                          letterSpacing: 0.0,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
