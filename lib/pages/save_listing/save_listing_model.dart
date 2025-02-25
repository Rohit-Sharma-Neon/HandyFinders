import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'save_listing_widget.dart' show SaveListingWidget;
import 'package:flutter/material.dart';

class SaveListingModel extends FlutterFlowModel<SaveListingWidget> {
  ///  Local state fields for this page.

  int selectedTabIndex = 0;

  bool isInitialItemsFetching = false;

  bool isInitialServicesFetching = false;

  List<dynamic> itemsListJson = [];
  void addToItemsListJson(dynamic item) => itemsListJson.add(item);
  void removeFromItemsListJson(dynamic item) => itemsListJson.remove(item);
  void removeAtIndexFromItemsListJson(int index) =>
      itemsListJson.removeAt(index);
  void insertAtIndexInItemsListJson(int index, dynamic item) =>
      itemsListJson.insert(index, item);
  void updateItemsListJsonAtIndex(int index, Function(dynamic) updateFn) =>
      itemsListJson[index] = updateFn(itemsListJson[index]);

  List<dynamic> servicesListJson = [];
  void addToServicesListJson(dynamic item) => servicesListJson.add(item);
  void removeFromServicesListJson(dynamic item) =>
      servicesListJson.remove(item);
  void removeAtIndexFromServicesListJson(int index) =>
      servicesListJson.removeAt(index);
  void insertAtIndexInServicesListJson(int index, dynamic item) =>
      servicesListJson.insert(index, item);
  void updateServicesListJsonAtIndex(int index, Function(dynamic) updateFn) =>
      servicesListJson[index] = updateFn(servicesListJson[index]);

  int currentItemsPageIndex = 2;

  int currentServicesPageIndex = 2;

  bool isLoadingMoreItems = false;

  bool isLoadingMoreServices = false;

  bool isInitialServiceLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User Saved Listing)] action in SaveListing widget.
  ApiCallResponse? initialItemListingResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (User Saved Listing)] action in Container widget.
  ApiCallResponse? initialServiceApiResponse;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel1;
  // Stores action output result for [Backend Call - API (User Saved Listing)] action in Column widget.
  ApiCallResponse? refreshItemListingResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? unbookmarkResponse;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel1;
  // Stores action output result for [Backend Call - API (User Saved Listing)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreItemApiResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedItemList;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel2;
  // Stores action output result for [Backend Call - API (User Listing)] action in Column widget.
  ApiCallResponse? refreshedServiceApiResponse;
  // Stores action output result for [Backend Call - API (Bookmark Item)] action in Container widget.
  ApiCallResponse? unbookmarkServiceResponse;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel2;
  // Stores action output result for [Backend Call - API (User Listing)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreServiceApiResponse;
  // Stores action output result for [Custom Action - addJsonList] action in BaseButtonComponent widget.
  List<dynamic>? returnedServiceList;

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
