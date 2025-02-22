import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'service_list2_widget.dart' show ServiceList2Widget;
import 'package:flutter/material.dart';

class ServiceList2Model extends FlutterFlowModel<ServiceList2Widget> {
  ///  Local state fields for this page.

  bool isFetchingApi = true;

  List<dynamic> itemsList = [];
  void addToItemsList(dynamic item) => itemsList.add(item);
  void removeFromItemsList(dynamic item) => itemsList.remove(item);
  void removeAtIndexFromItemsList(int index) => itemsList.removeAt(index);
  void insertAtIndexInItemsList(int index, dynamic item) =>
      itemsList.insert(index, item);
  void updateItemsListAtIndex(int index, Function(dynamic) updateFn) =>
      itemsList[index] = updateFn(itemsList[index]);

  int currentPageIndex = 1;

  bool isLoadingMore = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (All Sale Service List)] action in ServiceList2 widget.
  ApiCallResponse? servicesListResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // Stores action output result for [Backend Call - API (All Sale Service List)] action in Column widget.
  ApiCallResponse? refreshedSaleServiceListResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? bookmarkResponse;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (All Sale Service List)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreSaleServiceListResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedList;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    baseLoaderComponentModel =
        createModel(context, () => BaseLoaderComponentModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    baseLoaderComponentModel.dispose();
    baseButtonComponentModel.dispose();
  }
}
