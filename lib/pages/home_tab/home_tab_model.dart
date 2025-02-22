import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_tab_widget.dart' show HomeTabWidget;
import 'package:flutter/material.dart';

class HomeTabModel extends FlutterFlowModel<HomeTabWidget> {
  ///  Local state fields for this page.

  bool isInitialApiLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Home Categories)] action in HomeTab widget.
  ApiCallResponse? homeCategoriesResponse;
  // Stores action output result for [Backend Call - API (Home Post List)] action in HomeTab widget.
  ApiCallResponse? initialHomeRequestListResponse;
  // Stores action output result for [Backend Call - API (Get Notification Count)] action in HomeTab widget.
  ApiCallResponse? getNotificationCountResponse;
  // Model for gradientBackground component.
  late GradientBackgroundModel gradientBackgroundModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Home Post List)] action in TextField widget.
  ApiCallResponse? postSearchResult;
  // Stores action output result for [Backend Call - API (Home Categories)] action in Column widget.
  ApiCallResponse? refreshedHomeCategoriesResponse;
  // Stores action output result for [Backend Call - API (Home Post List)] action in Column widget.
  ApiCallResponse? refreshedHomeRequestListResponse;
  // Stores action output result for [Backend Call - API (Get Notification Count)] action in Column widget.
  ApiCallResponse? refreshedNotificationCountResponse;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // Stores action output result for [Backend Call - API (Report Post)] action in Container widget.
  ApiCallResponse? reportResponse;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? dislikeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedDislikeJson;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? likeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedJson;

  @override
  void initState(BuildContext context) {
    gradientBackgroundModel =
        createModel(context, () => GradientBackgroundModel());
    baseLoaderComponentModel =
        createModel(context, () => BaseLoaderComponentModel());
  }

  @override
  void dispose() {
    gradientBackgroundModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    baseLoaderComponentModel.dispose();
  }
}
