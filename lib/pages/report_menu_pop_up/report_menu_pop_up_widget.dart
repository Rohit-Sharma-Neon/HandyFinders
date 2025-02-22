import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'report_menu_pop_up_model.dart';
export 'report_menu_pop_up_model.dart';

class ReportMenuPopUpWidget extends StatefulWidget {
  const ReportMenuPopUpWidget({
    super.key,
    required this.onReport,
  });

  final Future Function()? onReport;

  @override
  State<ReportMenuPopUpWidget> createState() => _ReportMenuPopUpWidgetState();
}

class _ReportMenuPopUpWidgetState extends State<ReportMenuPopUpWidget> {
  late ReportMenuPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportMenuPopUpModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onReport?.call();
      },
      child: Container(
        width: 90.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x10000000),
              offset: Offset(
                0.0,
                0.0,
              ),
              spreadRadius: 3.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Report',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF253B3D),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
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
