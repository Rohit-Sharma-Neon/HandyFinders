// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationListDataTypeStruct extends BaseStruct {
  NotificationListDataTypeStruct({
    bool? status,
    String? message,
    NotificationListStruct? notificationList,
  })  : _status = status,
        _message = message,
        _notificationList = notificationList;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;

  bool hasStatus() => _status != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "notification_list" field.
  NotificationListStruct? _notificationList;
  NotificationListStruct get notificationList =>
      _notificationList ?? NotificationListStruct();
  set notificationList(NotificationListStruct? val) => _notificationList = val;

  void updateNotificationList(Function(NotificationListStruct) updateFn) {
    updateFn(_notificationList ??= NotificationListStruct());
  }

  bool hasNotificationList() => _notificationList != null;

  static NotificationListDataTypeStruct fromMap(Map<String, dynamic> data) =>
      NotificationListDataTypeStruct(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        notificationList: data['notification_list'] is NotificationListStruct
            ? data['notification_list']
            : NotificationListStruct.maybeFromMap(data['notification_list']),
      );

  static NotificationListDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? NotificationListDataTypeStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'message': _message,
        'notification_list': _notificationList?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'notification_list': serializeParam(
          _notificationList,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NotificationListDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationListDataTypeStruct(
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        notificationList: deserializeStructParam(
          data['notification_list'],
          ParamType.DataStruct,
          false,
          structBuilder: NotificationListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NotificationListDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationListDataTypeStruct &&
        status == other.status &&
        message == other.message &&
        notificationList == other.notificationList;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, message, notificationList]);
}

NotificationListDataTypeStruct createNotificationListDataTypeStruct({
  bool? status,
  String? message,
  NotificationListStruct? notificationList,
}) =>
    NotificationListDataTypeStruct(
      status: status,
      message: message,
      notificationList: notificationList ?? NotificationListStruct(),
    );
