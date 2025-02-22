import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'logo_component_model.dart';
export 'logo_component_model.dart';

class LogoComponentWidget extends StatefulWidget {
  const LogoComponentWidget({super.key});

  @override
  State<LogoComponentWidget> createState() => _LogoComponentWidgetState();
}

class _LogoComponentWidgetState extends State<LogoComponentWidget> {
  late LogoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.asset(
            'assets/images/icAppLogo.png',
            height: 90.0,
            fit: BoxFit.fitHeight,
            alignment: Alignment(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
