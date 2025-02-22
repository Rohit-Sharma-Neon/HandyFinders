import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'your_listing_menu_pop_up_model.dart';
export 'your_listing_menu_pop_up_model.dart';

class YourListingMenuPopUpWidget extends StatefulWidget {
  const YourListingMenuPopUpWidget({
    super.key,
    required this.onRemove,
  });

  final Future Function()? onRemove;

  @override
  State<YourListingMenuPopUpWidget> createState() =>
      _YourListingMenuPopUpWidgetState();
}

class _YourListingMenuPopUpWidgetState
    extends State<YourListingMenuPopUpWidget> {
  late YourListingMenuPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourListingMenuPopUpModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 50.0,
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
    );
  }
}
