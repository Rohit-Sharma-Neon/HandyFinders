import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'base_load_more_model.dart';
export 'base_load_more_model.dart';

class BaseLoadMoreWidget extends StatefulWidget {
  const BaseLoadMoreWidget({
    super.key,
    required this.onLoadMore,
    bool? isAllDataLoaded,
    bool? isLoadingMore,
  })  : this.isAllDataLoaded = isAllDataLoaded ?? false,
        this.isLoadingMore = isLoadingMore ?? false;

  final Future Function()? onLoadMore;
  final bool isAllDataLoaded;
  final bool isLoadingMore;

  @override
  State<BaseLoadMoreWidget> createState() => _BaseLoadMoreWidgetState();
}

class _BaseLoadMoreWidgetState extends State<BaseLoadMoreWidget> {
  late BaseLoadMoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseLoadMoreModel());
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
        if (widget.isAllDataLoaded) {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
              child: Text(
                'No More Data!',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Comfortaa',
                      color: FlutterFlowTheme.of(context).hintTextColor,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: wrapWithModel(
              model: _model.baseButtonComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: BaseButtonComponentWidget(
                title: 'Load More',
                buttonColor: Color(0x00FFFFFF),
                textColor: Color(0xFF6E6E6E),
                isLoading: widget.isLoadingMore,
                removeScaffoldPadding: true,
                passOnTapCallback: () async {},
              ),
            ),
          );
        }
      },
    );
  }
}
