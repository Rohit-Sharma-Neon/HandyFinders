// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DummyNotificationDataTypeStruct extends BaseStruct {
  DummyNotificationDataTypeStruct({
    String? title,
    String? description,
    String? dateTime,
  })  : _title = title,
        _description = description,
        _dateTime = dateTime;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "dateTime" field.
  String? _dateTime;
  String get dateTime => _dateTime ?? '';
  set dateTime(String? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static DummyNotificationDataTypeStruct fromMap(Map<String, dynamic> data) =>
      DummyNotificationDataTypeStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        dateTime: data['dateTime'] as String?,
      );

  static DummyNotificationDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? DummyNotificationDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static DummyNotificationDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DummyNotificationDataTypeStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DummyNotificationDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DummyNotificationDataTypeStruct &&
        title == other.title &&
        description == other.description &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description, dateTime]);
}

DummyNotificationDataTypeStruct createDummyNotificationDataTypeStruct({
  String? title,
  String? description,
  String? dateTime,
}) =>
    DummyNotificationDataTypeStruct(
      title: title,
      description: description,
      dateTime: dateTime,
    );
