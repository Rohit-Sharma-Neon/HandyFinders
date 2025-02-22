import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terms_policy_component_model.dart';
export 'terms_policy_component_model.dart';

class TermsPolicyComponentWidget extends StatefulWidget {
  const TermsPolicyComponentWidget({
    super.key,
    required this.heading,
    required this.description,
  });

  final String? heading;
  final String? description;

  @override
  State<TermsPolicyComponentWidget> createState() =>
      _TermsPolicyComponentWidgetState();
}

class _TermsPolicyComponentWidgetState
    extends State<TermsPolicyComponentWidget> {
  late TermsPolicyComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsPolicyComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.heading,
              'null',
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Color(0xFF24272E),
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(23.0, 10.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.description,
              'null',
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Color(0xFF24272E),
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
