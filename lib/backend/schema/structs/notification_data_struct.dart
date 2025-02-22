// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationDataStruct extends BaseStruct {
  NotificationDataStruct({
    int? id,
    int? userId,
    int? senderId,
    String? title,
    String? type,
    String? message,
    int? isSeen,
    String? createdAt,
  })  : _id = id,
        _userId = userId,
        _senderId = senderId,
        _title = title,
        _type = type,
        _message = message,
        _isSeen = isSeen,
        _createdAt = createdAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "sender_id" field.
  int? _senderId;
  int get senderId => _senderId ?? 0;
  set senderId(int? val) => _senderId = val;

  void incrementSenderId(int amount) => senderId = senderId + amount;

  bool hasSenderId() => _senderId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "is_seen" field.
  int? _isSeen;
  int get isSeen => _isSeen ?? 0;
  set isSeen(int? val) => _isSeen = val;

  void incrementIsSeen(int amount) => isSeen = isSeen + amount;

  bool hasIsSeen() => _isSeen != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static NotificationDataStruct fromMap(Map<String, dynamic> data) =>
      NotificationDataStruct(
        id: castToType<int>(data['id']),
        userId: castToType<int>(data['user_id']),
        senderId: castToType<int>(data['sender_id']),
        title: data['title'] as String?,
        type: data['type'] as String?,
        message: data['message'] as String?,
        isSeen: castToType<int>(data['is_seen']),
        createdAt: data['created_at'] as String?,
      );

  static NotificationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId,
        'sender_id': _senderId,
        'title': _title,
        'type': _type,
        'message': _message,
        'is_seen': _isSeen,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'sender_id': serializeParam(
          _senderId,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'is_seen': serializeParam(
          _isSeen,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        senderId: deserializeParam(
          data['sender_id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        isSeen: deserializeParam(
          data['is_seen'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationDataStruct &&
        id == other.id &&
        userId == other.userId &&
        senderId == other.senderId &&
        title == other.title &&
        type == other.type &&
        message == other.message &&
        isSeen == other.isSeen &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, userId, senderId, title, type, message, isSeen, createdAt]);
}

NotificationDataStruct createNotificationDataStruct({
  int? id,
  int? userId,
  int? senderId,
  String? title,
  String? type,
  String? message,
  int? isSeen,
  String? createdAt,
}) =>
    NotificationDataStruct(
      id: id,
      userId: userId,
      senderId: senderId,
      title: title,
      type: type,
      message: message,
      isSeen: isSeen,
      createdAt: createdAt,
    );
