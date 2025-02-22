import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'settings_list_tile_model.dart';
export 'settings_list_tile_model.dart';

class SettingsListTileWidget extends StatefulWidget {
  const SettingsListTileWidget({
    super.key,
    required this.title,
    this.iconBackgroundColor,
  });

  final String? title;
  final Color? iconBackgroundColor;

  @override
  State<SettingsListTileWidget> createState() => _SettingsListTileWidgetState();
}

class _SettingsListTileWidgetState extends State<SettingsListTileWidget> {
  late SettingsListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsListTileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 43.0,
                height: 43.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget.iconBackgroundColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/icAffirmation.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Comfortaa',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/icRoundForward.svg',
                  width: 18.0,
                  height: 18.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Divider(
            height: 20.0,
            thickness: 1.5,
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ],
      ),
    );
  }
}
