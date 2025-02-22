import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_tip_advice_widget.dart' show PostTipAdviceWidget;
import 'package:flutter/material.dart';

class PostTipAdviceModel extends FlutterFlowModel<PostTipAdviceWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Categories Listing)] action in PostTipAdvice widget.
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
  // State field(s) for SelectedDropDown widget.
  String? selectedDropDownValue;
  FormFieldController<String>? selectedDropDownValueController;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel4;
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
  // Stores action output result for [Backend Call - API (Add Update Request Tip)] action in BaseButtonComponent widget.
  ApiCallResponse? addTipResponse;

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
    baseButtonComponentModel.dispose();
  }
}
