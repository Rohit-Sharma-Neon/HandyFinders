import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'filter_bottom_sheet_model.dart';
export 'filter_bottom_sheet_model.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({
    super.key,
    this.searchedText,
  });

  final String? searchedText;

  @override
  State<FilterBottomSheetWidget> createState() =>
      _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  late FilterBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categoriesResponse =
          await HandyFindersAPIsGroup.getCategoriesListingCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isCategoriesFetching = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.getCategoriesListingCall.apiStatus(
        (_model.categoriesResponse?.jsonBody ?? ''),
      )!) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            HandyFindersAPIsGroup.getCategoriesListingCall.apiMessage(
              (_model.categoriesResponse?.jsonBody ?? ''),
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 17.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                child: Container(
                  width: 60.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Color(0x4C24272E),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Text(
                'Filter',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 5.0),
              child: Text(
                'Cagtegory',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Builder(
              builder: (context) {
                if (_model.isCategoriesFetching) {
                  return Lottie.network(
                    'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
                    width: 584.36,
                    height: 70.0,
                    fit: BoxFit.fitHeight,
                    animate: true,
                  );
                } else if (HandyFindersAPIsGroup.getCategoriesListingCall
                            .apiList(
                          (_model.categoriesResponse?.jsonBody ?? ''),
                        ) !=
                        null &&
                    (HandyFindersAPIsGroup.getCategoriesListingCall.apiList(
                      (_model.categoriesResponse?.jsonBody ?? ''),
                    ))!
                        .isNotEmpty) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      multiSelectController: _model.categoryValueController ??=
                          FormListFieldController<String>(null),
                      options: HandyFindersAPIsGroup.getCategoriesListingCall
                          .apiCategoryName(
                        (_model.categoriesResponse?.jsonBody ?? ''),
                      )!,
                      width: double.infinity,
                      height: 55.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                color: Color(0x7F24272E),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      searchTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Comfortaa',
                                letterSpacing: 0.0,
                              ),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: true,
                      onMultiSelectChanged: (val) =>
                          safeSetState(() => _model.categoryValue = val),
                    ),
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Text(
                        'No Categories Found!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Text(
                'Radius',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: FlutterFlowTheme.of(context).alternate,
                min: 2.0,
                max: 24.0,
                value: _model.sliderValue ??= 2.0,
                label: _model.sliderValue?.toStringAsFixed(2),
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(2));
                  safeSetState(() => _model.sliderValue = newValue);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 26.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2 km',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '24 km',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var _shouldSetState = false;
                          unawaited(
                            () async {
                              await actions.showBaseLoader(
                                context,
                              );
                            }(),
                          );
                          _model.clearedFilterResponse =
                              await HandyFindersAPIsGroup.homePostListCall.call(
                            authToken: FFAppState().authToken,
                            latitude: '28.7041',
                            longitude: '77.1025',
                            search: widget.searchedText,
                          );

                          _shouldSetState = true;
                          context.safePop();
                          Navigator.pop(context);
                          if (HandyFindersAPIsGroup.homePostListCall.apiStatus(
                            (_model.clearedFilterResponse?.jsonBody ?? ''),
                          )!) {
                            FFAppState().homeTabPostList =
                                HandyFindersAPIsGroup.homePostListCall
                                    .apiList(
                                      (_model.clearedFilterResponse?.jsonBody ??
                                          ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                            _model.updatePage(() {});
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  HandyFindersAPIsGroup.homePostListCall
                                      .apiMessage(
                                    (_model.clearedFilterResponse?.jsonBody ??
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

                          if (_shouldSetState) safeSetState(() {});
                        },
                        child: Container(
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDFDFDF),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Clear',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          unawaited(
                            () async {
                              await actions.showBaseLoader(
                                context,
                              );
                            }(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                (List<String> apiCategoryList) {
                                  return apiCategoryList.join(', ');
                                }(_model.categoryValue!.toList()),
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
                          _model.filterResult =
                              await HandyFindersAPIsGroup.homePostListCall.call(
                            authToken: FFAppState().authToken,
                            latitude: '28.7041',
                            longitude: '77.1025',
                            categoryName: (List<String> apiCategoryList) {
                              return apiCategoryList.join(', ');
                            }(_model.categoryValue!.toList()),
                            search: widget.searchedText,
                          );

                          context.safePop();
                          FFAppState().homeTabPostList =
                              HandyFindersAPIsGroup.homePostListCall
                                  .apiList(
                                    (_model.filterResult?.jsonBody ?? ''),
                                  )!
                                  .toList()
                                  .cast<dynamic>();
                          FFAppState().ForSaleAppStateVariables =
                              ForSaleVariablesStruct(
                            selectedCategories: _model.categoryValue,
                          );
                          _model.updatePage(() {});
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        child: Container(
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Apply',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
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
    );
  }
}
