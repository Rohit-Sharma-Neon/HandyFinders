import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_and_conditions_widget.dart' show TermsAndConditionsWidget;
import 'package:flutter/material.dart';

class TermsAndConditionsModel
    extends FlutterFlowModel<TermsAndConditionsWidget> {
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
