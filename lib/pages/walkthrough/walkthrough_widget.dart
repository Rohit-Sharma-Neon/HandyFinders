import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'walkthrough_model.dart';
export 'walkthrough_model.dart';

class WalkthroughWidget extends StatefulWidget {
  const WalkthroughWidget({
    super.key,
    required this.walkthroughData,
  });

  final List<dynamic>? walkthroughData;

  static String routeName = 'Walkthrough';
  static String routePath = '/walkthrough';

  @override
  State<WalkthroughWidget> createState() => _WalkthroughWidgetState();
}

class _WalkthroughWidgetState extends State<WalkthroughWidget> {
  late WalkthroughModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      decoration: BoxDecoration(
                        color: Color(0xFF192A40),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.65,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          Padding(
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
                                title: _model.pageViewIndex == 2
                                    ? 'Continue'
                                    : 'Next',
                                isLoading: false,
                                passOnTapCallback: () async {
                                  if (_model.pageViewIndex == 2) {
                                    FFAppState().isWalkthroughCompleted = true;
                                    safeSetState(() {});

                                    context
                                        .pushNamed(GetStartedWidget.routeName);

                                    return;
                                  } else {
                                    await _model.pageViewController?.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                    _model.pageViewIndex =
                                        _model.pageViewIndex +
                                            (_model.pageViewIndex < 2 ? 1 : 0);
                                    safeSetState(() {});
                                    return;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
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
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.14,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.asset(
                                      'assets/images/walkthrough1.png',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(0),
                                        r'''$.field_title''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: Color(0xFF24272E),
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(0),
                                        r'''$.value''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF24272E),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
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
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.14,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.asset(
                                      'assets/images/walkthrough2.png',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(1),
                                        r'''$.field_title''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(1),
                                        r'''$.value''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 13.5,
                                          letterSpacing: 0.0,
                                        ),
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
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.14,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.asset(
                                      'assets/images/walkthrough3.png',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(2),
                                        r'''$.field_title''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.walkthroughData
                                            ?.elementAtOrNull(2),
                                        r'''$.value''',
                                      )?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 13.5,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 25.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              safeSetState(() {});
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 1.8,
                              spacing: 4.0,
                              radius: 99.0,
                              dotWidth: 7.0,
                              dotHeight: 7.0,
                              dotColor: Color(0xFFD9D9D9),
                              activeDotColor: Colors.black,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      50.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.115,
                        0.0,
                      ),
                      50.0,
                      0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/walkthrough_dash.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.86,
                  decoration: BoxDecoration(
                    color: Color(0x02FFFFFF),
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
