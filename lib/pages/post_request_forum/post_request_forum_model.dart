import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_request_forum_widget.dart' show PostRequestForumWidget;
import 'package:flutter/material.dart';

class PostRequestForumModel extends FlutterFlowModel<PostRequestForumWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Categories Listing)] action in PostRequestForum widget.
  ApiCallResponse? getCategoriesResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your title';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your description';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel3;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter preferred cost';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel5;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Validate Form] action in BaseButtonComponent widget.
  bool? validationResult;
  // Stores action output result for [Backend Call - API (Add Update Request Tip)] action in BaseButtonComponent widget.
  ApiCallResponse? addRequestTipResponse;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    textFieldLabelTextModel1 =
        createModel(context, () => TextFieldLabelTextModel());
    textController1Validator = _textController1Validator;
    textFieldLabelTextModel2 =
        createModel(context, () => TextFieldLabelTextModel());
    textController2Validator = _textController2Validator;
    textFieldLabelTextModel3 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel4 =
        createModel(context, () => TextFieldLabelTextModel());
    textController3Validator = _textController3Validator;
    textFieldLabelTextModel5 =
        createModel(context, () => TextFieldLabelTextModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    textFieldLabelTextModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldLabelTextModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldLabelTextModel3.dispose();
    textFieldLabelTextModel4.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldLabelTextModel5.dispose();
    baseButtonComponentModel.dispose();
  }
}
