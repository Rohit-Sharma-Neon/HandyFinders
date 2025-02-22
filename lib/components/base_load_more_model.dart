import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'base_load_more_widget.dart' show BaseLoadMoreWidget;
import 'package:flutter/material.dart';

class BaseLoadMoreModel extends FlutterFlowModel<BaseLoadMoreWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;

  @override
  void initState(BuildContext context) {
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    baseButtonComponentModel.dispose();
  }
}
