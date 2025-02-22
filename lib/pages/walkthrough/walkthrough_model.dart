import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'walkthrough_widget.dart' show WalkthroughWidget;
import 'package:flutter/material.dart';

class WalkthroughModel extends FlutterFlowModel<WalkthroughWidget> {
  ///  Local state fields for this page.

  int pageViewIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

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
