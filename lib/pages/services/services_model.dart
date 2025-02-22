import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'services_widget.dart' show ServicesWidget;
import 'package:flutter/material.dart';

class ServicesModel extends FlutterFlowModel<ServicesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
  }
}
