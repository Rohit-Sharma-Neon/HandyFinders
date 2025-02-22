import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ic_back_model.dart';
export 'ic_back_model.dart';

class IcBackWidget extends StatefulWidget {
  const IcBackWidget({super.key});

  @override
  State<IcBackWidget> createState() => _IcBackWidgetState();
}

class _IcBackWidgetState extends State<IcBackWidget> {
  late IcBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IcBackModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0,
          valueOrDefault<double>(
            FFAppConstants.topSafeArea,
            0.0,
          ),
          0.0,
          0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.safePop();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x03FFFFFF),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/icBack.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
