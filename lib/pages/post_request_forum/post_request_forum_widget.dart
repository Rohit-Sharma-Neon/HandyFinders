import '/backend/api_requests/api_calls.dart';
import '/components/add_image_component_widget.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_request_forum_model.dart';
export 'post_request_forum_model.dart';

class PostRequestForumWidget extends StatefulWidget {
  const PostRequestForumWidget({
    super.key,
    bool? isUpdating,
    this.jsonData,
    this.itemIndex,
  }) : this.isUpdating = isUpdating ?? false;

  final bool isUpdating;
  final dynamic jsonData;
  final int? itemIndex;

  static String routeName = 'PostRequestForum';
  static String routePath = '/postRequestForum';

  @override
  State<PostRequestForumWidget> createState() => _PostRequestForumWidgetState();
}

class _PostRequestForumWidgetState extends State<PostRequestForumWidget> {
  late PostRequestForumModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostRequestForumModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.showBaseLoader(
            context,
          );
        }(),
      );
      _model.getCategoriesResponse =
          await HandyFindersAPIsGroup.getCategoriesListingCall.call(
        authToken: FFAppState().authToken,
      );

      context.safePop();
      if (widget.isUpdating) {
        safeSetState(() {
          _model.textController1?.text = getJsonField(
            widget.jsonData,
            r'''$.title''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.textController2?.text = getJsonField(
            widget.jsonData,
            r'''$.description''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.categoryDropDownValueController?.value = getJsonField(
            widget.jsonData,
            r'''$.category_id''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.textController3?.text = getJsonField(
            widget.jsonData,
            r'''$.cost''',
          ).toString().toString();
        });
        return;
      } else {
        safeSetState(() {});
        return;
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
                        title: widget.isUpdating
                            ? 'Update a Request/Forum'
                            : 'Post a Request/Forum',
                        hideBackButton: false,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Request/Forum Title',
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
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF717171),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Enter title here',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
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
                                          FFAppConstants.primaryBorderRadius,
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
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFE7E7E7),
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
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Request/forum description',
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
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF717171),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Write description',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
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
                                          FFAppConstants.primaryBorderRadius,
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
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          FFAppConstants.primaryBorderRadius,
                                          0.0,
                                        )),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFE7E7E7),
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
                                    maxLines: 8,
                                    maxLength: 300,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Category',
                                    ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (HandyFindersAPIsGroup
                                              .getCategoriesListingCall
                                              .apiCategoryName(
                                            (_model.getCategoriesResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (HandyFindersAPIsGroup
                                              .getCategoriesListingCall
                                              .apiCategoryName(
                                        (_model.getCategoriesResponse
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .categoryDropDownValueController ??=
                                            FormFieldController<String>(
                                          _model.categoryDropDownValue ??=
                                              getJsonField(
                                            widget.jsonData,
                                            r'''$.category_id''',
                                          ).toString(),
                                        ),
                                        options: CategoriesResponseStruct
                                                .maybeFromMap((_model
                                                        .getCategoriesResponse
                                                        ?.jsonBody ??
                                                    ''))!
                                            .data
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.categoryDropDownValue = val),
                                        width: double.infinity,
                                        height: 55.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0x7F24272E),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  letterSpacing: 0.0,
                                                ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Select category',
                                        searchHintText: 'Search categories',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Color(0x8024272E),
                                          size: 24.0,
                                        ),
                                        fillColor: Color(0xFFE7E7E7),
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'No Categories Found!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Preferred Cost',
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController3,
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: false,
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
                                          hintText: 'Enter cost',
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
                                          fillColor: Color(0xFFE7E7E7),
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
                                        maxLength: 5,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textController3Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9.]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 17.0, 11.5, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/icDollar.svg',
                                        width: 23.0,
                                        height: 23.0,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Add Images',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 120.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile1.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile1
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading1 =
                                                          false;
                                                      _model.uploadedLocalFile1 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else if (getJsonField(
                                              widget.jsonData,
                                              r'''$.images[0].image''',
                                            ) !=
                                            null) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.baseImageUrl}${getJsonField(
                                                    widget.jsonData,
                                                    r'''$.images[0].image''',
                                                  ).toString()}',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading1 =
                                                          false;
                                                      _model.uploadedLocalFile1 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 33.0,
                                                    height: 33.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 40,
                                                allowPhoto: true,
                                                pickerFontFamily: 'Inter',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading1 = true);
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
                                                  _model.isDataUploading1 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile1 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: custom_widgets
                                                  .DashedContainer(
                                                width: 60.0,
                                                height: 60.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWeight: 1.0,
                                                borderRadius: 8.0,
                                                borderSpacing: 5.0,
                                                innerContainer: () =>
                                                    AddImageComponentWidget(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile2
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading2 =
                                                          false;
                                                      _model.uploadedLocalFile2 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 40,
                                                allowPhoto: true,
                                                pickerFontFamily: 'Inter',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading2 = true);
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
                                                  _model.isDataUploading2 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile2 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: custom_widgets
                                                  .DashedContainer(
                                                width: 60.0,
                                                height: 60.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWeight: 1.0,
                                                borderRadius: 8.0,
                                                borderSpacing: 5.0,
                                                innerContainer: () =>
                                                    AddImageComponentWidget(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile3.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile3
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading3 =
                                                          false;
                                                      _model.uploadedLocalFile3 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 40,
                                                allowPhoto: true,
                                                pickerFontFamily: 'Inter',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading3 = true);
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
                                                  _model.isDataUploading3 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile3 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: custom_widgets
                                                  .DashedContainer(
                                                width: 60.0,
                                                height: 60.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWeight: 1.0,
                                                borderRadius: 8.0,
                                                borderSpacing: 5.0,
                                                innerContainer: () =>
                                                    AddImageComponentWidget(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile4.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile4
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading4 =
                                                          false;
                                                      _model.uploadedLocalFile4 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 40,
                                                allowPhoto: true,
                                                pickerFontFamily: 'Inter',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading4 = true);
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
                                                  _model.isDataUploading4 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile4 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: custom_widgets
                                                  .DashedContainer(
                                                width: 60.0,
                                                height: 60.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWeight: 1.0,
                                                borderRadius: 8.0,
                                                borderSpacing: 5.0,
                                                innerContainer: () =>
                                                    AddImageComponentWidget(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile5.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(2.0, -2.0),
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile5
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    safeSetState(() {
                                                      _model.isDataUploading5 =
                                                          false;
                                                      _model.uploadedLocalFile5 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList(
                                                                      []));
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 40,
                                                allowPhoto: true,
                                                pickerFontFamily: 'Inter',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading5 = true);
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
                                                  _model.isDataUploading5 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile5 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: custom_widgets
                                                  .DashedContainer(
                                                width: 60.0,
                                                height: 60.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWeight: 1.0,
                                                borderRadius: 8.0,
                                                borderSpacing: 5.0,
                                                innerContainer: () =>
                                                    AddImageComponentWidget(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: wrapWithModel(
                  model: _model.baseButtonComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BaseButtonComponentWidget(
                    title:
                        widget.isUpdating ? 'Update Request' : 'Post Request',
                    isLoading: false,
                    removeScaffoldPadding: false,
                    passOnTapCallback: () async {
                      var _shouldSetState = false;
                      _model.validationResult = true;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        safeSetState(() => _model.validationResult = false);
                        return;
                      }
                      if (_model.categoryDropDownValue == null) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please select category',
                              style: GoogleFonts.getFont(
                                'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        _model.validationResult = false;
                        safeSetState(() {});
                        return;
                      }
                      _shouldSetState = true;
                      if (_model.categoryDropDownValue != null &&
                          _model.categoryDropDownValue != '') {
                        unawaited(
                          () async {
                            await actions.showBaseLoader(
                              context,
                            );
                          }(),
                        );
                        _model.addRequestTipResponse =
                            await HandyFindersAPIsGroup.addUpdateRequestTipCall
                                .call(
                          authToken: FFAppState().authToken,
                          title: _model.textController1.text,
                          type: 'request',
                          categoryId: _model.categoryDropDownValue,
                          description: _model.textController2.text,
                          cost: _model.textController3.text,
                          image1: _model.uploadedLocalFile1,
                          image2: _model.uploadedLocalFile2,
                          image3: _model.uploadedLocalFile3,
                          image4: _model.uploadedLocalFile4,
                          image5: _model.uploadedLocalFile5,
                          postId: widget.isUpdating
                              ? getJsonField(
                                  widget.jsonData,
                                  r'''$.id''',
                                ).toString()
                              : '',
                        );

                        _shouldSetState = true;
                        context.safePop();
                        if (HandyFindersAPIsGroup.addUpdateRequestTipCall
                            .apiStatus(
                          (_model.addRequestTipResponse?.jsonBody ?? ''),
                        )!) {
                          if (widget.isUpdating) {
                            FFAppState().updateYourPostForumListAtIndex(
                              widget.itemIndex!,
                              (_) => getJsonField(
                                (_model.addRequestTipResponse?.jsonBody ?? ''),
                                r'''$.data1''',
                              ),
                            );
                            FFAppState().update(() {});
                            context.safePop();
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            context.safePop();
                            context.safePop();
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                HandyFindersAPIsGroup.addUpdateRequestTipCall
                                    .apiMessage(
                                  (_model.addRequestTipResponse?.jsonBody ??
                                      ''),
                                )!,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please select category',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
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
