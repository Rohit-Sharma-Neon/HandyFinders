import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_sub_heading_text_model.dart';
export 'onboarding_sub_heading_text_model.dart';

class OnboardingSubHeadingTextWidget extends StatefulWidget {
  const OnboardingSubHeadingTextWidget({
    super.key,
    required this.subHeadingText,
  });

  final String? subHeadingText;

  @override
  State<OnboardingSubHeadingTextWidget> createState() =>
      _OnboardingSubHeadingTextWidgetState();
}

class _OnboardingSubHeadingTextWidgetState
    extends State<OnboardingSubHeadingTextWidget> {
  late OnboardingSubHeadingTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingSubHeadingTextModel());
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
        widget.subHeadingText,
        'null',
      ),
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            color: Color(0xFF6A7284),
            fontSize: 15.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
