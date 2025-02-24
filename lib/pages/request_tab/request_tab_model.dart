import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'request_tab_widget.dart' show RequestTabWidget;
import 'package:flutter/material.dart';

class RequestTabModel extends FlutterFlowModel<RequestTabWidget> {
  ///  Local state fields for this page.

  int selectedTabIndex = 0;

  bool isPrimaryApiFetching = false;

  bool isSecondaryApiFetching = false;

  bool isPrimaryLoadingMore = false;

  bool isSecondaryLoadingMore = false;

  bool isSecondaryApiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in RequestTab widget.
  ApiCallResponse? initialPrimaryApiResponse;
  // Stores action output result for [Backend Call - API (Get Notification Count)] action in RequestTab widget.
  ApiCallResponse? getNotificationCountResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in Container widget.
  ApiCallResponse? initialSecondaryApiResponse;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in Column widget.
  ApiCallResponse? refreshedPrimaryApiResponse;
  // Stores action output result for [Backend Call - API (Remove Request)] action in Container widget.
  ApiCallResponse? removePostResponse;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? primaryDislikeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedPrimaryDislikeJson;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? primaryLikeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedPrimaryJson;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel1;
  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in BaseButtonComponent widget.
  ApiCallResponse? primaryLoadMoreResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedPrimaryList;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in Column widget.
  ApiCallResponse? refreshedSecondaryApiResponse;
  // Stores action output result for [Backend Call - API (Remove Request)] action in Container widget.
  ApiCallResponse? removeApiResponse;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? secondaryDislikeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedSecondaryDislikeJson;
  // Stores action output result for [Backend Call - API (Like Dislike)] action in Icon widget.
  ApiCallResponse? secondaryLikeResponse;
  // Stores action output result for [Custom Action - updateLikeStatusKeyValue] action in Icon widget.
  dynamic returnedSecondaryJson;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel2;
  // Stores action output result for [Backend Call - API (Request Bottom Tab)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreSecondaryResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedSecondaryList;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    baseLoaderComponentModel1 =
        createModel(context, () => BaseLoaderComponentModel());
    baseButtonComponentModel1 =
        createModel(context, () => BaseButtonComponentModel());
    baseLoaderComponentModel2 =
        createModel(context, () => BaseLoaderComponentModel());
    baseButtonComponentModel2 =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    baseLoaderComponentModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    baseButtonComponentModel1.dispose();
    baseLoaderComponentModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    baseButtonComponentModel2.dispose();
  }
}
