// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekdaysDataTypeStruct extends BaseStruct {
  WeekdaysDataTypeStruct({
    String? weekname,
    int? id,
  })  : _weekname = weekname,
        _id = id;

  // "weekname" field.
  String? _weekname;
  String get weekname => _weekname ?? '';
  set weekname(String? val) => _weekname = val;

  bool hasWeekname() => _weekname != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static WeekdaysDataTypeStruct fromMap(Map<String, dynamic> data) =>
      WeekdaysDataTypeStruct(
        weekname: data['weekname'] as String?,
        id: castToType<int>(data['id']),
      );

  static WeekdaysDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekdaysDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weekname': _weekname,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weekname': serializeParam(
          _weekname,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static WeekdaysDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WeekdaysDataTypeStruct(
        weekname: deserializeParam(
          data['weekname'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WeekdaysDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekdaysDataTypeStruct &&
        weekname == other.weekname &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([weekname, id]);
}

WeekdaysDataTypeStruct createWeekdaysDataTypeStruct({
  String? weekname,
  int? id,
}) =>
    WeekdaysDataTypeStruct(
      weekname: weekname,
      id: id,
    );
