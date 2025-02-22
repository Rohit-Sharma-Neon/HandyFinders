// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesStruct extends BaseStruct {
  ImagesStruct({
    int? id,
    int? tipRequestId,
    String? image,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _tipRequestId = tipRequestId,
        _image = image,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "tip_request_id" field.
  int? _tipRequestId;
  int get tipRequestId => _tipRequestId ?? 0;
  set tipRequestId(int? val) => _tipRequestId = val;

  void incrementTipRequestId(int amount) =>
      tipRequestId = tipRequestId + amount;

  bool hasTipRequestId() => _tipRequestId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static ImagesStruct fromMap(Map<String, dynamic> data) => ImagesStruct(
        id: castToType<int>(data['id']),
        tipRequestId: castToType<int>(data['tip_request_id']),
        image: data['image'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static ImagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'tip_request_id': _tipRequestId,
        'image': _image,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'tip_request_id': serializeParam(
          _tipRequestId,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        tipRequestId: deserializeParam(
          data['tip_request_id'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImagesStruct &&
        id == other.id &&
        tipRequestId == other.tipRequestId &&
        image == other.image &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, tipRequestId, image, createdAt, updatedAt]);
}

ImagesStruct createImagesStruct({
  int? id,
  int? tipRequestId,
  String? image,
  String? createdAt,
  String? updatedAt,
}) =>
    ImagesStruct(
      id: id,
      tipRequestId: tipRequestId,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
