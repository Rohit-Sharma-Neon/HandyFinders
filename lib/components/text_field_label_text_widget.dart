import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_field_label_text_model.dart';
export 'text_field_label_text_model.dart';

class TextFieldLabelTextWidget extends StatefulWidget {
  const TextFieldLabelTextWidget({
    super.key,
    required this.labelText,
  });

  final String? labelText;

  @override
  State<TextFieldLabelTextWidget> createState() =>
      _TextFieldLabelTextWidgetState();
}

class _TextFieldLabelTextWidgetState extends State<TextFieldLabelTextWidget> {
  late TextFieldLabelTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldLabelTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
        child: Text(
          valueOrDefault<String>(
            widget.labelText,
            'null',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                fontSize: 15.0,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
