import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'create_update_profile_model.dart';
export 'create_update_profile_model.dart';

class CreateUpdateProfileWidget extends StatefulWidget {
  const CreateUpdateProfileWidget({
    super.key,
    bool? isUpdating,
    this.authToken,
    this.userEmail,
    bool? hideBackButton,
  })  : this.isUpdating = isUpdating ?? false,
        this.hideBackButton = hideBackButton ?? false;

  final bool isUpdating;
  final String? authToken;
  final String? userEmail;
  final bool hideBackButton;

  static String routeName = 'CreateUpdateProfile';
  static String routePath = '/createUpdateProfile';

  @override
  State<CreateUpdateProfileWidget> createState() =>
      _CreateUpdateProfileWidgetState();
}

class _CreateUpdateProfileWidgetState extends State<CreateUpdateProfileWidget> {
  late CreateUpdateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUpdateProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isUpdating) {
        _model.isFetchingProfileApi = true;
        safeSetState(() {});
        _model.getProfileApiStatus =
            await HandyFindersAPIsGroup.getProfileCall.call(
          authToken: FFAppState().authToken,
        );

        _model.isFetchingProfileApi = false;
        safeSetState(() {});
        if ((_model.getProfileApiStatus?.statusCode ?? 200) ==
            FFAppConstants.apiStatus201) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                HandyFindersAPIsGroup.getProfileCall.apiMessage(
                  (_model.getProfileApiStatus?.jsonBody ?? ''),
                )!,
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
          FFAppState().IsRememberMe = true;
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
        } else if (HandyFindersAPIsGroup.getProfileCall.apiStatus(
          (_model.getProfileApiStatus?.jsonBody ?? ''),
        )!) {
          safeSetState(() {
            _model.userNameFieldTextController?.text =
                HandyFindersAPIsGroup.getProfileCall.apiUserName(
              (_model.getProfileApiStatus?.jsonBody ?? ''),
            )!;
          });
          safeSetState(() {
            _model.userMobileFieldTextController?.text =
                HandyFindersAPIsGroup.getProfileCall.apiMobile(
              (_model.getProfileApiStatus?.jsonBody ?? ''),
            )!;
          });
          safeSetState(() {
            _model.userEmailFieldTextController?.text =
                HandyFindersAPIsGroup.getProfileCall.apiEmail(
              (_model.getProfileApiStatus?.jsonBody ?? ''),
            )!;
          });
          safeSetState(() {
            _model.dropDownValueController?.value =
                HandyFindersAPIsGroup.getProfileCall.apiCountryCode(
              (_model.getProfileApiStatus?.jsonBody ?? ''),
            )!;
          });
          safeSetState(() {
            _model.firstNameFieldTextController?.text = valueOrDefault<String>(
              HandyFindersAPIsGroup.getProfileCall.apiFirstName(
                (_model.getProfileApiStatus?.jsonBody ?? ''),
              ),
              'null',
            );
          });
          safeSetState(() {
            _model.lastNameFieldTextController?.text = valueOrDefault<String>(
              HandyFindersAPIsGroup.getProfileCall.apiLastName(
                (_model.getProfileApiStatus?.jsonBody ?? ''),
              ),
              'null',
            );
          });
          FFAppState().userName =
              HandyFindersAPIsGroup.getProfileCall.apiUserName(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          null &&
                      HandyFindersAPIsGroup.getProfileCall.apiUserName(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          ''
                  ? HandyFindersAPIsGroup.getProfileCall.apiUserName(
                      (_model.getProfileApiStatus?.jsonBody ?? ''),
                    )!
                  : '';
          FFAppState().userEmail =
              HandyFindersAPIsGroup.getProfileCall.apiEmail(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          null &&
                      HandyFindersAPIsGroup.getProfileCall.apiEmail(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          ''
                  ? HandyFindersAPIsGroup.getProfileCall.apiEmail(
                      (_model.getProfileApiStatus?.jsonBody ?? ''),
                    )!
                  : '';
          FFAppState().userProfileImageUrl =
              HandyFindersAPIsGroup.getProfileCall.apiProfilePictureUrl(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          null &&
                      HandyFindersAPIsGroup.getProfileCall.apiProfilePictureUrl(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          ''
                  ? HandyFindersAPIsGroup.getProfileCall.apiProfilePictureUrl(
                      (_model.getProfileApiStatus?.jsonBody ?? ''),
                    )!
                  : '';
          FFAppState().userMobile =
              HandyFindersAPIsGroup.getProfileCall.apiMobile(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          null &&
                      HandyFindersAPIsGroup.getProfileCall.apiMobile(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          ''
                  ? HandyFindersAPIsGroup.getProfileCall.apiMobile(
                      (_model.getProfileApiStatus?.jsonBody ?? ''),
                    )!
                  : '';
          FFAppState().userDob = HandyFindersAPIsGroup.getProfileCall.apiDob(
                        (_model.getProfileApiStatus?.jsonBody ?? ''),
                      ) !=
                      null &&
                  HandyFindersAPIsGroup.getProfileCall.apiDob(
                        (_model.getProfileApiStatus?.jsonBody ?? ''),
                      ) !=
                      ''
              ? HandyFindersAPIsGroup.getProfileCall.apiDob(
                  (_model.getProfileApiStatus?.jsonBody ?? ''),
                )!
              : '';
          FFAppState().userCountryCode =
              HandyFindersAPIsGroup.getProfileCall.apiCountryCode(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          null &&
                      HandyFindersAPIsGroup.getProfileCall.apiCountryCode(
                            (_model.getProfileApiStatus?.jsonBody ?? ''),
                          ) !=
                          ''
                  ? HandyFindersAPIsGroup.getProfileCall.apiCountryCode(
                      (_model.getProfileApiStatus?.jsonBody ?? ''),
                    )!
                  : '';
          FFAppState().notificationStatus =
              (HandyFindersAPIsGroup.getProfileCall.apiNotificationStatus(
                    (_model.getProfileApiStatus?.jsonBody ?? ''),
                  )!) ==
                  1;
          FFAppState().userFirstName =
              HandyFindersAPIsGroup.getProfileCall.apiFirstName(
            (_model.getProfileApiStatus?.jsonBody ?? ''),
          )!;
          FFAppState().userLastName =
              HandyFindersAPIsGroup.getProfileCall.apiLastName(
            (_model.getProfileApiStatus?.jsonBody ?? ''),
          )!;
          FFAppState().update(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                HandyFindersAPIsGroup.getProfileCall.apiMessage(
                  (_model.getProfileApiStatus?.jsonBody ?? ''),
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
      } else {
        await requestPermission(notificationsPermission);
        return;
      }
    });

    _model.firstNameFieldTextController ??= TextEditingController();
    _model.firstNameFieldFocusNode ??= FocusNode();

    _model.lastNameFieldTextController ??= TextEditingController();
    _model.lastNameFieldFocusNode ??= FocusNode();

    _model.userNameFieldTextController ??= TextEditingController();
    _model.userNameFieldFocusNode ??= FocusNode();

    _model.userMobileFieldTextController ??= TextEditingController(
        text: HandyFindersAPIsGroup.getProfileCall.apiMobile(
      (_model.getProfileApiStatus?.jsonBody ?? ''),
    ));
    _model.userMobileFieldFocusNode ??= FocusNode();

    _model.userEmailFieldTextController ??= TextEditingController();
    _model.userEmailFieldFocusNode ??= FocusNode();
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
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
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
                        title: valueOrDefault<String>(
                          widget.isUpdating
                              ? 'Update Profile'
                              : 'Create Profile',
                          'Create Profile',
                        ),
                        hideBackButton: widget.hideBackButton,
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (_model.isFetchingProfileApi) {
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
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 34.0, 0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 120.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if ((_model
                                                                .uploadedLocalFile
                                                                .bytes
                                                                ?.isNotEmpty ??
                                                            false)
                                                    ? true
                                                    : false) {
                                                  return Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(6.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEAEAEA),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          99.0),
                                                              child:
                                                                  Image.memory(
                                                                _model.uploadedLocalFile
                                                                        .bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                width: 120.0,
                                                                height: 120.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
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
                                                            safeSetState(() {
                                                              _model.isDataUploading =
                                                                  false;
                                                              _model.uploadedLocalFile =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 42.0,
                                                            height: 42.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (HandyFindersAPIsGroup
                                                            .getProfileCall
                                                            .apiProfilePictureUrl(
                                                          (_model.getProfileApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    HandyFindersAPIsGroup
                                                            .getProfileCall
                                                            .apiProfilePictureUrl(
                                                          (_model.getProfileApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        '') {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEAEAEA),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      99.0),
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
                                                                '${FFAppConstants.baseImageUrl}${HandyFindersAPIsGroup.getProfileCall.apiProfilePictureUrl(
                                                              (_model.getProfileApiStatus
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}',
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.fill,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEAEAEA),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/icPerson.svg',
                                                            fit: BoxFit.fill,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF24272E),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              imageQuality: 20,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 7.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/icEdit.svg',
                                                    width: 20.0,
                                                    height: 20.0,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                widget.isUpdating
                                                    ? 'Update Photo'
                                                    : 'Add Photo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .textFieldLabelTextModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TextFieldLabelTextWidget(
                                                labelText: 'First Name',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .textFieldLabelTextModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TextFieldLabelTextWidget(
                                                labelText: 'Last Name',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                  .firstNameFieldTextController,
                                              focusNode: _model
                                                  .firstNameFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF717171),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'First Name',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .hintTextColor,
                                                          fontSize: 14.0,
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
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textFieldFillColor,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 23.0,
                                                            0.0, 23.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 30,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType: TextInputType.name,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .firstNameFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                  .lastNameFieldTextController,
                                              focusNode:
                                                  _model.lastNameFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF717171),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'Last Name',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .hintTextColor,
                                                          fontSize: 14.0,
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
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants
                                                        .primaryBorderRadius,
                                                    0.0,
                                                  )),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textFieldFillColor,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 23.0,
                                                            0.0, 23.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 30,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType: TextInputType.name,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .lastNameFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 13.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.textFieldLabelTextModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextFieldLabelTextWidget(
                                          labelText: 'Username',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.userNameFieldTextController,
                                        focusNode:
                                            _model.userNameFieldFocusNode,
                                        autofocus: false,
                                        readOnly: widget.isUpdating == true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF717171),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Enter your username',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .hintTextColor,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              FFAppConstants
                                                  .primaryBorderRadius,
                                              0.0,
                                            )),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              FFAppConstants
                                                  .primaryBorderRadius,
                                              0.0,
                                            )),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              FFAppConstants
                                                  .primaryBorderRadius,
                                              0.0,
                                            )),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              FFAppConstants
                                                  .primaryBorderRadius,
                                              0.0,
                                            )),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .textFieldFillColor,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 23.0, 0.0, 23.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 30,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .userNameFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 13.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.textFieldLabelTextModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextFieldLabelTextWidget(
                                          labelText: 'Phone No.',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.primaryBorderRadius,
                                        0.0,
                                      )),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<String>(
                                            _model.dropDownValue ??=
                                                HandyFindersAPIsGroup
                                                                .getProfileCall
                                                                .apiCountryCode(
                                                              (_model.getProfileApiStatus
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            null &&
                                                        HandyFindersAPIsGroup
                                                                .getProfileCall
                                                                .apiCountryCode(
                                                              (_model.getProfileApiStatus
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            ''
                                                    ? HandyFindersAPIsGroup
                                                        .getProfileCall
                                                        .apiCountryCode(
                                                        (_model.getProfileApiStatus
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                    : '+1',
                                          ),
                                          options: ['+1'],
                                          onChanged: (val) => safeSetState(
                                              () => _model.dropDownValue = val),
                                          width: 80.0,
                                          height: 52.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          hintText: '+',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        SizedBox(
                                          height: 25.0,
                                          child: VerticalDivider(
                                            thickness: 1.0,
                                            color: Color(0xFFB5B5B5),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 215.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .userMobileFieldTextController,
                                                focusNode: _model
                                                    .userMobileFieldFocusNode,
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
                                                  hintText: 'Enter mobile no.',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .hintTextColor,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFAppConstants
                                                            .primaryBorderRadius,
                                                        0.0,
                                                      )),
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 20.0,
                                                              20.0, 20.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textAlign: TextAlign.start,
                                                maxLength: 15,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.phone,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .userMobileFieldTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.isMobileEntered) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'h',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0x00FFFFFF),
                                                        fontSize: 0.1,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    22.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              'Mobile no. length must be between 7 - 15',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFFD3302F),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  if (widget.isUpdating)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 13.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model:
                                              _model.textFieldLabelTextModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldLabelTextWidget(
                                            labelText: 'Email',
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.isUpdating)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .userEmailFieldTextController,
                                          focusNode:
                                              _model.userEmailFieldFocusNode,
                                          autofocus: false,
                                          readOnly: FFAppState().userEmail != ''
                                              ? true
                                              : false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Color(0xFF717171),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: HandyFindersAPIsGroup
                                                            .getProfileCall
                                                            .apiEmail(
                                                          (_model.getProfileApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    HandyFindersAPIsGroup
                                                            .getProfileCall
                                                            .apiEmail(
                                                          (_model.getProfileApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        ''
                                                ? HandyFindersAPIsGroup
                                                    .getProfileCall
                                                    .apiEmail(
                                                    (_model.getProfileApiStatus
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                : 'Email',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .hintTextColor,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants
                                                    .primaryBorderRadius,
                                                0.0,
                                              )),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants
                                                    .primaryBorderRadius,
                                                0.0,
                                              )),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants
                                                    .primaryBorderRadius,
                                                0.0,
                                              )),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      valueOrDefault<double>(
                                                FFAppConstants
                                                    .primaryBorderRadius,
                                                0.0,
                                              )),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFEAEAEA),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 23.0, 0.0, 23.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          maxLength: 30,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .userEmailFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 110.0),
                                    child: Container(
                                      width: 1.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                  ),
                                ],
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.primaryButtonBottomPadding,
                      0.0,
                    )),
                child: wrapWithModel(
                  model: _model.baseButtonComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BaseButtonComponentWidget(
                    title: widget.isUpdating ? 'Update' : 'Continue',
                    passOnTapCallback: () async {
                      var _shouldSetState = false;
                      if ((_model.userMobileFieldTextController.text !=
                                  '') &&
                          (_model.userMobileFieldTextController.text.length >
                                  6 &&
                              _model.userMobileFieldTextController.text.length <
                                  16)) {
                        _model.isMobileEntered = true;
                        safeSetState(() {});
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        unawaited(
                          () async {
                            await actions.showBaseLoader(
                              context,
                            );
                          }(),
                        );
                        _model.createUpdateProfileResponse =
                            await HandyFindersAPIsGroup.createUpdateProfileCall
                                .call(
                          userName: _model.userNameFieldTextController.text,
                          phoneNumber:
                              _model.userMobileFieldTextController.text,
                          countryCode: _model.dropDownValue,
                          profilePicture: _model.uploadedLocalFile,
                          authToken: widget.isUpdating == true
                              ? FFAppState().authToken
                              : widget.authToken,
                          firstName: _model.firstNameFieldTextController.text,
                          lastName: _model.lastNameFieldTextController.text,
                        );

                        _shouldSetState = true;
                        FFAppState().userName = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiUserName(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall
                                        .apiUserName(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall.apiUserName(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().userEmail = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiEmail(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall.apiEmail(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall.apiEmail(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().userProfileImageUrl = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiProfilePictureUrl(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall
                                        .apiProfilePictureUrl(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall
                                .apiProfilePictureUrl(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().userMobile = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiMobile(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall.apiMobile(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall.apiMobile(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().userDob = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiDob(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall.apiDob(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall.apiDob(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().userCountryCode = HandyFindersAPIsGroup
                                        .getProfileCall
                                        .apiCountryCode(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                HandyFindersAPIsGroup.getProfileCall
                                        .apiCountryCode(
                                      (_model.getProfileApiStatus?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''
                            ? HandyFindersAPIsGroup.getProfileCall
                                .apiCountryCode(
                                (_model.getProfileApiStatus?.jsonBody ?? ''),
                              )!
                            : '';
                        FFAppState().update(() {});
                        context.safePop();
                        if ((_model.createUpdateProfileResponse?.statusCode ??
                                200) ==
                            FFAppConstants.apiStatus201) {
                          FFAppState().userEmail = '';
                          FFAppState().userName = '';
                          FFAppState().userProfileImageUrl = '';
                          FFAppState().deviceToken = 'dummydevicetoken';
                          FFAppState().deviceUniqueId = 'dummyuniqueid';
                          FFAppState().userMobile = '';
                          FFAppState().userDob = '';
                          if (widget.isUpdating) {
                            context.goNamed(
                              LoginWidget.routeName,
                              queryParameters: {
                                'showBackButton': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.getProfileCall
                                      .apiMessage(
                                    (_model.getProfileApiStatus?.jsonBody ??
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
                          if (HandyFindersAPIsGroup.createUpdateProfileCall
                              .apiStatus(
                            (_model.createUpdateProfileResponse?.jsonBody ??
                                ''),
                          )!) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.createUpdateProfileCall
                                      .apiMessage(
                                    (_model.createUpdateProfileResponse
                                            ?.jsonBody ??
                                        ''),
                                  )!,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    color: Colors.black,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .successSnackBar,
                              ),
                            );
                            if (widget.isUpdating) {
                              FFAppState().userEmail = HandyFindersAPIsGroup
                                  .createUpdateProfileCall
                                  .apiEmail(
                                (_model.createUpdateProfileResponse?.jsonBody ??
                                    ''),
                              )!;
                              FFAppState().userName = HandyFindersAPIsGroup
                                  .createUpdateProfileCall
                                  .apiUserName(
                                (_model.createUpdateProfileResponse?.jsonBody ??
                                    ''),
                              )!;
                              FFAppState().userProfileImageUrl =
                                  HandyFindersAPIsGroup.createUpdateProfileCall
                                                  .apiProfilePicture(
                                                (_model.createUpdateProfileResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          HandyFindersAPIsGroup
                                                  .createUpdateProfileCall
                                                  .apiProfilePicture(
                                                (_model.createUpdateProfileResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? HandyFindersAPIsGroup
                                          .createUpdateProfileCall
                                          .apiProfilePicture(
                                          (_model.createUpdateProfileResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                      : '';
                              FFAppState().userFirstName =
                                  (_model.firstNameFieldFocusNode?.hasFocus ??
                                          false)
                                      .toString();
                              FFAppState().userLastName =
                                  _model.lastNameFieldTextController.text;
                              FFAppState().update(() {});
                              context.safePop();
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              FFAppState().userEmail = HandyFindersAPIsGroup
                                  .createUpdateProfileCall
                                  .apiEmail(
                                (_model.createUpdateProfileResponse?.jsonBody ??
                                    ''),
                              )!;
                              FFAppState().userName = HandyFindersAPIsGroup
                                  .createUpdateProfileCall
                                  .apiUserName(
                                (_model.createUpdateProfileResponse?.jsonBody ??
                                    ''),
                              )!;
                              FFAppState().userProfileImageUrl =
                                  HandyFindersAPIsGroup.createUpdateProfileCall
                                                  .apiProfilePicture(
                                                (_model.createUpdateProfileResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          HandyFindersAPIsGroup
                                                  .createUpdateProfileCall
                                                  .apiProfilePicture(
                                                (_model.createUpdateProfileResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                      ? getJsonField(
                                          (_model.createUpdateProfileResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.profile_picture''',
                                        ).toString()
                                      : '';
                              FFAppState().IsRememberMe = true;
                              FFAppState().authToken = widget.authToken!;
                              FFAppState().isProfileCreated = 1;
                              FFAppState().userId = getJsonField(
                                (_model.createUpdateProfileResponse?.jsonBody ??
                                    ''),
                                r'''$.data.id''',
                              ).toString();
                              FFAppState().userFirstName =
                                  _model.firstNameFieldTextController.text;
                              FFAppState().userLastName =
                                  _model.lastNameFieldTextController.text;
                              safeSetState(() {});

                              context.goNamed(AllowLocationWidget.routeName);

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.createUpdateProfileCall
                                      .apiMessage(
                                    (_model.createUpdateProfileResponse
                                            ?.jsonBody ??
                                        ''),
                                  )!,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).errorSnackBar,
                              ),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        }
                      } else {
                        _model.isMobileEntered = false;
                        safeSetState(() {});
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
