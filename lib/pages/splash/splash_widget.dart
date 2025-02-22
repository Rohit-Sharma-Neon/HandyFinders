import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'Splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      FFAppState().isHomeTabInitialApiLoaded = false;
      FFAppState().isRequestTabPrimaryApiLoaded = false;
      FFAppState().isForSalePrimaryApiLoaded = false;
      FFAppState().isMessageTabInitialApiLoaded = false;
      if (FFAppState().authToken != '') {
        if (FFAppState().isProfileCreated == 1) {
          context.goNamed(HomeTabWidget.routeName);

          return;
        } else {
          context.goNamed(
            CreateUpdateProfileWidget.routeName,
            queryParameters: {
              'isUpdating': serializeParam(
                false,
                ParamType.bool,
              ),
              'authToken': serializeParam(
                FFAppState().authToken,
                ParamType.String,
              ),
              'userEmail': serializeParam(
                FFAppState().userEmail,
                ParamType.String,
              ),
              'hideBackButton': serializeParam(
                true,
                ParamType.bool,
              ),
            }.withoutNulls,
          );

          return;
        }
      } else {
        if (FFAppState().isWalkthroughCompleted == true) {
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
          _model.walkthroughData =
              await HandyFindersAPIsGroup.walkthroughDetailsCall.call(
            authToken: FFAppState().authToken,
          );

          context.goNamed(
            WalkthroughWidget.routeName,
            queryParameters: {
              'walkthroughData': serializeParam(
                HandyFindersAPIsGroup.walkthroughDetailsCall.apiList(
                  (_model.walkthroughData?.jsonBody ?? ''),
                ),
                ParamType.JSON,
                isList: true,
              ),
            }.withoutNulls,
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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/splash_alihandy.png',
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}
