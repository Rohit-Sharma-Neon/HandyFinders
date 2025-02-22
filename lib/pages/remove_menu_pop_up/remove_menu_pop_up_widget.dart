import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'remove_menu_pop_up_model.dart';
export 'remove_menu_pop_up_model.dart';

class RemoveMenuPopUpWidget extends StatefulWidget {
  const RemoveMenuPopUpWidget({
    super.key,
    required this.onRemove,
  });

  final Future Function()? onRemove;

  @override
  State<RemoveMenuPopUpWidget> createState() => _RemoveMenuPopUpWidgetState();
}

class _RemoveMenuPopUpWidgetState extends State<RemoveMenuPopUpWidget> {
  late RemoveMenuPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemoveMenuPopUpModel());
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
        Navigator.pop(context);
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
              Expanded(
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Remove',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
