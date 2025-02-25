import '/backend/api_requests/api_calls.dart';
import '/components/base_button_component_widget.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_and_ratings_widget.dart' show ReviewAndRatingsWidget;
import 'package:flutter/material.dart';

class ReviewAndRatingsModel extends FlutterFlowModel<ReviewAndRatingsWidget> {
  ///  Local state fields for this page.

  bool isInitialLoading = false;

  List<dynamic> reviewsJosnList = [];
  void addToReviewsJosnList(dynamic item) => reviewsJosnList.add(item);
  void removeFromReviewsJosnList(dynamic item) => reviewsJosnList.remove(item);
  void removeAtIndexFromReviewsJosnList(int index) =>
      reviewsJosnList.removeAt(index);
  void insertAtIndexInReviewsJosnList(int index, dynamic item) =>
      reviewsJosnList.insert(index, item);
  void updateReviewsJosnListAtIndex(int index, Function(dynamic) updateFn) =>
      reviewsJosnList[index] = updateFn(reviewsJosnList[index]);

  bool isLoadingMore = false;

  int currentPageIndex = 2;

  int totalReviews = 0;

  double fiveStarPercentage = 0.0;

  double fourStarPercentage = 0.0;

  double threeStarPercentage = 0.0;

  double twoStarPercentage = 0.0;

  double oneStarPercentage = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User Review Detail)] action in ReviewAndRatings widget.
  ApiCallResponse? initialApiResponse;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // Stores action output result for [Backend Call - API (User Review Detail)] action in Column widget.
  ApiCallResponse? refreshedReviewResponse;
  // Stores action output result for [Backend Call - API (Report Comment)] action in Container widget.
  ApiCallResponse? reportCommentResponse;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (User Review Detail)] action in BaseButtonComponent widget.
  ApiCallResponse? loadMoreResponse;
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
