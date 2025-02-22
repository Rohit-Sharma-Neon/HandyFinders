// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataTypeStruct extends BaseStruct {
  UserDataTypeStruct({
    String? username,
    String? firstName,
    String? lastName,
    String? userProfilePhotoUrl,
    double? userRatings,
  })  : _username = username,
        _firstName = firstName,
        _lastName = lastName,
        _userProfilePhotoUrl = userProfilePhotoUrl,
        _userRatings = userRatings;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "userProfilePhotoUrl" field.
  String? _userProfilePhotoUrl;
  String get userProfilePhotoUrl => _userProfilePhotoUrl ?? '';
  set userProfilePhotoUrl(String? val) => _userProfilePhotoUrl = val;

  bool hasUserProfilePhotoUrl() => _userProfilePhotoUrl != null;

  // "userRatings" field.
  double? _userRatings;
  double get userRatings => _userRatings ?? 0.0;
  set userRatings(double? val) => _userRatings = val;

  void incrementUserRatings(double amount) =>
      userRatings = userRatings + amount;

  bool hasUserRatings() => _userRatings != null;

  static UserDataTypeStruct fromMap(Map<String, dynamic> data) =>
      UserDataTypeStruct(
        username: data['username'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        userProfilePhotoUrl: data['userProfilePhotoUrl'] as String?,
        userRatings: castToType<double>(data['userRatings']),
      );

  static UserDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'firstName': _firstName,
        'lastName': _lastName,
        'userProfilePhotoUrl': _userProfilePhotoUrl,
        'userRatings': _userRatings,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'userProfilePhotoUrl': serializeParam(
          _userProfilePhotoUrl,
          ParamType.String,
        ),
        'userRatings': serializeParam(
          _userRatings,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataTypeStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        userProfilePhotoUrl: deserializeParam(
          data['userProfilePhotoUrl'],
          ParamType.String,
          false,
        ),
        userRatings: deserializeParam(
          data['userRatings'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataTypeStruct &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        userProfilePhotoUrl == other.userProfilePhotoUrl &&
        userRatings == other.userRatings;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([username, firstName, lastName, userProfilePhotoUrl, userRatings]);
}

UserDataTypeStruct createUserDataTypeStruct({
  String? username,
  String? firstName,
  String? lastName,
  String? userProfilePhotoUrl,
  double? userRatings,
}) =>
    UserDataTypeStruct(
      username: username,
      firstName: firstName,
      lastName: lastName,
      userProfilePhotoUrl: userProfilePhotoUrl,
      userRatings: userRatings,
    );
