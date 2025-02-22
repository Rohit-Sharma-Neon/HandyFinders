// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropDownStruct extends BaseStruct {
  DropDownStruct({
    int? id,
    String? name,
    String? createdAt,
  })  : _id = id,
        _name = name,
        _createdAt = createdAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static DropDownStruct fromMap(Map<String, dynamic> data) => DropDownStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        createdAt: data['created_at'] as String?,
      );

  static DropDownStruct? maybeFromMap(dynamic data) =>
      data is Map ? DropDownStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static DropDownStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropDownStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DropDownStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropDownStruct &&
        id == other.id &&
        name == other.name &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, createdAt]);
}

DropDownStruct createDropDownStruct({
  int? id,
  String? name,
  String? createdAt,
}) =>
    DropDownStruct(
      id: id,
      name: name,
      createdAt: createdAt,
    );
