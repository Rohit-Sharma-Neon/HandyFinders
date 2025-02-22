import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'Notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isFetchingApi = true;
      safeSetState(() {});
      _model.getNotificationsList =
          await HandyFindersAPIsGroup.notificationListCall.call(
        authToken: FFAppState().authToken,
        page: '1',
      );

      _model.isFetchingApi = false;
      _model.notificationListData = NotificationListDataTypeStruct.maybeFromMap(
              (_model.getNotificationsList?.jsonBody ?? ''))!
          .notificationList
          .data
          .toList()
          .cast<NotificationDataStruct>();
      safeSetState(() {});
      if ((_model.getNotificationsList?.statusCode ?? 200) == 201) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              NotificationListDataTypeStruct.maybeFromMap(
                      (_model.getNotificationsList?.jsonBody ?? ''))!
                  .message,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        FFAppState().authToken = '';
        FFAppState().deviceToken = 'dummydevicetoken';
        FFAppState().deviceUniqueId = 'dummyuniqueid';
        FFAppState().userProfileImageUrl = '';
        FFAppState().userName = '';
        FFAppState().userEmail = '';
        FFAppState().userMobile = '';
        FFAppState().userDob = '';
        FFAppState().userCountryCode = '';

        context.goNamed(
          LoginWidget.routeName,
          queryParameters: {
            'showBackButton': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        return;
      } else {
        if (NotificationListDataTypeStruct.maybeFromMap(
                (_model.getNotificationsList?.jsonBody ?? ''))!
            .status) {
          safeSetState(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                NotificationListDataTypeStruct.maybeFromMap(
                        (_model.getNotificationsList?.jsonBody ?? ''))!
                    .message,
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
              wrapWithModel(
                model: _model.icBackTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: IcBackTitleWidget(
                  title: 'Notifications',
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.isFetchingApi) {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Lottie.network(
                            'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ),
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          if (NotificationListDataTypeStruct.maybeFromMap(
                                          (_model.getNotificationsList
                                                  ?.jsonBody ??
                                              ''))
                                      ?.notificationList
                                      .data !=
                                  null &&
                              (NotificationListDataTypeStruct.maybeFromMap(
                                          (_model.getNotificationsList
                                                  ?.jsonBody ??
                                              ''))
                                      ?.notificationList
                                      .data)!
                                  .isNotEmpty) {
                            return RefreshIndicator(
                              key: Key('RefreshIndicator_wdkevz1z'),
                              onRefresh: () async {
                                _model.pageIndex = 1;
                                _model.isFetchingApi = true;
                                safeSetState(() {});
                                _model.getNotificationsListResponse =
                                    await HandyFindersAPIsGroup
                                        .notificationListCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  page: '1',
                                );

                                _model.isFetchingApi = false;
                                _model.notificationListData =
                                    NotificationListDataTypeStruct.maybeFromMap(
                                            (_model.getNotificationsList
                                                    ?.jsonBody ??
                                                ''))!
                                        .notificationList
                                        .data
                                        .toList()
                                        .cast<NotificationDataStruct>();
                                safeSetState(() {});
                                if ((_model.getNotificationsListResponse
                                            ?.statusCode ??
                                        200) ==
                                    201) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        NotificationListDataTypeStruct
                                                .maybeFromMap((_model
                                                        .getNotificationsListResponse
                                                        ?.jsonBody ??
                                                    ''))!
                                            .message,
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
                                  FFAppState().authToken = '';
                                  FFAppState().deviceToken = 'dummydevicetoken';
                                  FFAppState().deviceUniqueId = 'dummyuniqueid';
                                  FFAppState().userProfileImageUrl = '';
                                  FFAppState().userName = '';
                                  FFAppState().userEmail = '';
                                  FFAppState().userMobile = '';
                                  FFAppState().userDob = '';
                                  FFAppState().userCountryCode = '';

                                  context.goNamed(
                                    LoginWidget.routeName,
                                    queryParameters: {
                                      'showBackButton': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );

                                  return;
                                } else {
                                  if (NotificationListDataTypeStruct
                                          .maybeFromMap((_model
                                                  .getNotificationsListResponse
                                                  ?.jsonBody ??
                                              ''))!
                                      .status) {
                                    _model.pageIndex = 2;
                                    safeSetState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          NotificationListDataTypeStruct
                                                  .maybeFromMap((_model
                                                          .getNotificationsListResponse
                                                          ?.jsonBody ??
                                                      ''))!
                                              .message,
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
                                }
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final pageStateNotifications = _model
                                              .notificationListData
                                              .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                pageStateNotifications.length,
                                            itemBuilder: (context,
                                                pageStateNotificationsIndex) {
                                              final pageStateNotificationsItem =
                                                  pageStateNotifications[
                                                      pageStateNotificationsIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/icAlert.svg',
                                                        width: 20.0,
                                                        height: 20.0,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                pageStateNotificationsItem
                                                                    .title,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF24272E),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              functions.getTimeAgo(
                                                                  pageStateNotificationsItem
                                                                      .createdAt),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0xFF7D8392),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      1.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            pageStateNotificationsItem
                                                                .message,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xBF24272E),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 25.0,
                                                          thickness: 1.5,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.pageIndex <=
                                            NotificationListDataTypeStruct
                                                    .maybeFromMap((_model
                                                            .getNotificationsList
                                                            ?.jsonBody ??
                                                        ''))!
                                                .notificationList
                                                .lastPage) {
                                          return wrapWithModel(
                                            model:
                                                _model.baseButtonComponentModel,
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
                                                if (_model.pageIndex <=
                                                    NotificationListDataTypeStruct
                                                            .maybeFromMap((_model
                                                                    .getNotificationsList
                                                                    ?.jsonBody ??
                                                                ''))!
                                                        .notificationList
                                                        .lastPage) {
                                                  _model.isLoadingMore = true;
                                                  safeSetState(() {});
                                                  _model.loadedNotificationsResponse =
                                                      await HandyFindersAPIsGroup
                                                          .notificationListCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    page: _model.pageIndex
                                                        .toString(),
                                                  );

                                                  _shouldSetState = true;
                                                  if (NotificationListDataTypeStruct
                                                          .maybeFromMap((_model
                                                                  .loadedNotificationsResponse
                                                                  ?.jsonBody ??
                                                              ''))!
                                                      .status) {
                                                    _model.returnedList =
                                                        await actions
                                                            .addNotificationListData(
                                                      _model
                                                          .notificationListData
                                                          .toList(),
                                                      NotificationListDataTypeStruct
                                                              .maybeFromMap((_model
                                                                      .loadedNotificationsResponse
                                                                      ?.jsonBody ??
                                                                  ''))!
                                                          .notificationList
                                                          .data
                                                          .toList(),
                                                    );
                                                    _shouldSetState = true;
                                                    _model.notificationListData =
                                                        _model.returnedList!
                                                            .toList()
                                                            .cast<
                                                                NotificationDataStruct>();
                                                    _model.isLoadingMore =
                                                        false;
                                                    _model.pageIndex =
                                                        _model.pageIndex + 1;
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
                                                          NotificationListDataTypeStruct
                                                                  .maybeFromMap((_model
                                                                          .loadedNotificationsResponse
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .notificationList
                                                              .currentPage
                                                              .toString(),
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
                                                } else {
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 25.0),
                                            child: Text(
                                              'No More Data!',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'No Notification Found!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            );
                          }
                        },
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
