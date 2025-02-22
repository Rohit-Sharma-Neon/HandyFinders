import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.icBackTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: IcBackTitleWidget(
                  title: 'Privacy Policy',
                ),
              ),
              Expanded(
                child: FlutterFlowWebView(
                  content:
                      'https://demo.dev9server.com/handy-finders/page/privacy-policy',
                  bypass: false,
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  verticalScroll: true,
                  horizontalScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
