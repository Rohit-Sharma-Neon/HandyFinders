// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileTabVariablesStruct extends BaseStruct {
  ProfileTabVariablesStruct({
    bool? isProfileLoading,
    bool? isProfileLoaded,
  })  : _isProfileLoading = isProfileLoading,
        _isProfileLoaded = isProfileLoaded;

  // "isProfileLoading" field.
  bool? _isProfileLoading;
  bool get isProfileLoading => _isProfileLoading ?? false;
  set isProfileLoading(bool? val) => _isProfileLoading = val;

  bool hasIsProfileLoading() => _isProfileLoading != null;

  // "isProfileLoaded" field.
  bool? _isProfileLoaded;
  bool get isProfileLoaded => _isProfileLoaded ?? false;
  set isProfileLoaded(bool? val) => _isProfileLoaded = val;

  bool hasIsProfileLoaded() => _isProfileLoaded != null;

  static ProfileTabVariablesStruct fromMap(Map<String, dynamic> data) =>
      ProfileTabVariablesStruct(
        isProfileLoading: data['isProfileLoading'] as bool?,
        isProfileLoaded: data['isProfileLoaded'] as bool?,
      );

  static ProfileTabVariablesStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileTabVariablesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isProfileLoading': _isProfileLoading,
        'isProfileLoaded': _isProfileLoaded,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isProfileLoading': serializeParam(
          _isProfileLoading,
          ParamType.bool,
        ),
        'isProfileLoaded': serializeParam(
          _isProfileLoaded,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProfileTabVariablesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProfileTabVariablesStruct(
        isProfileLoading: deserializeParam(
          data['isProfileLoading'],
          ParamType.bool,
          false,
        ),
        isProfileLoaded: deserializeParam(
          data['isProfileLoaded'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProfileTabVariablesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileTabVariablesStruct &&
        isProfileLoading == other.isProfileLoading &&
        isProfileLoaded == other.isProfileLoaded;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isProfileLoading, isProfileLoaded]);
}

ProfileTabVariablesStruct createProfileTabVariablesStruct({
  bool? isProfileLoading,
  bool? isProfileLoaded,
}) =>
    ProfileTabVariablesStruct(
      isProfileLoading: isProfileLoading,
      isProfileLoaded: isProfileLoaded,
    );
