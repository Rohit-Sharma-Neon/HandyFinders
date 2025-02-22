import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  Local state fields for this page.

  bool isInitialCategoriesLoading = true;

  List<dynamic> categoriesJsonList = [];
  void addToCategoriesJsonList(dynamic item) => categoriesJsonList.add(item);
  void removeFromCategoriesJsonList(dynamic item) =>
      categoriesJsonList.remove(item);
  void removeAtIndexFromCategoriesJsonList(int index) =>
      categoriesJsonList.removeAt(index);
  void insertAtIndexInCategoriesJsonList(int index, dynamic item) =>
      categoriesJsonList.insert(index, item);
  void updateCategoriesJsonListAtIndex(int index, Function(dynamic) updateFn) =>
      categoriesJsonList[index] = updateFn(categoriesJsonList[index]);

  bool isLoadingMore = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Home Categories)] action in Categories widget.
  ApiCallResponse? initialApiResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (Home Categories)] action in Column widget.
  ApiCallResponse? refreshedApiResponse;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    baseLoaderComponentModel =
        createModel(context, () => BaseLoaderComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    baseLoaderComponentModel.dispose();
  }
}
