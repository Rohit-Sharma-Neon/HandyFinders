import '/components/base_button_component_widget.dart';
import '/components/onboarding_heading_text_widget.dart';
import '/components/onboarding_sub_heading_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'allow_location_model.dart';
export 'allow_location_model.dart';

class AllowLocationWidget extends StatefulWidget {
  const AllowLocationWidget({super.key});

  static String routeName = 'AllowLocation';
  static String routePath = '/allowLocation';

  @override
  State<AllowLocationWidget> createState() => _AllowLocationWidgetState();
}

class _AllowLocationWidgetState extends State<AllowLocationWidget> {
  late AllowLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllowLocationModel());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/icMap.svg',
                  width: 160.0,
                  height: 160.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.onboardingHeadingTextModel,
                updateCallback: () => safeSetState(() {}),
                child: OnboardingHeadingTextWidget(
                  headingText: 'Allow Location',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.onboardingSubHeadingTextModel,
                updateCallback: () => safeSetState(() {}),
                child: OnboardingSubHeadingTextWidget(
                  subHeadingText:
                      'We will need your location to give\nyou better experience.',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.baseButtonComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BaseButtonComponentWidget(
                  title: 'Allow Location',
                  isLoading: false,
                  passOnTapCallback: () async {
                    await requestPermission(locationPermission);

                    context.goNamed(HomeTabWidget.routeName);
                  },
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(HomeTabWidget.routeName);
              },
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Not Now',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
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
