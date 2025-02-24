import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/comments_bottom_sheet_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/components/gradient_background_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import '/pages/report_menu_pop_up/report_menu_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_tab_model.dart';
export 'home_tab_model.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({super.key});

  static String routeName = 'HomeTab';
  static String routePath = '/homeTab';

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  late HomeTabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeTabModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isHomeTabInitialApiLoaded) {
        return;
      }

      _model.isInitialApiLoading = true;
      safeSetState(() {});
      _model.homeCategoriesResponse =
          await HandyFindersAPIsGroup.homeCategoriesCall.call(
        authToken: FFAppState().authToken,
      );

      _model.initialHomeRequestListResponse =
          await HandyFindersAPIsGroup.homePostListCall.call(
        authToken: FFAppState().authToken,
        latitude: '28.7041',
        longitude: '77.1025',
      );

      _model.getNotificationCountResponse =
          await HandyFindersAPIsGroup.getNotificationCountCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isInitialApiLoading = false;
      FFAppState().isHomeTabInitialApiLoaded = true;
      FFAppState().homeTabPostList = HandyFindersAPIsGroup.homePostListCall
          .apiList(
            (_model.initialHomeRequestListResponse?.jsonBody ?? ''),
          )!
          .toList()
          .cast<dynamic>();
      FFAppState().homeTabCategoriesList =
          HandyFindersAPIsGroup.homeCategoriesCall
              .apiList(
                (_model.homeCategoriesResponse?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
      FFAppState().notificationCount = valueOrDefault<int>(
        HandyFindersAPIsGroup.getNotificationCountCall.apiNotificationCount(
          (_model.getNotificationCountResponse?.jsonBody ?? ''),
        ),
        0,
      );
      safeSetState(() {});
      return;
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(PostOnFeedWidget.routeName);
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
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.gradientBackgroundModel,
              updateCallback: () => safeSetState(() {}),
              child: GradientBackgroundWidget(),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        FFAppConstants.scaffoldHorizontalPadding,
                        0.0,
                      ),
                      valueOrDefault<double>(
                        FFAppConstants.topSafeArea,
                        0.0,
                      ),
                      valueOrDefault<double>(
                        FFAppConstants.scaffoldHorizontalPadding,
                        0.0,
                      ),
                      0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            CreateUpdateProfileWidget.routeName,
                            queryParameters: {
                              'isUpdating': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'hideBackButton': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(99.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                '${FFAppConstants.baseImageUrl}${FFAppState().userProfileImageUrl}',
                            width: 55.0,
                            height: 55.0,
                            fit: BoxFit.fill,
                            errorWidget: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: 55.0,
                              height: 55.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hi, ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 19.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFAppState().userFirstName,
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: ' 👋',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                'New York, US ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(NotificationsWidget.routeName);
                        },
                        child: Stack(
                          alignment: AlignmentDirectional(1.3, -1.3),
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/ic_bell.png',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            if (FFAppState().notificationCount > 0)
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState()
                                            .notificationCount
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 11.5,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        FFAppConstants.scaffoldHorizontalPadding,
                        0.0,
                      ),
                      18.0,
                      valueOrDefault<double>(
                        FFAppConstants.scaffoldHorizontalPadding,
                        0.0,
                      ),
                      0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 1000),
                                      () async {
                                        var _shouldSetState = false;
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        FFAppState().isHomePageSearching = true;
                                        safeSetState(() {});
                                        _model.postSearchResult =
                                            await HandyFindersAPIsGroup
                                                .homePostListCall
                                                .call(
                                          authToken: FFAppState().authToken,
                                          latitude: '28.7041',
                                          longitude: '77.1025',
                                          search: _model.textController.text,
                                        );

                                        _shouldSetState = true;
                                        FFAppState().isHomePageSearching =
                                            false;
                                        safeSetState(() {});
                                        if (HandyFindersAPIsGroup
                                            .homePostListCall
                                            .apiStatus(
                                          (_model.postSearchResult?.jsonBody ??
                                              ''),
                                        )!) {
                                          FFAppState().homeTabPostList =
                                              HandyFindersAPIsGroup
                                                  .homePostListCall
                                                  .apiList(
                                                    (_model.postSearchResult
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList()
                                                  .cast<dynamic>();
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
                                                    .homePostListCall
                                                    .apiMessage(
                                                  (_model.postSearchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 18.0, 10.0, 18.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
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
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: FilterBottomSheetWidget(
                                      searchedText: _model.textController.text,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          width: 50.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(11.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
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
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_model.isInitialApiLoading) {
                        return Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Lottie.network(
                            'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        );
                      } else {
                        return RefreshIndicator(
                          key: Key('RefreshIndicator_9ranmyfx'),
                          onRefresh: () async {
                            _model.refreshedHomeCategoriesResponse =
                                await HandyFindersAPIsGroup.homeCategoriesCall
                                    .call(
                              authToken: FFAppState().authToken,
                            );

                            _model.refreshedHomeRequestListResponse =
                                await HandyFindersAPIsGroup.homePostListCall
                                    .call(
                              authToken: FFAppState().authToken,
                              latitude: '28.7041',
                              longitude: '77.1025',
                              search: _model.textController.text,
                            );

                            _model.refreshedNotificationCountResponse =
                                await HandyFindersAPIsGroup
                                    .getNotificationCountCall
                                    .call(
                              authToken: FFAppState().authToken,
                            );

                            FFAppState().isHomeTabInitialApiLoaded = true;
                            FFAppState().homeTabPostList =
                                HandyFindersAPIsGroup.homePostListCall
                                    .apiList(
                                      (_model.refreshedHomeRequestListResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                            FFAppState().homeTabCategoriesList =
                                HandyFindersAPIsGroup.homeCategoriesCall
                                    .apiList(
                                      (_model.refreshedHomeCategoriesResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                            FFAppState().notificationCount =
                                valueOrDefault<int>(
                              HandyFindersAPIsGroup.getNotificationCountCall
                                  .apiNotificationCount(
                                (_model.refreshedNotificationCountResponse
                                        ?.jsonBody ??
                                    ''),
                              ),
                              0,
                            );
                            safeSetState(() {});
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        FFAppConstants
                                            .scaffoldHorizontalPadding,
                                        0.0,
                                      ),
                                      14.0,
                                      valueOrDefault<double>(
                                        FFAppConstants
                                            .scaffoldHorizontalPadding,
                                        0.0,
                                      ),
                                      0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Categories',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState()
                                              .homeTabCategoriesList
                                              .length >
                                          4)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                CategoriesWidget.routeName);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 3.0, 5.0, 3.0),
                                              child: Text(
                                                'View All',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Comfortaa',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .underline,
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
                                      0.0, 13.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final categoriesLocalVariable =
                                          FFAppState()
                                              .homeTabCategoriesList
                                              .toList()
                                              .take(5)
                                              .toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                                  categoriesLocalVariable
                                                      .length,
                                                  (categoriesLocalVariableIndex) {
                                            final categoriesLocalVariableItem =
                                                categoriesLocalVariable[
                                                    categoriesLocalVariableIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CategoryItemsWidget.routeName,
                                                  queryParameters: {
                                                    'appBarTitle':
                                                        serializeParam(
                                                      getJsonField(
                                                        categoriesLocalVariableItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'categoryIdName':
                                                        serializeParam(
                                                      getJsonField(
                                                        categoriesLocalVariableItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE8E8E8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(14.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        child:
                                                            CachedNetworkImage(
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
                                                            categoriesLocalVariableItem,
                                                            r'''$.image''',
                                                          ).toString()}',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    getJsonField(
                                                      categoriesLocalVariableItem,
                                                      r'''$.name''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 25,
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                              .divide(SizedBox(width: 12.0))
                                              .addToStart(SizedBox(width: 19.0))
                                              .addToEnd(SizedBox(
                                                  width: FFAppConstants
                                                      .scaffoldHorizontalPadding)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 40.0,
                                  thickness: 8.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Builder(
                                  builder: (context) {
                                    if (FFAppState().isHomePageSearching) {
                                      return wrapWithModel(
                                        model: _model.baseLoaderComponentModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BaseLoaderComponentWidget(
                                          height: 400.0,
                                        ),
                                      );
                                    } else {
                                      return Builder(
                                        builder: (context) {
                                          if (FFAppState()
                                              .homeTabPostList
                                              .isNotEmpty) {
                                            return Builder(
                                              builder: (context) {
                                                final homePostList =
                                                    FFAppState()
                                                        .homeTabPostList
                                                        .toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      homePostList.length,
                                                  itemBuilder: (context,
                                                      homePostListIndex) {
                                                    final homePostListItem =
                                                        homePostList[
                                                            homePostListIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: InkWell(
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
                                                                    context
                                                                        .pushNamed(
                                                                      OtherUserProfileWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'userId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            homePostListItem,
                                                                            r'''$.user_detail.id''',
                                                                          ),
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(99.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                            homePostListItem,
                                                                            r'''$.user_detail.profile_picture''',
                                                                          ).toString()}',
                                                                          width:
                                                                              42.0,
                                                                          height:
                                                                              42.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          errorWidget: (context, error, stackTrace) =>
                                                                              Image.asset(
                                                                            'assets/images/error_image.png',
                                                                            width:
                                                                                42.0,
                                                                            height:
                                                                                42.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              homePostListItem,
                                                                              r'''$.user_detail.user_name''',
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            99.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/ic_chat.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
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
                                                                    await showAlignedDialog(
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00FFFFFF),
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          false,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              -1.9,
                                                                              2.5)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: ReportMenuPopUpWidget(
                                                                                onReport: () async {
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
                                                                                              title: 'Are you sure you want to report this post ?',
                                                                                              onYesTap: () async {
                                                                                                var _shouldSetState = false;
                                                                                                Navigator.pop(context);
                                                                                                unawaited(
                                                                                                  () async {
                                                                                                    await actions.showBaseLoader(
                                                                                                      context,
                                                                                                    );
                                                                                                  }(),
                                                                                                );
                                                                                                _model.reportResponse = await HandyFindersAPIsGroup.reportPostCall.call(
                                                                                                  authToken: FFAppState().authToken,
                                                                                                  postId: getJsonField(
                                                                                                    homePostListItem,
                                                                                                    r'''$.id''',
                                                                                                  ),
                                                                                                );

                                                                                                _shouldSetState = true;
                                                                                                context.safePop();
                                                                                                if (HandyFindersAPIsGroup.reportPostCall.apiStatus(
                                                                                                  (_model.reportResponse?.jsonBody ?? ''),
                                                                                                )!) {
                                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        HandyFindersAPIsGroup.reportPostCall.apiMessage(
                                                                                                          (_model.reportResponse?.jsonBody ?? ''),
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
                                                                                                } else {
                                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        HandyFindersAPIsGroup.reportPostCall.apiMessage(
                                                                                                          (_model.reportResponse?.jsonBody ?? ''),
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
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFE2E2E2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              11.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/ic_more.png',
                                                                          fit: BoxFit
                                                                              .fitHeight,
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
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  13.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                height: 28.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFBDE5FF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      homePostListItem,
                                                                      r'''$.category_id''',
                                                                    ).toString(),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if ((String
                                                                        type) {
                                                                      return type
                                                                          .toLowerCase()
                                                                          .contains(
                                                                              "request");
                                                                    }(getJsonField(
                                                                      homePostListItem,
                                                                      r'''$.type''',
                                                                    ).toString())) {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  homePostListItem,
                                                                                  r'''$.cost''',
                                                                                ).toString(),
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Text(
                                                                        '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Comfortaa',
                                                                              color: Color(0x0014181B),
                                                                              fontSize: 0.1,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 28.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFC9FFE0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    (String
                                                                        type) {
                                                                      return type ==
                                                                              "request"
                                                                          ? "Request/Forum"
                                                                          : "Tip/Advice";
                                                                    }(getJsonField(
                                                                      homePostListItem,
                                                                      r'''$.type''',
                                                                    ).toString()),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Color(0xFF1AB34D),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              homePostListItem,
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
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            functions.primaryDateFormate(
                                                                getJsonField(
                                                                  homePostListItem,
                                                                  r'''$.updated_at''',
                                                                ).toString(),
                                                                'MMMM dd, yyyy'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0x7F24272E),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  11.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              homePostListItem,
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
                                                              homePostListItem,
                                                              r'''$.images''',
                                                            ) !=
                                                            null)
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppConstants
                                                                          .scaffoldHorizontalPadding,
                                                                      0.0,
                                                                    ),
                                                                    10.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppConstants
                                                                          .scaffoldHorizontalPadding,
                                                                      0.0,
                                                                    ),
                                                                    0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
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
                                                                  homePostListItem,
                                                                  r'''$.images[0].image''',
                                                                ).toString()}',
                                                                width: double
                                                                    .infinity,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  14.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    FFAppConstants
                                                                        .scaffoldHorizontalPadding,
                                                                    0.0,
                                                                  ),
                                                                  0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if ((int
                                                                      isLiked) {
                                                                    return isLiked ==
                                                                            1
                                                                        ? true
                                                                        : false;
                                                                  }(getJsonField(
                                                                    homePostListItem,
                                                                    r'''$.is_liked''',
                                                                  ))) {
                                                                    return InkWell(
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
                                                                        var _shouldSetState =
                                                                            false;
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.showBaseLoader(
                                                                              context,
                                                                            );
                                                                          }(),
                                                                        );
                                                                        _model.dislikeResponse = await HandyFindersAPIsGroup
                                                                            .likeDislikeCall
                                                                            .call(
                                                                          authToken:
                                                                              FFAppState().authToken,
                                                                          postId:
                                                                              getJsonField(
                                                                            homePostListItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          statusKey:
                                                                              0,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        context
                                                                            .safePop();
                                                                        if (HandyFindersAPIsGroup
                                                                            .likeDislikeCall
                                                                            .apiStatus(
                                                                          (_model.dislikeResponse?.jsonBody ??
                                                                              ''),
                                                                        )!) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .clearSnackBars();
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                  (_model.dislikeResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          _model.returnedDislikeJson =
                                                                              await actions.updateLikeStatusKeyValue(
                                                                            homePostListItem,
                                                                            false,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          FFAppState()
                                                                              .updateHomeTabPostListAtIndex(
                                                                            homePostListIndex,
                                                                            (_) =>
                                                                                _model.returnedDislikeJson!,
                                                                          );
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
                                                                                HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                  (_model.dislikeResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return InkWell(
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
                                                                        var _shouldSetState =
                                                                            false;
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.showBaseLoader(
                                                                              context,
                                                                            );
                                                                          }(),
                                                                        );
                                                                        _model.likeResponse = await HandyFindersAPIsGroup
                                                                            .likeDislikeCall
                                                                            .call(
                                                                          authToken:
                                                                              FFAppState().authToken,
                                                                          postId:
                                                                              getJsonField(
                                                                            homePostListItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          statusKey:
                                                                              1,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        context
                                                                            .safePop();
                                                                        if (HandyFindersAPIsGroup
                                                                            .likeDislikeCall
                                                                            .apiStatus(
                                                                          (_model.likeResponse?.jsonBody ??
                                                                              ''),
                                                                        )!) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .clearSnackBars();
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                  (_model.likeResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          _model.returnedJson =
                                                                              await actions.updateLikeStatusKeyValue(
                                                                            homePostListItem,
                                                                            true,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          FFAppState()
                                                                              .updateHomeTabPostListAtIndex(
                                                                            homePostListIndex,
                                                                            (_) =>
                                                                                _model.returnedJson!,
                                                                          );
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
                                                                                HandyFindersAPIsGroup.likeDislikeCall.apiMessage(
                                                                                  (_model.likeResponse?.jsonBody ?? ''),
                                                                                )!,
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    homePostListItem,
                                                                    r'''$.total_liked''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Comfortaa',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
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
                                                                  await actions
                                                                      .removeFocus(
                                                                    context,
                                                                  );
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
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.7,
                                                                              child: CommentsBottomSheetWidget(
                                                                                id: getJsonField(
                                                                                  homePostListItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                                index: homePostListIndex,
                                                                              ),
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/icMessage.png',
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          homePostListItem,
                                                                          r'''$.total_comment''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Comfortaa',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
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
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Share
                                                                        .share(
                                                                      'Dummy Share',
                                                                      sharePositionOrigin:
                                                                          getWidgetBoundingBox(
                                                                              context),
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
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              homePostListItem,
                                                                              r'''$.total_share''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Comfortaa',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
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
                                                        Divider(
                                                          height: 40.0,
                                                          thickness: 8.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          } else {
                                            return Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.45,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'No Post Found!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .hintTextColor,
                                                        letterSpacing: 0.0,
                                                      ),
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
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
