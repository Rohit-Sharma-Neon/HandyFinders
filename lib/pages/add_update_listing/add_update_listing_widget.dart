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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_update_listing_model.dart';
export 'add_update_listing_model.dart';

class AddUpdateListingWidget extends StatefulWidget {
  const AddUpdateListingWidget({
    super.key,
    bool? isUpdating,
    this.data,
  }) : this.isUpdating = isUpdating ?? false;

  final bool isUpdating;
  final dynamic data;

  static String routeName = 'AddUpdateListing';
  static String routePath = '/addUpdateListing';

  @override
  State<AddUpdateListingWidget> createState() => _AddUpdateListingWidgetState();
}

class _AddUpdateListingWidgetState extends State<AddUpdateListingWidget> {
  late AddUpdateListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddUpdateListingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.showBaseLoader(
            context,
          );
        }(),
      );
      _model.isApisLoading = true;
      safeSetState(() {});
      _model.getCategoriesResponse =
          await HandyFindersAPIsGroup.getCategoriesListingCall.call(
        authToken: FFAppState().authToken,
      );

      _model.currencyResponse =
          await HandyFindersAPIsGroup.getCurrencyListCall.call(
        authToken: FFAppState().authToken,
      );

      _model.conditionResponse =
          await HandyFindersAPIsGroup.getConditionListCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isApisLoading = false;
      safeSetState(() {});
      context.safePop();

      safeSetState(() {});
      if (widget.isUpdating) {
        safeSetState(() {
          _model.categoryValueController?.value = getJsonField(
            widget.data,
            r'''$.category_id''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.titleTextController?.text = getJsonField(
            widget.data,
            r'''$.title''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.listingTypeValueController?.value = getJsonField(
            widget.data,
            r'''$.type''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.isItemFreeValue = (getJsonField(
                    widget.data,
                    r'''$.is_free''',
                  ) ==
                  1
              ? true
              : false);
        });
        safeSetState(() {
          _model.currencyValueController?.value = _model.currencyValue!;
        });
        safeSetState(() {
          _model.conditionValueController?.value = _model.conditionValue!;
        });
        safeSetState(() {
          _model.priceTextController?.text = (getJsonField(
                    widget.data,
                    r'''$.is_free''',
                  ) ==
                  1
              ? getJsonField(
                  widget.data,
                  r'''$.price''',
                ).toString().toString()
              : '');
        });
        safeSetState(() {
          _model.salePriceTextController?.text = (getJsonField(
                    widget.data,
                    r'''$.is_free''',
                  ) ==
                  1
              ? getJsonField(
                  widget.data,
                  r'''$.sale_price''',
                ).toString().toString()
              : '');
        });
        safeSetState(() {
          _model.descriptionTextController?.text = getJsonField(
            widget.data,
            r'''$.description''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.isNegotiableValue = (getJsonField(
                    widget.data,
                    r'''$.is_negotiable''',
                  ) ==
                  1
              ? true
              : false);
        });
        return;
      } else {
        return;
      }
    });

    _model.titleTextController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.isItemFreeValue = false;
    _model.priceTextController ??= TextEditingController();
    _model.priceFocusNode ??= FocusNode();

    _model.salePriceTextController ??= TextEditingController();
    _model.salePriceFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
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
          alignment: AlignmentDirectional(0.0, 1.0),
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
                        title: widget.isUpdating == true
                            ? 'Update Listing'
                            : 'New Listing',
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
                                      labelText: 'Add Images',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                                        size: 23.0,
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
                                                        size: 23.0,
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
                                                        size: 23.0,
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
                                                        size: 23.0,
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
                                                        size: 23.0,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel2,
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
                                                .categoryValueController ??=
                                            FormFieldController<String>(null),
                                        options: CategoriesResponseStruct
                                                .maybeFromMap((_model
                                                        .getCategoriesResponse
                                                        ?.jsonBody ??
                                                    ''))!
                                            .data
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.categoryValue = val),
                                        width: double.infinity,
                                        height: 55.0,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                0.8,
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
                                        searchHintText: 'Search category',
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
                                    model: _model.textFieldLabelTextModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Title',
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
                                    controller: _model.titleTextController,
                                    focusNode: _model.titleFocusNode,
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
                                    maxLength: 50,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .titleTextControllerValidator
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
                                    model: _model.textFieldLabelTextModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Type',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.listingTypeValueController ??=
                                          FormFieldController<String>(null),
                                  options: ['Item', 'Service'],
                                  onChanged: (val) => safeSetState(
                                      () => _model.listingTypeValue = val),
                                  width: double.infinity,
                                  height: 55.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select type',
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
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'This item is free?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Switch.adaptive(
                                      value: _model.isItemFreeValue!,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.isItemFreeValue = newValue);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor: Color(0xFFC4C4C4),
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (_model.isItemFreeValue ?? false) {
                                    return Container(
                                      width: 1.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    );
                                  } else {
                                    return Visibility(
                                      visible: !_model.isItemFreeValue!,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .textFieldLabelTextModel5,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          TextFieldLabelTextWidget(
                                                        labelText: 'Price',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .textFieldLabelTextModel6,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          TextFieldLabelTextWidget(
                                                        labelText: 'Sale Price',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 18.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .priceTextController,
                                                      focusNode:
                                                          _model.priceFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFF717171),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: '0.00',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .hintTextColor,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            Color(0xFFE7E7E7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    23.0,
                                                                    0.0,
                                                                    23.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLength: 6,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .priceTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '[0-9.]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.4,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .salePriceTextController,
                                                        focusNode: _model
                                                            .salePriceFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0xFF717171),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText: '0.00',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .hintTextColor,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
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
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
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
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              Color(0xFFE7E7E7),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      23.0,
                                                                      0.0,
                                                                      23.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        maxLength: 6,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            const TextInputType
                                                                .numberWithOptions(
                                                                decimal: true),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .salePriceTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9.]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 18.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .isNegotiableValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .isNegotiableValue =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Price is negotiable?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.isItemFreeValue!)
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.textFieldLabelTextModel7,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: TextFieldLabelTextWidget(
                                              labelText: 'Currency',
                                            ),
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: wrapWithModel(
                                          model:
                                              _model.textFieldLabelTextModel8,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldLabelTextWidget(
                                            labelText: 'Condition',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 18.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.isItemFreeValue!)
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isApisLoading) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'No Currency Found!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              );
                                            } else {
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .currencyValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: HandyFindersAPIsGroup
                                                    .getCurrencyListCall
                                                    .apiList(
                                                      (_model.currencyResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.currency_symbol''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .currencyValue = val),
                                                height: 55.0,
                                                maxHeight:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.5,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          letterSpacing: 0.0,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'Select...',
                                                searchHintText: 'Search...',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor: Color(0xFFE7E7E7),
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.isApisLoading) {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'No Condition Found!',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Comfortaa',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            );
                                          } else {
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .conditionValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: ['New', 'Old'],
                                              onChanged: (val) => safeSetState(
                                                  () => _model.conditionValue =
                                                      val),
                                              height: 55.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Select...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor: Color(0xFFE7E7E7),
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 18.0)),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldLabelTextModel9,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFieldLabelTextWidget(
                                      labelText: 'Description',
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
                                        _model.descriptionTextController,
                                    focusNode: _model.descriptionFocusNode,
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
                                    maxLines: 7,
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
                                    validator: _model
                                        .descriptionTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 140.0)),
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
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        -1.5,
                      ),
                      spreadRadius: 3.0,
                    )
                  ],
                ),
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: wrapWithModel(
                    model: _model.baseButtonComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BaseButtonComponentWidget(
                      title: widget.isUpdating ? 'Update' : 'Next',
                      isLoading: false,
                      removeScaffoldPadding: false,
                      passOnTapCallback: () async {
                        var _shouldSetState = false;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if ((_model.uploadedLocalFile1.bytes ?? []).isEmpty) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'First image is mandatory',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          return;
                        }
                        if (_model.listingTypeValue == null) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select type',
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
                          return;
                        }
                        if (() {
                          if (_model.isItemFreeValue!) {
                            return true;
                          } else if (int.parse(
                                  _model.salePriceTextController.text) <
                              int.parse(_model.priceTextController.text)) {
                            return true;
                          } else {
                            return false;
                          }
                        }()) {
                          unawaited(
                            () async {
                              await actions.showBaseLoader(
                                context,
                              );
                            }(),
                          );
                          _model.apiResponse = await HandyFindersAPIsGroup
                              .addItemOrServiceCall
                              .call(
                            authToken: FFAppState().authToken,
                            type: () {
                              if (_model.listingTypeValue == 'Item') {
                                return 'item';
                              } else if (_model.listingTypeValue == 'Service') {
                                return 'service';
                              } else {
                                return '';
                              }
                            }(),
                            categoryId: _model.categoryValue,
                            title: _model.titleTextController.text,
                            isFree: _model.isItemFreeValue == true ? 1 : 0,
                            price: _model.isItemFreeValue!
                                ? ''
                                : _model.priceTextController.text,
                            salePrice: _model.isItemFreeValue!
                                ? ''
                                : _model.salePriceTextController.text,
                            isNegotiable: _model.isNegotiableValue! ? 1 : 0,
                            currency: _model.currencyValue,
                            condition: _model.conditionValue,
                            description: _model.descriptionTextController.text,
                            image1: _model.uploadedLocalFile1,
                            image2: _model.uploadedLocalFile2,
                            image3: _model.uploadedLocalFile3,
                            image4: _model.uploadedLocalFile4,
                            image5: _model.uploadedLocalFile5,
                          );

                          _shouldSetState = true;
                          context.safePop();
                          if (HandyFindersAPIsGroup.addItemOrServiceCall
                              .apiStatus(
                            (_model.apiResponse?.jsonBody ?? ''),
                          )!) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.addItemOrServiceCall
                                      .apiMessage(
                                    (_model.apiResponse?.jsonBody ?? ''),
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
                            context.safePop();
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.addItemOrServiceCall
                                      .apiMessage(
                                    (_model.apiResponse?.jsonBody ?? ''),
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
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Sale price must be less than actual price',
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

                        if (_shouldSetState) safeSetState(() {});
                      },
                    ),
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
