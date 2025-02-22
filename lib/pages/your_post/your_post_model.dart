import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'your_post_widget.dart' show YourPostWidget;
import 'package:flutter/material.dart';

class YourPostModel extends FlutterFlowModel<YourPostWidget> {
  ///  Local state fields for this page.

  int selectedTabIndex = 0;

  bool isPostFetching = false;

  bool isTipFetching = false;

  int currentPostPageIndex = 2;

  bool isLoadingMorePost = false;

  int currentTipPageIndex = 2;

  bool isLoadingMoreTip = false;

  bool isInitialTipLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Your Post)] action in YourPost widget.
  ApiCallResponse? postApiResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (Your Post)] action in Container widget.
  ApiCallResponse? initialTipApiResponse;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel1;
  // Stores action output result for [Backend Call - API (Your Post)] action in Column widget.
  ApiCallResponse? refreshedPostApiResponse;
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
  // Stores action output result for [Backend Call - API (Your Post)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMorePostResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedList;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel2;
  // Stores action output result for [Backend Call - API (Your Post)] action in Column widget.
  ApiCallResponse? refreshedTipApiResponse;
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
  // Stores action output result for [Backend Call - API (Your Post)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreTipResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedTipList;

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
    baseButtonComponentModel1.dispose();
    baseLoaderComponentModel2.dispose();
    baseButtonComponentModel2.dispose();
  }
}
