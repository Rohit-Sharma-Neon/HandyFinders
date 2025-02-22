import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'select_user_dialog_widget.dart' show SelectUserDialogWidget;
import 'package:flutter/material.dart';

class SelectUserDialogModel extends FlutterFlowModel<SelectUserDialogWidget> {
  ///  Local state fields for this component.

  bool isFetchingUsers = false;

  bool? isUserNotSelected;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Users List)] action in SelectUserDialog widget.
  ApiCallResponse? usersListResponse;
  // State field(s) for UserDropDown widget.
  String? userDropDownValue;
  FormFieldController<String>? userDropDownValueController;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Mark Request As Completed)] action in BaseButtonComponent widget.
  ApiCallResponse? apiResponse;

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
