import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  static String routeName = 'Categories';
  static String routePath = '/categories';

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late CategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initialApiResponse =
          await HandyFindersAPIsGroup.homeCategoriesCall.call(
        authToken: FFAppState().authToken,
      );

      _model.isInitialCategoriesLoading = false;
      safeSetState(() {});
      if (HandyFindersAPIsGroup.homeCategoriesCall.apiStatus(
        (_model.initialApiResponse?.jsonBody ?? ''),
      )!) {
        _model.categoriesJsonList = HandyFindersAPIsGroup.homeCategoriesCall
            .apiList(
              (_model.initialApiResponse?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        return;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              HandyFindersAPIsGroup.homeCategoriesCall.apiMessage(
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
                  title: 'Categories',
                  hideBackButton: false,
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _model.refreshedApiResponse =
                        await HandyFindersAPIsGroup.homeCategoriesCall.call(
                      authToken: FFAppState().authToken,
                    );

                    if (HandyFindersAPIsGroup.homeCategoriesCall.apiStatus(
                      (_model.refreshedApiResponse?.jsonBody ?? ''),
                    )!) {
                      _model.categoriesJsonList =
                          HandyFindersAPIsGroup.homeCategoriesCall
                              .apiList(
                                (_model.refreshedApiResponse?.jsonBody ?? ''),
                              )!
                              .toList()
                              .cast<dynamic>();
                      safeSetState(() {});
                      return;
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            HandyFindersAPIsGroup.homeCategoriesCall.apiMessage(
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
                            if (_model.isInitialCategoriesLoading) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.4,
                                      0.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: wrapWithModel(
                                  model: _model.baseLoaderComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BaseLoaderComponentWidget(),
                                ),
                              );
                            } else if (_model.categoriesJsonList.isNotEmpty) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final localApiCategories =
                                        HandyFindersAPIsGroup.homeCategoriesCall
                                                .apiList(
                                                  (_model.initialApiResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                ?.toList() ??
                                            [];

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 13.0,
                                        mainAxisSpacing: 0.0,
                                        childAspectRatio: 0.75,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: localApiCategories.length,
                                      itemBuilder:
                                          (context, localApiCategoriesIndex) {
                                        final localApiCategoriesItem =
                                            localApiCategories[
                                                localApiCategoriesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              CategoryItemsWidget.routeName,
                                              queryParameters: {
                                                'appBarTitle': serializeParam(
                                                  getJsonField(
                                                    localApiCategoriesItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'categoryIdName':
                                                    serializeParam(
                                                  getJsonField(
                                                    localApiCategoriesItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Container(
                                                  width: 110.0,
                                                  height: 110.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE8E8E8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      child: CachedNetworkImage(
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
                                                          localApiCategoriesItem,
                                                          r'''$.image''',
                                                        ).toString()}',
                                                        fit: BoxFit.fitHeight,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  localApiCategoriesItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.43,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Text(
                                    'No Categories Found!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
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
