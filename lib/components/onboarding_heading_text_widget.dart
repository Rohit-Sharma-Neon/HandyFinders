import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_heading_text_model.dart';
export 'onboarding_heading_text_model.dart';

class OnboardingHeadingTextWidget extends StatefulWidget {
  const OnboardingHeadingTextWidget({
    super.key,
    required this.headingText,
  });

  final String? headingText;

  @override
  State<OnboardingHeadingTextWidget> createState() =>
      _OnboardingHeadingTextWidgetState();
}

class _OnboardingHeadingTextWidgetState
    extends State<OnboardingHeadingTextWidget> {
  late OnboardingHeadingTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingHeadingTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget.headingText,
        'null',
      ),
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Comfortaa',
            color: Color(0xFF253B3D),
            fontSize: 28.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
