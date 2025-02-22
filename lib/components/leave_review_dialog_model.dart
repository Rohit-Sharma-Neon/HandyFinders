import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'leave_review_dialog_widget.dart' show LeaveReviewDialogWidget;
import 'package:flutter/material.dart';

class LeaveReviewDialogModel extends FlutterFlowModel<LeaveReviewDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your description';
    }

    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Give Review)] action in BaseButtonComponent widget.
  ApiCallResponse? givenReviewResponse;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
