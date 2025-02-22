import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'get_started_model.dart';
export 'get_started_model.dart';

class GetStartedWidget extends StatefulWidget {
  const GetStartedWidget({super.key});

  static String routeName = 'GetStarted';
  static String routePath = '/getStarted';

  @override
  State<GetStartedWidget> createState() => _GetStartedWidgetState();
}

class _GetStartedWidgetState extends State<GetStartedWidget> {
  late GetStartedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetStartedModel());
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/splash_alihandy.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              wrapWithModel(
                model: _model.baseButtonComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BaseButtonComponentWidget(
                  title: 'I’m new to the app',
                  buttonColor: Colors.white,
                  textColor: Color(0xFF24272E),
                  isLoading: false,
                  passOnTapCallback: () async {
                    context.pushNamed(SignUpWidget.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 20.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(LoginWidget.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0x020470B7),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
      ),
    );
  }
}
