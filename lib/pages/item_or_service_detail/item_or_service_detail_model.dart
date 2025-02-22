import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/ic_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'item_or_service_detail_widget.dart' show ItemOrServiceDetailWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemOrServiceDetailModel
    extends FlutterFlowModel<ItemOrServiceDetailWidget> {
  ///  Local state fields for this page.

  bool isFetchingData = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Service or Item Details)] action in ItemOrServiceDetail widget.
  ApiCallResponse? apiResponse;
  // Model for IcBack component.
  late IcBackModel icBackModel;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

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
