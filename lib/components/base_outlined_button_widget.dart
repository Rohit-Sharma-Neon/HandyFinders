import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'base_outlined_button_model.dart';
export 'base_outlined_button_model.dart';

class BaseOutlinedButtonWidget extends StatefulWidget {
  const BaseOutlinedButtonWidget({
    super.key,
    required this.title,
    this.buttonColor,
    this.textColor,
    bool? isLoading,
  }) : this.isLoading = isLoading ?? false;

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool isLoading;

  @override
  State<BaseOutlinedButtonWidget> createState() =>
      _BaseOutlinedButtonWidgetState();
}

class _BaseOutlinedButtonWidgetState extends State<BaseOutlinedButtonWidget> {
  late BaseOutlinedButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseOutlinedButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.isLoading) {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Lottie.network(
              'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
              width: 100.0,
              height: 55.0,
              fit: BoxFit.contain,
              animate: true,
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            height: 55.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(valueOrDefault<double>(
                FFAppConstants.primaryBorderRadius,
                0.0,
              )),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondary,
                width: 1.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget.title!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Comfortaa',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}
