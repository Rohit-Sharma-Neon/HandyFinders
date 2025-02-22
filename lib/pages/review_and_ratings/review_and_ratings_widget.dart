import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import '/pages/report_menu_pop_up/report_menu_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'review_and_ratings_model.dart';
export 'review_and_ratings_model.dart';

class ReviewAndRatingsWidget extends StatefulWidget {
  const ReviewAndRatingsWidget({super.key});

  static String routeName = 'ReviewAndRatings';
  static String routePath = '/reviewAndRatings';

  @override
  State<ReviewAndRatingsWidget> createState() => _ReviewAndRatingsWidgetState();
}

class _ReviewAndRatingsWidgetState extends State<ReviewAndRatingsWidget> {
  late ReviewAndRatingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewAndRatingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isInitialLoading = true;
      safeSetState(() {});
      _model.initialApiResponse =
          await HandyFindersAPIsGroup.userReviewDetailCall.call(
        authToken: FFAppState().authToken,
        userId: FFAppState().userId,
        page: 1,
      );

      _model.isInitialLoading = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.userReviewDetailCall.apiStatus(
        (_model.initialApiResponse?.jsonBody ?? ''),
      )!) {
        _model.reviewsJosnList = HandyFindersAPIsGroup.userReviewDetailCall
            .apiList(
              (_model.initialApiResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        _model.totalReviews = valueOrDefault<int>(
          HandyFindersAPIsGroup.userReviewDetailCall.totalReviews(
            (_model.initialApiResponse?.jsonBody ?? ''),
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
              HandyFindersAPIsGroup.userReviewDetailCall.apiMessage(
                (_model.initialApiResponse?.jsonBody ?? ''),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.icBackTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: IcBackTitleWidget(
                  title: 'Review & Ratings',
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.isInitialLoading) {
                      return wrapWithModel(
                        model: _model.baseLoaderComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BaseLoaderComponentWidget(),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          HandyFindersAPIsGroup
                                              .userReviewDetailCall
                                              .overallRating(
                                                (_model.initialApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ?.toString(),
                                          'null',
                                        ).maybeHandleOverflow(
                                          maxChars: 3,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 40.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFB133),
                                        ),
                                        direction: Axis.horizontal,
                                        rating: HandyFindersAPIsGroup
                                            .userReviewDetailCall
                                            .overallRating(
                                          (_model.initialApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        unratedColor: Color(0xFFD7D7D7),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '(',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Comfortaa',
                                                      color: Color(0xFF24272E),
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  HandyFindersAPIsGroup
                                                      .userReviewDetailCall
                                                      .totalReviews(
                                                        (_model.initialApiResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      ?.toString(),
                                                  'null',
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ' Reviews',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ')',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: Color(0xFF24272E),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100.0,
                                  child: VerticalDivider(
                                    thickness: 0.6,
                                    color: Color(0xFFB4B4B4),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '5',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent: 0.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0xCCD3D3D3),
                                                barRadius:
                                                    Radius.circular(99.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '4',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent: 0.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0xCCD3D3D3),
                                                barRadius:
                                                    Radius.circular(99.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '3',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent: 0.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0xCCD3D3D3),
                                                barRadius:
                                                    Radius.circular(99.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '2',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent: 0.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0xCCD3D3D3),
                                                barRadius:
                                                    Radius.circular(99.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '1',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent: 0.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0xCCD3D3D3),
                                                barRadius:
                                                    Radius.circular(99.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              key: Key('RefreshIndicator_gdlp1nsf'),
                              onRefresh: () async {
                                _model.isInitialLoading = true;
                                safeSetState(() {});
                                _model.refreshedReviewResponse =
                                    await HandyFindersAPIsGroup
                                        .userReviewDetailCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  userId: '43',
                                  page: 1,
                                );

                                _model.isInitialLoading = false;
                                safeSetState(() {});
                                if (HandyFindersAPIsGroup.userReviewDetailCall
                                    .apiStatus(
                                  (_model.refreshedReviewResponse?.jsonBody ??
                                      ''),
                                )!) {
                                  _model.reviewsJosnList =
                                      HandyFindersAPIsGroup.userReviewDetailCall
                                          .apiList(
                                            (_model.refreshedReviewResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                  _model.currentPageIndex = 2;
                                  _model.totalReviews = valueOrDefault<int>(
                                    HandyFindersAPIsGroup.userReviewDetailCall
                                        .totalReviews(
                                      (_model.initialApiResponse?.jsonBody ??
                                          ''),
                                    ),
                                    0,
                                  );
                                  safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        HandyFindersAPIsGroup
                                            .userReviewDetailCall
                                            .apiMessage(
                                          (_model.refreshedReviewResponse
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
                                        if (_model.reviewsJosnList.isNotEmpty) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final reviews = _model
                                                    .reviewsJosnList
                                                    .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      reviews.length,
                                                      (reviewsIndex) {
                                                    final reviewsItem =
                                                        reviews[reviewsIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          99.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                  reviewsItem,
                                                                  r'''$.reviewer.profile_picture''',
                                                                ).toString()}',
                                                                width: 50.0,
                                                                height: 50.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          reviewsItem,
                                                                          r'''$.reviewer.user_name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                Color(0xFFFFB133),
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating:
                                                                              getJsonField(
                                                                            reviewsItem,
                                                                            r'''$.rating''',
                                                                          ),
                                                                          unratedColor:
                                                                              Color(0xFFD7D7D7),
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              18.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              3.5,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              reviewsItem,
                                                                              r'''$.rating''',
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Builder(
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
                                                                            AlignmentDirectional(-1.9, 2.8).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                WebViewAware(
                                                                              child: GestureDetector(
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
                                                                                                title: 'Are you sure you want to report this comment ?',
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
                                                                                                  _model.reportCommentResponse = await HandyFindersAPIsGroup.reportCommentCall.call(
                                                                                                    authToken: FFAppState().authToken,
                                                                                                    commentId: getJsonField(
                                                                                                      reviewsItem,
                                                                                                      r'''$.id''',
                                                                                                    ).toString(),
                                                                                                  );

                                                                                                  _shouldSetState = true;
                                                                                                  context.safePop();
                                                                                                  if (HandyFindersAPIsGroup.reportCommentCall.apiStatus(
                                                                                                    (_model.reportCommentResponse?.jsonBody ?? ''),
                                                                                                  )!) {
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          HandyFindersAPIsGroup.reportCommentCall.apiMessage(
                                                                                                            (_model.reportCommentResponse?.jsonBody ?? ''),
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
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          HandyFindersAPIsGroup.reportCommentCall.apiMessage(
                                                                                                            (_model.reportCommentResponse?.jsonBody ?? ''),
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
                                                                        color: Color(
                                                                            0xFFE8E8E8),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: custom_widgets
                                                              .BaseReadMoreText(
                                                            width:
                                                                double.infinity,
                                                            height: 20.0,
                                                            text: getJsonField(
                                                              reviewsItem,
                                                              r'''$.review''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      9.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                child: Image
                                                                    .network(
                                                                  'https://picsum.photos/seed/259/600',
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Service',
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.5,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          reviewsItem,
                                                                          r'''$.service_detail.category_id''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Color(0xFF24272E),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.5,
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
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                reviewsItem,
                                                                                r'''$.service_detail.cost''',
                                                                              ).toString(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              reviewsItem,
                                                              r'''$.service_detail.updated_at''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFF969696),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 25.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'No Reviews & Ratings Found!',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .hintTextColor,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    if (HandyFindersAPIsGroup
                                            .userReviewDetailCall
                                            .apiLastPage(
                                          (_model.initialApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )! >
                                        1)
                                      Builder(
                                        builder: (context) {
                                          if (_model.currentPageIndex <=
                                              HandyFindersAPIsGroup
                                                  .userReviewDetailCall
                                                  .apiLastPage(
                                                (_model.initialApiResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!) {
                                            return wrapWithModel(
                                              model: _model
                                                  .baseButtonComponentModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: BaseButtonComponentWidget(
                                                title: 'Load More',
                                                buttonColor: Color(0x00FFFFFF),
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .hintTextColor,
                                                isLoading: _model.isLoadingMore,
                                                removeScaffoldPadding: false,
                                                passOnTapCallback: () async {
                                                  var _shouldSetState = false;
                                                  _model.isLoadingMore = true;
                                                  safeSetState(() {});
                                                  _model.loadMoreResponse =
                                                      await HandyFindersAPIsGroup
                                                          .userReviewDetailCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    userId: FFAppState().userId,
                                                    page:
                                                        _model.currentPageIndex,
                                                  );

                                                  _shouldSetState = true;
                                                  _model.isLoadingMore = false;
                                                  safeSetState(() {});
                                                  if (HandyFindersAPIsGroup
                                                      .userReviewDetailCall
                                                      .apiStatus(
                                                    (_model.loadMoreResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!) {
                                                    _model.returnedList =
                                                        await actions
                                                            .addJsonList(
                                                      _model.reviewsJosnList
                                                          .toList(),
                                                      HandyFindersAPIsGroup
                                                          .userReviewDetailCall
                                                          .apiList(
                                                            (_model.loadMoreResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList(),
                                                    );
                                                    _shouldSetState = true;
                                                    _model.reviewsJosnList =
                                                        _model.returnedList!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    _model.currentPageIndex =
                                                        _model.currentPageIndex +
                                                            1;
                                                    _model.totalReviews =
                                                        valueOrDefault<int>(
                                                      HandyFindersAPIsGroup
                                                          .userReviewDetailCall
                                                          .totalReviews(
                                                        (_model.loadMoreResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      0,
                                                    );
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          HandyFindersAPIsGroup
                                                              .userReviewDetailCall
                                                              .apiMessage(
                                                            (_model.loadMoreResponse
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
                            ),
                          ),
                        ],
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
