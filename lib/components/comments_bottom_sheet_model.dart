import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_bottom_sheet_widget.dart' show CommentsBottomSheetWidget;
import 'package:flutter/material.dart';

class CommentsBottomSheetModel
    extends FlutterFlowModel<CommentsBottomSheetWidget> {
  ///  Local state fields for this component.

  bool isFetchingComments = true;

  List<dynamic> commentsList = [];
  void addToCommentsList(dynamic item) => commentsList.add(item);
  void removeFromCommentsList(dynamic item) => commentsList.remove(item);
  void removeAtIndexFromCommentsList(int index) => commentsList.removeAt(index);
  void insertAtIndexInCommentsList(int index, dynamic item) =>
      commentsList.insert(index, item);
  void updateCommentsListAtIndex(int index, Function(dynamic) updateFn) =>
      commentsList[index] = updateFn(commentsList[index]);

  bool isSendingComment = false;

  int currentPageIndex = 1;

  bool isLoadingMore = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Request Tip Comment List)] action in CommentsBottomSheet widget.
  ApiCallResponse? commentResponse;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Request Tip Comment List)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreCommentResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Add Comment)] action in Container widget.
  ApiCallResponse? addCommentResponse;
  // Stores action output result for [Custom Action - updateCommentsCount] action in Container widget.
  dynamic updatedPostJson;

  @override
  void initState(BuildContext context) {
    baseLoaderComponentModel =
        createModel(context, () => BaseLoaderComponentModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    baseLoaderComponentModel.dispose();
    baseButtonComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
