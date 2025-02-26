import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/base_loader_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_confirmation_dialog/custom_confirmation_dialog_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_tab_model.dart';
export 'profile_tab_model.dart';

class ProfileTabWidget extends StatefulWidget {
  const ProfileTabWidget({super.key});

  static String routeName = 'ProfileTab';
  static String routePath = '/profileTab';

  @override
  State<ProfileTabWidget> createState() => _ProfileTabWidgetState();
}

class _ProfileTabWidgetState extends State<ProfileTabWidget> {
  late ProfileTabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTabModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().profileTabVariablesState.isProfileLoaded) {
        safeSetState(() {
          _model.switchValue =
              FFAppState().userDetailsAppState.notificationStatus;
        });
        return;
      } else {
        FFAppState().updateProfileTabVariablesStateStruct(
          (e) => e..isProfileLoading = true,
        );
        safeSetState(() {});
        _model.getProfileResponse =
            await HandyFindersAPIsGroup.getProfileCall.call(
          authToken: FFAppState().authToken,
        );

        FFAppState().updateProfileTabVariablesStateStruct(
          (e) => e..isProfileLoading = false,
        );
        safeSetState(() {});
        if (HandyFindersAPIsGroup.getProfileCall.apiStatus(
          (_model.getProfileResponse?.jsonBody ?? ''),
        )!) {
          safeSetState(() {
            _model.switchValue =
                FFAppState().userDetailsAppState.notificationStatus;
          });
          FFAppState().userDetailsAppState = UserDataTypeStruct(
            username: HandyFindersAPIsGroup.getProfileCall.apiUserName(
              (_model.getProfileResponse?.jsonBody ?? ''),
            ),
            firstName: HandyFindersAPIsGroup.getProfileCall.apiFirstName(
              (_model.getProfileResponse?.jsonBody ?? ''),
            ),
            lastName: HandyFindersAPIsGroup.getProfileCall.apiLastName(
              (_model.getProfileResponse?.jsonBody ?? ''),
            ),
            userProfilePhotoUrl:
                HandyFindersAPIsGroup.getProfileCall.apiProfilePictureUrl(
              (_model.getProfileResponse?.jsonBody ?? ''),
            ),
            userRatings:
                HandyFindersAPIsGroup.getProfileCall.apiUserOverallRatting(
              (_model.getProfileResponse?.jsonBody ?? ''),
            ),
            notificationStatus:
                (HandyFindersAPIsGroup.getProfileCall.apiNotificationStatus(
                      (_model.getProfileResponse?.jsonBody ?? ''),
                    )!) ==
                    1,
          );
          FFAppState().updateProfileTabVariablesStateStruct(
            (e) => e..isProfileLoaded = true,
          );
          FFAppState().update(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                HandyFindersAPIsGroup.getProfileCall.apiMessage(
                  (_model.getProfileResponse?.jsonBody ?? ''),
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
      }
    });

    _model.switchValue = FFAppState().userDetailsAppState.notificationStatus;
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
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.gradientBackgroundModel,
              updateCallback: () => safeSetState(() {}),
              child: GradientBackgroundWidget(),
            ),
            Builder(
              builder: (context) {
                if (FFAppState().profileTabVariablesState.isProfileLoading) {
                  return wrapWithModel(
                    model: _model.baseLoaderComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BaseLoaderComponentWidget(),
                  );
                } else {
                  return Padding(
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 60.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional(0.0, 1.5),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration: Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          Duration(milliseconds: 0),
                                      imageUrl: FFAppState()
                                                      .userProfileImageUrl !=
                                                  ''
                                          ? '${FFAppConstants.baseImageUrl}${FFAppState().userProfileImageUrl}'
                                          : '',
                                      width: 65.0,
                                      height: 65.0,
                                      fit: BoxFit.cover,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 65.0,
                                        height: 65.0,
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
                                      borderRadius: BorderRadius.circular(5.0),
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
                                              FFAppState()
                                                  .userDetailsAppState
                                                  .userRatings
                                                  .toString(),
                                              '0.0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFAppState()
                                                  .userDetailsAppState
                                                  .firstName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Comfortaa',
                                                    color: Color(0xFF253B3D),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    lineHeight: 1.0,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                  .userDetailsAppState
                                                  .lastName,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                color: Color(0xFF253B3D),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFAppState()
                                            .userDetailsAppState
                                            .username,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color: Color(0x7F24272E),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.0,
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
                                  context.pushNamed(
                                    CreateUpdateProfileWidget.routeName,
                                    queryParameters: {
                                      'isUpdating': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 37.0,
                                  height: 37.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 8.0,
                                        color: Color(0x335F5F5F),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                        spreadRadius: 3.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(14.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x65919A6B),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/icEditUnderline.svg',
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    'Account',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: Color(0x80253B3D),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context
                                          .pushNamed(YourPostWidget.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 43.0,
                                                height: 43.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/icYourPost.svg',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Your Posts',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/icRoundForward.svg',
                                                  width: 18.0,
                                                  height: 18.0,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 20.0,
                                            thickness: 1.5,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
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
                                    context.pushNamed(
                                      YourListingWidget.routeName,
                                      queryParameters: {
                                        'hideBackButton': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icYourListing.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Your Listings',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                        ReviewAndRatingsWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icReviewRatings.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Review & Ratings',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                      SaveListingWidget.routeName,
                                      queryParameters: {
                                        'hideBackButton': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icBookmark.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Saved Listings',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 43.0,
                                            height: 43.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/icNotificationStatus.svg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Notification Settings',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Switch.adaptive(
                                            value: _model.switchValue!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .switchValue = newValue);
                                              if (newValue) {
                                                var _shouldSetState = false;
                                                unawaited(
                                                  () async {
                                                    await actions
                                                        .showBaseLoader(
                                                      context,
                                                    );
                                                  }(),
                                                );
                                                _model.notificationOnResponse =
                                                    await HandyFindersAPIsGroup
                                                        .updateNotificationStatusCall
                                                        .call(
                                                  authToken:
                                                      FFAppState().authToken,
                                                  statusKey: 1,
                                                );

                                                _shouldSetState = true;
                                                context.safePop();
                                                if (HandyFindersAPIsGroup
                                                    .updateNotificationStatusCall
                                                    .apiStatus(
                                                  (_model.notificationOnResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        HandyFindersAPIsGroup
                                                            .updateNotificationStatusCall
                                                            .apiMessage(
                                                          (_model.notificationOnResponse
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
                                                  FFAppState()
                                                      .updateUserDetailsAppStateStruct(
                                                    (e) => e
                                                      ..notificationStatus =
                                                          true,
                                                  );
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
                                                            .updateNotificationStatusCall
                                                            .apiMessage(
                                                          (_model.notificationOnResponse
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
                                                  safeSetState(() {
                                                    _model.switchValue = false;
                                                  });
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              } else {
                                                var _shouldSetState = false;
                                                unawaited(
                                                  () async {
                                                    await actions
                                                        .showBaseLoader(
                                                      context,
                                                    );
                                                  }(),
                                                );
                                                _model.notificationOffResponse =
                                                    await HandyFindersAPIsGroup
                                                        .updateNotificationStatusCall
                                                        .call(
                                                  authToken:
                                                      FFAppState().authToken,
                                                  statusKey: 0,
                                                );

                                                _shouldSetState = true;
                                                context.safePop();
                                                if (HandyFindersAPIsGroup
                                                    .updateNotificationStatusCall
                                                    .apiStatus(
                                                  (_model.notificationOffResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        HandyFindersAPIsGroup
                                                            .updateNotificationStatusCall
                                                            .apiMessage(
                                                          (_model.notificationOffResponse
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
                                                  FFAppState()
                                                      .updateUserDetailsAppStateStruct(
                                                    (e) => e
                                                      ..notificationStatus =
                                                          false,
                                                  );
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
                                                            .updateNotificationStatusCall
                                                            .apiMessage(
                                                          (_model.notificationOffResponse
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
                                                  safeSetState(() {
                                                    _model.switchValue = true;
                                                  });
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              }
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20.0,
                                        thickness: 1.5,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    'Other',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: Color(0x80253B3D),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context
                                          .pushNamed(AboutUsWidget.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 43.0,
                                                height: 43.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF24272E),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/icAboutUs.svg',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'About Us',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/icRoundForward.svg',
                                                  width: 18.0,
                                                  height: 18.0,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 20.0,
                                            thickness: 1.5,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
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
                                    context.pushNamed(SupportWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF24272E),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icAccountSupport.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Support',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                        PrivacyPolicyWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF24272E),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icPrivacyPolicy.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Privacy Policy',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                        TermsAndConditionsWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF24272E),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icPrivacyPolicy.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Terms & Conditions',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                        ChangePasswordWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF24272E),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icChangePassword.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Change Password',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    context.pushNamed(
                                        DeleteAccountWidget.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF24272E),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icDeleteAccount.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Delete Account',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icRoundForward.svg',
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 20.0,
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    CustomConfirmationDialogWidget(
                                                  title:
                                                      'Are you sure you want to logout your account?',
                                                  onYesTap: () async {
                                                    var _shouldSetState = false;
                                                    Navigator.pop(context);
                                                    unawaited(
                                                      () async {
                                                        await actions
                                                            .showBaseLoader(
                                                          context,
                                                        );
                                                      }(),
                                                    );
                                                    _model.apiStatus =
                                                        await HandyFindersAPIsGroup
                                                            .logoutCall
                                                            .call(
                                                      deviceType:
                                                          isAndroid == true
                                                              ? 'ANDROID'
                                                              : 'IOS',
                                                      deviceToken: FFAppState()
                                                          .deviceToken,
                                                      authToken: FFAppState()
                                                          .authToken,
                                                    );

                                                    _shouldSetState = true;
                                                    context.pop();
                                                    if ((_model.apiStatus
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
                                                                .logoutCall
                                                                .apiMessage(
                                                              (_model.apiStatus
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
                                                      FFAppState()
                                                              .homeTabPaginationState =
                                                          HomeTabPaginationVariablesStruct();
                                                      FFAppState()
                                                              .profileTabVariablesState =
                                                          ProfileTabVariablesStruct();
                                                      FFAppState()
                                                              .UserCurrentLocationState =
                                                          UserCurrentLocationDetailsStruct();
                                                      FFAppState()
                                                              .ForSaleAppStateVariables =
                                                          ForSaleVariablesStruct();
                                                      FFAppState()
                                                              .userDetailsAppState =
                                                          UserDataTypeStruct();
                                                      FFAppState()
                                                              .notificationStatus =
                                                          false;
                                                      FFAppState()
                                                          .notificationCount = 0;
                                                      FFAppState()
                                                              .isHomePageSearching =
                                                          false;
                                                      FFAppState()
                                                          .requestTabSecondaryLastPage = 0;
                                                      FFAppState()
                                                          .requestTabPrimaryLastPage = 0;
                                                      FFAppState()
                                                          .requestTabSecondaryPageIndex = 0;
                                                      FFAppState()
                                                          .requestTabPrimaryPageIndex = 0;
                                                      FFAppState()
                                                          .userLastName = '';
                                                      FFAppState()
                                                          .userFirstName = '';
                                                      FFAppState().forFreeData =
                                                          null;
                                                      FFAppState().forSaleData =
                                                          null;
                                                      FFAppState()
                                                          .requestTabCompletedList = [];
                                                      FFAppState()
                                                          .requestTabCurrentList = [];
                                                      FFAppState()
                                                          .homeTabCategoriesList = [];
                                                      FFAppState()
                                                          .homeTabPostList = [];
                                                      FFAppState()
                                                          .yourListingServices = [];
                                                      FFAppState()
                                                          .yourListingItems = [];
                                                      FFAppState().userId = '';
                                                      FFAppState()
                                                          .yourPostForumList = [];
                                                      FFAppState()
                                                          .yourTipAdviceList = [];
                                                      FFAppState().userMobile =
                                                          '';
                                                      FFAppState().userDob = '';
                                                      FFAppState()
                                                          .userCountryCode = '';
                                                      FFAppState()
                                                          .isProfileCreated = 0;
                                                      FFAppState()
                                                              .isHomeTabInitialApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isRequestTabPrimaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isRequestTabSecondaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isForSalePrimaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isForSaleSecondaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isMessageTabInitialApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .appStateCategories =
                                                          CategoriesResponseStruct();

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

                                                      return;
                                                    } else if (HandyFindersAPIsGroup
                                                        .logoutCall
                                                        .apiStatus(
                                                      (_model.apiStatus
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
                                                                .logoutCall
                                                                .apiMessage(
                                                              (_model.apiStatus
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
                                                      FFAppState()
                                                              .homeTabPaginationState =
                                                          HomeTabPaginationVariablesStruct();
                                                      FFAppState()
                                                              .profileTabVariablesState =
                                                          ProfileTabVariablesStruct();
                                                      FFAppState()
                                                              .UserCurrentLocationState =
                                                          UserCurrentLocationDetailsStruct();
                                                      FFAppState()
                                                              .ForSaleAppStateVariables =
                                                          ForSaleVariablesStruct();
                                                      FFAppState()
                                                              .userDetailsAppState =
                                                          UserDataTypeStruct();
                                                      FFAppState()
                                                              .notificationStatus =
                                                          false;
                                                      FFAppState()
                                                          .notificationCount = 0;
                                                      FFAppState()
                                                              .isHomePageSearching =
                                                          false;
                                                      FFAppState()
                                                          .requestTabSecondaryLastPage = 0;
                                                      FFAppState()
                                                          .requestTabPrimaryLastPage = 0;
                                                      FFAppState()
                                                          .requestTabSecondaryPageIndex = 0;
                                                      FFAppState()
                                                          .requestTabPrimaryPageIndex = 0;
                                                      FFAppState()
                                                          .userLastName = '';
                                                      FFAppState()
                                                          .userFirstName = '';
                                                      FFAppState().forFreeData =
                                                          null;
                                                      FFAppState().forSaleData =
                                                          null;
                                                      FFAppState()
                                                          .requestTabCompletedList = [];
                                                      FFAppState()
                                                          .requestTabCurrentList = [];
                                                      FFAppState()
                                                          .homeTabCategoriesList = [];
                                                      FFAppState()
                                                          .homeTabPostList = [];
                                                      FFAppState()
                                                          .yourListingServices = [];
                                                      FFAppState()
                                                          .yourListingItems = [];
                                                      FFAppState().userId = '';
                                                      FFAppState()
                                                          .yourPostForumList = [];
                                                      FFAppState()
                                                          .yourTipAdviceList = [];
                                                      FFAppState().userMobile =
                                                          '';
                                                      FFAppState().userDob = '';
                                                      FFAppState()
                                                          .userCountryCode = '';
                                                      FFAppState()
                                                          .isProfileCreated = 0;
                                                      FFAppState()
                                                              .isHomeTabInitialApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isRequestTabPrimaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isRequestTabSecondaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isForSalePrimaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isForSaleSecondaryApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .isMessageTabInitialApiLoaded =
                                                          false;
                                                      FFAppState()
                                                              .appStateCategories =
                                                          CategoriesResponseStruct();

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
                                                                .logoutCall
                                                                .apiMessage(
                                                              (_model.apiStatus
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
                                                      return;
                                                    }
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
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 43.0,
                                                height: 43.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF24272E),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/icLogout.svg',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Logout',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/icRoundForward.svg',
                                                  width: 18.0,
                                                  height: 18.0,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 20.0,
                                            thickness: 1.5,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
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
                      ],
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
}
