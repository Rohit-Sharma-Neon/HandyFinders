// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailStruct extends BaseStruct {
  UserDetailStruct({
    int? id,
    String? userName,
    String? profilePicture,
    String? longitude,
    String? latitude,
    String? profilePictureUrl,
    String? profilePictureThumbUrl,
  })  : _id = id,
        _userName = userName,
        _profilePicture = profilePicture,
        _longitude = longitude,
        _latitude = latitude,
        _profilePictureUrl = profilePictureUrl,
        _profilePictureThumbUrl = profilePictureThumbUrl;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;

  bool hasProfilePicture() => _profilePicture != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "profile_picture_url" field.
  String? _profilePictureUrl;
  String get profilePictureUrl => _profilePictureUrl ?? '';
  set profilePictureUrl(String? val) => _profilePictureUrl = val;

  bool hasProfilePictureUrl() => _profilePictureUrl != null;

  // "profile_picture_thumb_url" field.
  String? _profilePictureThumbUrl;
  String get profilePictureThumbUrl => _profilePictureThumbUrl ?? '';
  set profilePictureThumbUrl(String? val) => _profilePictureThumbUrl = val;

  bool hasProfilePictureThumbUrl() => _profilePictureThumbUrl != null;

  static UserDetailStruct fromMap(Map<String, dynamic> data) =>
      UserDetailStruct(
        id: castToType<int>(data['id']),
        userName: data['user_name'] as String?,
        profilePicture: data['profile_picture'] as String?,
        longitude: data['longitude'] as String?,
        latitude: data['latitude'] as String?,
        profilePictureUrl: data['profile_picture_url'] as String?,
        profilePictureThumbUrl: data['profile_picture_thumb_url'] as String?,
      );

  static UserDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_name': _userName,
        'profile_picture': _profilePicture,
        'longitude': _longitude,
        'latitude': _latitude,
        'profile_picture_url': _profilePictureUrl,
        'profile_picture_thumb_url': _profilePictureThumbUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'profile_picture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'profile_picture_url': serializeParam(
          _profilePictureUrl,
          ParamType.String,
        ),
        'profile_picture_thumb_url': serializeParam(
          _profilePictureThumbUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDetailStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        profilePicture: deserializeParam(
          data['profile_picture'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        profilePictureUrl: deserializeParam(
          data['profile_picture_url'],
          ParamType.String,
          false,
        ),
        profilePictureThumbUrl: deserializeParam(
          data['profile_picture_thumb_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDetailStruct &&
        id == other.id &&
        userName == other.userName &&
        profilePicture == other.profilePicture &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        profilePictureUrl == other.profilePictureUrl &&
        profilePictureThumbUrl == other.profilePictureThumbUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userName,
        profilePicture,
        longitude,
        latitude,
        profilePictureUrl,
        profilePictureThumbUrl
      ]);
}

UserDetailStruct createUserDetailStruct({
  int? id,
  String? userName,
  String? profilePicture,
  String? longitude,
  String? latitude,
  String? profilePictureUrl,
  String? profilePictureThumbUrl,
}) =>
    UserDetailStruct(
      id: id,
      userName: userName,
      profilePicture: profilePicture,
      longitude: longitude,
      latitude: latitude,
      profilePictureUrl: profilePictureUrl,
      profilePictureThumbUrl: profilePictureThumbUrl,
    );
