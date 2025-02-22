import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/base_button_component_widget.dart';
import '/components/ic_back_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  bool isFetchingApi = false;

  int pageIndex = 2;

  bool isLoadingMore = false;

  List<NotificationDataStruct> notificationListData = [];
  void addToNotificationListData(NotificationDataStruct item) =>
      notificationListData.add(item);
  void removeFromNotificationListData(NotificationDataStruct item) =>
      notificationListData.remove(item);
  void removeAtIndexFromNotificationListData(int index) =>
      notificationListData.removeAt(index);
  void insertAtIndexInNotificationListData(
          int index, NotificationDataStruct item) =>
      notificationListData.insert(index, item);
  void updateNotificationListDataAtIndex(
          int index, Function(NotificationDataStruct) updateFn) =>
      notificationListData[index] = updateFn(notificationListData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Notification List)] action in Notifications widget.
  ApiCallResponse? getNotificationsList;
  // Model for IcBackTitle component.
  late IcBackTitleModel icBackTitleModel;
  // Stores action output result for [Backend Call - API (Notification List)] action in Column widget.
  ApiCallResponse? getNotificationsListResponse;
  // Model for BaseButtonComponent component.
  late BaseButtonComponentModel baseButtonComponentModel;
  // Stores action output result for [Backend Call - API (Notification List)] action in BaseButtonComponent widget.
  ApiCallResponse? loadedNotificationsResponse;
  // Stores action output result for [Custom Action - addNotificationListData] action in BaseButtonComponent widget.
  List<NotificationDataStruct>? returnedList;

  @override
  void initState(BuildContext context) {
    icBackTitleModel = createModel(context, () => IcBackTitleModel());
    baseButtonComponentModel =
        createModel(context, () => BaseButtonComponentModel());
  }

  @override
  void dispose() {
    icBackTitleModel.dispose();
    baseButtonComponentModel.dispose();
  }
}
