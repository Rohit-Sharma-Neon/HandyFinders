import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'get_started_widget.dart' show GetStartedWidget;
import 'package:flutter/material.dart';

class GetStartedModel extends FlutterFlowModel<GetStartedWidget> {
  ///  State fields for stateful widgets in this page.

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
