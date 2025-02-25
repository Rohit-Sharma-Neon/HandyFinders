import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_email_dialog_widget.dart' show UpdateEmailDialogWidget;
import 'package:flutter/material.dart';

class UpdateEmailDialogModel extends FlutterFlowModel<UpdateEmailDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DialogEmail widget.
  FocusNode? dialogEmailFocusNode;
  TextEditingController? dialogEmailTextController;
  String? Function(BuildContext, String?)? dialogEmailTextControllerValidator;
  String? _dialogEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter new email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter valid email';
    }
    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Send OTP)] action in BaseButtonComponent widget.
  ApiCallResponse? sendOtpResponse;

  @override
  void initState(BuildContext context) {
    dialogEmailTextControllerValidator = _dialogEmailTextControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    dialogEmailFocusNode?.dispose();
    dialogEmailTextController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
