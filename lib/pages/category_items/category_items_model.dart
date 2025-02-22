import '/backend/api_requests/api_calls.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'category_items_widget.dart' show CategoryItemsWidget;
import 'package:flutter/material.dart';

class CategoryItemsModel extends FlutterFlowModel<CategoryItemsWidget> {
  ///  Local state fields for this page.

  bool isFetchingInitialApi = true;

  int currentPageIndex = 1;

  List<dynamic> itemsJsonList = [];
  void addToItemsJsonList(dynamic item) => itemsJsonList.add(item);
  void removeFromItemsJsonList(dynamic item) => itemsJsonList.remove(item);
  void removeAtIndexFromItemsJsonList(int index) =>
      itemsJsonList.removeAt(index);
  void insertAtIndexInItemsJsonList(int index, dynamic item) =>
      itemsJsonList.insert(index, item);
  void updateItemsJsonListAtIndex(int index, Function(dynamic) updateFn) =>
      itemsJsonList[index] = updateFn(itemsJsonList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Category Items)] action in CategoryItems widget.
  ApiCallResponse? initialApiResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Category Items)] action in TextField widget.
  ApiCallResponse? searchResponse;
  // Stores action output result for [Backend Call - API (Category Items)] action in Column widget.
  ApiCallResponse? refreshedApiResponse;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
