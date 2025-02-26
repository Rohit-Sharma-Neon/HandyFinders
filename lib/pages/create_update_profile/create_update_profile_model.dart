import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_update_profile_widget.dart' show CreateUpdateProfileWidget;
import 'package:flutter/material.dart';

class CreateUpdateProfileModel
    extends FlutterFlowModel<CreateUpdateProfileWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool isMobileEntered = true;

  bool isFetchingProfileApi = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Profile)] action in CreateUpdateProfile widget.
  ApiCallResponse? getProfileApiStatus;
  // Model for gradientBackground component.
  late GradientBackgroundModel gradientBackgroundModel;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel1;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel2;
  // State field(s) for firstNameField widget.
  FocusNode? firstNameFieldFocusNode;
  TextEditingController? firstNameFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameFieldTextControllerValidator;
  String? _firstNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your first name';
    }

    return null;
  }

  // State field(s) for lastNameField widget.
  FocusNode? lastNameFieldFocusNode;
  TextEditingController? lastNameFieldTextController;
  String? Function(BuildContext, String?)? lastNameFieldTextControllerValidator;
  String? _lastNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your last name';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel3;
  // State field(s) for userNameField widget.
  FocusNode? userNameFieldFocusNode;
  TextEditingController? userNameFieldTextController;
  String? Function(BuildContext, String?)? userNameFieldTextControllerValidator;
  String? _userNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your username';
    }

    if (val.length < 2) {
      return 'Please enter a valid username';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel4;
  // Stores action output result for [Custom Action - countryCodePicker] action in Row widget.
  String? selectedCountryCode;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for userMobileField widget.
  FocusNode? userMobileFieldFocusNode;
  TextEditingController? userMobileFieldTextController;
  String? Function(BuildContext, String?)?
      userMobileFieldTextControllerValidator;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel5;
  // State field(s) for userEmailField widget.
  FocusNode? userEmailFieldFocusNode;
  TextEditingController? userEmailFieldTextController;
  String? Function(BuildContext, String?)?
      userEmailFieldTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (CreateUpdateProfile)] action in BaseButtonComponent widget.
  ApiCallResponse? createUpdateProfileResponse;

  @override
  void initState(BuildContext context) {
    gradientBackgroundModel =
        createModel(context, () => GradientBackgroundModel());
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    textFieldLabelTextModel1 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel2 =
        createModel(context, () => TextFieldLabelTextModel());
    firstNameFieldTextControllerValidator =
        _firstNameFieldTextControllerValidator;
    lastNameFieldTextControllerValidator =
        _lastNameFieldTextControllerValidator;
    textFieldLabelTextModel3 =
        createModel(context, () => TextFieldLabelTextModel());
    userNameFieldTextControllerValidator =
        _userNameFieldTextControllerValidator;
    textFieldLabelTextModel4 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel5 =
        createModel(context, () => TextFieldLabelTextModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    gradientBackgroundModel.dispose();
    icBackTitleModel.dispose();
    textFieldLabelTextModel1.dispose();
    textFieldLabelTextModel2.dispose();
    firstNameFieldFocusNode?.dispose();
    firstNameFieldTextController?.dispose();

    lastNameFieldFocusNode?.dispose();
    lastNameFieldTextController?.dispose();

    textFieldLabelTextModel3.dispose();
    userNameFieldFocusNode?.dispose();
    userNameFieldTextController?.dispose();

    textFieldLabelTextModel4.dispose();
    userMobileFieldFocusNode?.dispose();
    userMobileFieldTextController?.dispose();

    textFieldLabelTextModel5.dispose();
    userEmailFieldFocusNode?.dispose();
    userEmailFieldTextController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
