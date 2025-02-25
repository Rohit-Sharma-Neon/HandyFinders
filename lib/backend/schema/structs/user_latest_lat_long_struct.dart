// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLatestLatLongStruct extends BaseStruct {
  UserLatestLatLongStruct({
    double? lat,
    double? long,
  })  : _lat = lat,
        _long = long;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "long" field.
  double? _long;
  double get long => _long ?? 0.0;
  set long(double? val) => _long = val;

  void incrementLong(double amount) => long = long + amount;

  bool hasLong() => _long != null;

  static UserLatestLatLongStruct fromMap(Map<String, dynamic> data) =>
      UserLatestLatLongStruct(
        lat: castToType<double>(data['lat']),
        long: castToType<double>(data['long']),
      );

  static UserLatestLatLongStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLatestLatLongStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'long': _long,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'long': serializeParam(
          _long,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserLatestLatLongStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserLatestLatLongStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        long: deserializeParam(
          data['long'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserLatestLatLongStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLatestLatLongStruct &&
        lat == other.lat &&
        long == other.long;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, long]);
}

UserLatestLatLongStruct createUserLatestLatLongStruct({
  double? lat,
  double? long,
}) =>
    UserLatestLatLongStruct(
      lat: lat,
      long: long,
    );
