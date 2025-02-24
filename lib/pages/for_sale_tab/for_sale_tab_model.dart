import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'for_sale_tab_widget.dart' show ForSaleTabWidget;
import 'package:flutter/material.dart';

class ForSaleTabModel extends FlutterFlowModel<ForSaleTabWidget> {
  ///  Local state fields for this page.

  int selectedTabIndex = 0;

  bool isPrimaryApiFetching = false;

  bool isSecondaryApiFetching = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (For Sale List)] action in ForSaleTab widget.
  ApiCallResponse? initialPrimaryApiResponse;
  // Stores action output result for [Backend Call - API (Get Notification Count)] action in ForSaleTab widget.
  ApiCallResponse? getNotificationCountResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (For Free List)] action in Container widget.
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
  // Stores action output result for [Backend Call - API (For Sale List)] action in Column widget.
  ApiCallResponse? refreshedPrimaryApiResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? bookmarkResponse;
  // Stores action output result for [Custom Action - updateItemBookmarkStatusKeyValue] action in Container widget.
  dynamic returnedBookmarkResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? serviceBookmarkResponse;
  // Stores action output result for [Custom Action - updateItemBookmarkStatusKeyValue] action in Container widget.
  dynamic returnedBookmarkResponseCopy;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (For Free List)] action in Column widget.
  ApiCallResponse? refreshedSecondaryApiResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? freeItemBookmarkResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? freeServiceBookmarkResponse;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    baseLoaderComponentModel1 =
        createModel(context, () => BaseLoaderComponentModel());
    baseLoaderComponentModel2 =
        createModel(context, () => BaseLoaderComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    baseLoaderComponentModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    baseLoaderComponentModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
