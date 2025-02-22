import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ic_back_title_model.dart';
export 'ic_back_title_model.dart';

class IcBackTitleWidget extends StatefulWidget {
  const IcBackTitleWidget({
    super.key,
    required this.title,
    bool? hideBackButton,
  }) : this.hideBackButton = hideBackButton ?? false;

  final String? title;
  final bool hideBackButton;

  @override
  State<IcBackTitleWidget> createState() => _IcBackTitleWidgetState();
}

class _IcBackTitleWidgetState extends State<IcBackTitleWidget> {
  late IcBackTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IcBackTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      decoration: BoxDecoration(
        color: Color(0x03FFFFFF),
      ),
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if (widget.hideBackButton) {
                return Opacity(
                  opacity: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Opacity(
                      opacity: 0.0,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 20.0, 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/icBack.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/icBack.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          Text(
            valueOrDefault<String>(
              widget.title,
              'null',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Comfortaa',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Opacity(
            opacity: 0.0,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 0.0, 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/icBack.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
