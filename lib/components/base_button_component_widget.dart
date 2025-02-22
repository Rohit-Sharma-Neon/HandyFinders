import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'base_button_component_model.dart';
export 'base_button_component_model.dart';

class BaseButtonComponentWidget extends StatefulWidget {
  const BaseButtonComponentWidget({
    super.key,
    String? title,
    this.buttonColor,
    Color? textColor,
    bool? isLoading,
    this.textSize,
    required this.passOnTapCallback,
    bool? removeScaffoldPadding,
  })  : this.title = title ?? 'null',
        this.textColor = textColor ?? Colors.white,
        this.isLoading = isLoading ?? false,
        this.removeScaffoldPadding = removeScaffoldPadding ?? false;

  final String title;
  final Color? buttonColor;
  final Color textColor;
  final bool isLoading;
  final double? textSize;
  final Future Function()? passOnTapCallback;
  final bool removeScaffoldPadding;

  @override
  State<BaseButtonComponentWidget> createState() =>
      _BaseButtonComponentWidgetState();
}

class _BaseButtonComponentWidgetState extends State<BaseButtonComponentWidget> {
  late BaseButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseButtonComponentModel());
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
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Lottie.network(
              'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
              width: 100.0,
              height: 70.0,
              fit: BoxFit.fitHeight,
              animate: true,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  widget.removeScaffoldPadding
                      ? 0.0
                      : FFAppConstants.scaffoldHorizontalPadding,
                  0.0,
                ),
                0.0,
                valueOrDefault<double>(
                  widget.removeScaffoldPadding
                      ? 0.0
                      : FFAppConstants.scaffoldHorizontalPadding,
                  0.0,
                ),
                0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.passOnTapCallback?.call();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 55.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget.buttonColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    FFAppConstants.primaryBorderRadius,
                    0.0,
                  )),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget.title,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          color: valueOrDefault<Color>(
                            widget.textColor,
                            Colors.white,
                          ),
                          fontSize: valueOrDefault<double>(
                            widget.textSize,
                            14.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
