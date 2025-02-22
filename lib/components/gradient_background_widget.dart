import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gradient_background_model.dart';
export 'gradient_background_model.dart';

class GradientBackgroundWidget extends StatefulWidget {
  const GradientBackgroundWidget({super.key});

  @override
  State<GradientBackgroundWidget> createState() =>
      _GradientBackgroundWidgetState();
}

class _GradientBackgroundWidgetState extends State<GradientBackgroundWidget> {
  late GradientBackgroundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientBackgroundModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 80.0,
                  color: Color(0x270470B7),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 50.0,
                )
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 60.0,
                  color: Color(0x2747CC6B),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 50.0,
                )
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
