import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/components/text_field_label_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_update_listing_widget.dart' show AddUpdateListingWidget;
import 'package:flutter/material.dart';

class AddUpdateListingModel extends FlutterFlowModel<AddUpdateListingWidget> {
  ///  Local state fields for this page.

  int currentIndex = 0;

  int? selctedCategoryId;

  bool isApisLoading = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Categories Listing)] action in AddUpdateListing widget.
  ApiCallResponse? getCategoriesResponse;
  // Stores action output result for [Backend Call - API (Get Currency List)] action in AddUpdateListing widget.
  ApiCallResponse? currencyResponse;
  // Stores action output result for [Backend Call - API (Get Condition List)] action in AddUpdateListing widget.
  ApiCallResponse? conditionResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel1;
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

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel2;
  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel3;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your title';
    }

    return null;
  }

  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel4;
  // State field(s) for ListingType widget.
  String? listingTypeValue;
  FormFieldController<String>? listingTypeValueController;
  // State field(s) for IsItemFree widget.
  bool? isItemFreeValue;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel5;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel6;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your price';
    }

    return null;
  }

  // State field(s) for SalePrice widget.
  FocusNode? salePriceFocusNode;
  TextEditingController? salePriceTextController;
  String? Function(BuildContext, String?)? salePriceTextControllerValidator;
  String? _salePriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your sale price';
    }

    return null;
  }

  // State field(s) for IsNegotiable widget.
  bool? isNegotiableValue;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel7;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel8;
  // State field(s) for Currency widget.
  String? currencyValue;
  FormFieldController<String>? currencyValueController;
  // State field(s) for Condition widget.
  String? conditionValue;
  FormFieldController<String>? conditionValueController;
  // Model for TextFieldLabelText component.
  late TextFieldLabelTextModel textFieldLabelTextModel9;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your description';
    }

    return null;
  }

  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Add Item or Service)] action in BaseButtonComponent widget.
  ApiCallResponse? apiResponse;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    textFieldLabelTextModel1 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel2 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel3 =
        createModel(context, () => TextFieldLabelTextModel());
    titleTextControllerValidator = _titleTextControllerValidator;
    textFieldLabelTextModel4 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel5 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel6 =
        createModel(context, () => TextFieldLabelTextModel());
    priceTextControllerValidator = _priceTextControllerValidator;
    salePriceTextControllerValidator = _salePriceTextControllerValidator;
    textFieldLabelTextModel7 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel8 =
        createModel(context, () => TextFieldLabelTextModel());
    textFieldLabelTextModel9 =
        createModel(context, () => TextFieldLabelTextModel());
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    textFieldLabelTextModel1.dispose();
    textFieldLabelTextModel2.dispose();
    textFieldLabelTextModel3.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    textFieldLabelTextModel4.dispose();
    textFieldLabelTextModel5.dispose();
    textFieldLabelTextModel6.dispose();
    priceFocusNode?.dispose();
    priceTextController?.dispose();

    salePriceFocusNode?.dispose();
    salePriceTextController?.dispose();

    textFieldLabelTextModel7.dispose();
    textFieldLabelTextModel8.dispose();
    textFieldLabelTextModel9.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    baseButtonComponentModel.dispose();
  }
}
