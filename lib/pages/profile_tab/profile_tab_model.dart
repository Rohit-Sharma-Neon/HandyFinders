import '/backend/api_requests/api_calls.dart';
import '/components/base_loader_component_widget.dart';
import '/components/gradient_background_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_tab_widget.dart' show ProfileTabWidget;
import 'package:flutter/material.dart';

class ProfileTabModel extends FlutterFlowModel<ProfileTabWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Profile)] action in ProfileTab widget.
  ApiCallResponse? getProfileResponse;
  // Model for gradientBackground component.
  late GradientBackgroundModel gradientBackgroundModel;
  // Model for BaseLoaderComponent component.
  late BaseLoaderComponentModel baseLoaderComponentModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Update Notification Status)] action in Switch widget.
  ApiCallResponse? notificationOnResponse;
  // Stores action output result for [Backend Call - API (Update Notification Status)] action in Switch widget.
  ApiCallResponse? notificationOffResponse;
  // Stores action output result for [Backend Call - API (Logout)] action in Container widget.
  ApiCallResponse? apiStatus;

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
    baseLoaderComponentModel.dispose();
  }
}
