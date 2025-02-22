import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'other_user_profile_model.dart';
export 'other_user_profile_model.dart';

class OtherUserProfileWidget extends StatefulWidget {
  const OtherUserProfileWidget({
    super.key,
    required this.userId,
  });

  final int? userId;

  static String routeName = 'OtherUserProfile';
  static String routePath = '/otherUserProfile';

  @override
  State<OtherUserProfileWidget> createState() => _OtherUserProfileWidgetState();
}

class _OtherUserProfileWidgetState extends State<OtherUserProfileWidget> {
  late OtherUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherUserProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isFetchingDetails = true;
      safeSetState(() {});
      _model.userDetailsResponse =
          await HandyFindersAPIsGroup.userReviewDetailCall.call(
        authToken: FFAppState().authToken,
        userId: widget.userId?.toString(),
        page: 1,
      );

      _model.isFetchingDetails = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.userReviewDetailCall.apiStatus(
        (_model.userDetailsResponse?.jsonBody ?? ''),
      )!) {
        _model.reviewsJsonList = HandyFindersAPIsGroup.userReviewDetailCall
            .apiList(
              (_model.userDetailsResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.userReviewDetailCall.apiMessage(
                (_model.userDetailsResponse?.jsonBody ?? ''),
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
                model: _model.icBackModel,
                updateCallback: () => safeSetState(() {}),
                child: IcBackWidget(),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.isFetchingDetails) {
                      return wrapWithModel(
                        model: _model.baseLoaderComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BaseLoaderComponentWidget(),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional(0.0, 1.45),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.network(
                                        '${FFAppConstants.baseImageUrl}${getJsonField(
                                          HandyFindersAPIsGroup
                                              .userReviewDetailCall
                                              .apiUserDetails(
                                            (_model.userDetailsResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          r'''$.profile_picture''',
                                        ).toString()}',
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 55.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/icStar.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                HandyFindersAPIsGroup
                                                    .userReviewDetailCall
                                                    .overallRating(
                                                      (_model.userDetailsResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.toString(),
                                                '0.0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getJsonField(
                                            HandyFindersAPIsGroup
                                                .userReviewDetailCall
                                                .apiUserDetails(
                                              (_model.userDetailsResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            r'''$.first_name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              HandyFindersAPIsGroup
                                                  .userReviewDetailCall
                                                  .apiUserDetails(
                                                (_model.userDetailsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.user_name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: Color(0xC024272E),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              HandyFindersAPIsGroup
                                                  .userReviewDetailCall
                                                  .apiUserDetails(
                                                (_model.userDetailsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.email''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: Color(0x8024272E),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (_model.reviewsJsonList.isNotEmpty) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final items = _model
                                                  .reviewsJsonList
                                                  .toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    items.length, (itemsIndex) {
                                                  final itemsItem =
                                                      items[itemsIndex];
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
                                                                itemsItem,
                                                                r'''$.reviewer.profile_picture''',
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        itemsItem,
                                                                        r'''$.reviewer.user_name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      RatingBarIndicator(
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              Color(0xFFFFB133),
                                                                        ),
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        rating:
                                                                            getJsonField(
                                                                          itemsItem,
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
                                                                            itemsItem,
                                                                            r'''$.rating''',
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
                                                                ],
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
                                                            itemsItem,
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppConstants.baseImageUrl}${getJsonField(
                                                                  itemsItem,
                                                                  r'''$.service_detail.images[0].image''',
                                                                ).toString()}',
                                                                width: 60.0,
                                                                height: 60.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.5,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        itemsItem,
                                                                        r'''$.service_detail.title''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF24272E),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.5,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                '\$',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              itemsItem,
                                                                              r'''$.service_detail.cost''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(),
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
                                                          functions
                                                              .primaryDateFormate(
                                                                  getJsonField(
                                                                    itemsItem,
                                                                    r'''$.service_detail.created_at''',
                                                                  ).toString(),
                                                                  'MM/dd/yyyy'),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xFF969696),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 25.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'No Reviews Found!',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  ),
                                ],
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
