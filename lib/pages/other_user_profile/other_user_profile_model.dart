import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'other_user_profile_widget.dart' show OtherUserProfileWidget;
import 'package:flutter/material.dart';

class OtherUserProfileModel extends FlutterFlowModel<OtherUserProfileWidget> {
  ///  Local state fields for this page.

  bool isFetchingDetails = true;

  bool isLoadingMore = false;

  int currentPageIndex = 1;

  List<dynamic> reviewsJsonList = [];
  void addToReviewsJsonList(dynamic item) => reviewsJsonList.add(item);
  void removeFromReviewsJsonList(dynamic item) => reviewsJsonList.remove(item);
  void removeAtIndexFromReviewsJsonList(int index) =>
      reviewsJsonList.removeAt(index);
  void insertAtIndexInReviewsJsonList(int index, dynamic item) =>
      reviewsJsonList.insert(index, item);
  void updateReviewsJsonListAtIndex(int index, Function(dynamic) updateFn) =>
      reviewsJsonList[index] = updateFn(reviewsJsonList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User Review Detail)] action in OtherUserProfile widget.
  ApiCallResponse? userDetailsResponse;
  // Model for IcBack component.
  late IcBackModel icBackModel;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;

  @override
  void initState(BuildContext context) {
    icBackModel = createModel(context, () => IcBackModel());
    baseLoaderComponentModel =
        createModel(context, () => BaseLoaderComponentModel());
  }

  @override
  void dispose() {
    icBackModel.dispose();
    baseLoaderComponentModel.dispose();
  }
}
