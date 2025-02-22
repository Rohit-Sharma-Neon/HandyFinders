import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_bottom_sheet_widget.dart' show FilterBottomSheetWidget;
import 'package:flutter/material.dart';

class FilterBottomSheetModel extends FlutterFlowModel<FilterBottomSheetWidget> {
  ///  Local state fields for this component.

  bool isCategoriesFetching = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Categories Listing)] action in FilterBottomSheet widget.
  ApiCallResponse? categoriesResponse;
  // State field(s) for Category widget.
  List<String>? categoryValue;
  FormFieldController<List<String>>? categoryValueController;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (Home Post List)] action in Container widget.
  ApiCallResponse? clearedFilterResponse;
  // Stores action output result for [Backend Call - API (Home Post List)] action in Container widget.
  ApiCallResponse? filterResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
