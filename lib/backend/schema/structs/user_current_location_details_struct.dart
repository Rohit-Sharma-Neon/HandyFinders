// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCurrentLocationDetailsStruct extends BaseStruct {
  UserCurrentLocationDetailsStruct({
    String? fullAddress,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    String? lat,
    String? long,
    String? locationName,
  })  : _fullAddress = fullAddress,
        _city = city,
        _state = state,
        _country = country,
        _zipCode = zipCode,
        _lat = lat,
        _long = long,
        _locationName = locationName;

  // "fullAddress" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  set fullAddress(String? val) => _fullAddress = val;

  bool hasFullAddress() => _fullAddress != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "long" field.
  String? _long;
  String get long => _long ?? '';
  set long(String? val) => _long = val;

  bool hasLong() => _long != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  set locationName(String? val) => _locationName = val;

  bool hasLocationName() => _locationName != null;

  static UserCurrentLocationDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserCurrentLocationDetailsStruct(
        fullAddress: data['fullAddress'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        zipCode: data['zipCode'] as String?,
        lat: data['lat'] as String?,
        long: data['long'] as String?,
        locationName: data['locationName'] as String?,
      );

  static UserCurrentLocationDetailsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? UserCurrentLocationDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fullAddress': _fullAddress,
        'city': _city,
        'state': _state,
        'country': _country,
        'zipCode': _zipCode,
        'lat': _lat,
        'long': _long,
        'locationName': _locationName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullAddress': serializeParam(
          _fullAddress,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'zipCode': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'long': serializeParam(
          _long,
          ParamType.String,
        ),
        'locationName': serializeParam(
          _locationName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserCurrentLocationDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserCurrentLocationDetailsStruct(
        fullAddress: deserializeParam(
          data['fullAddress'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zipCode'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        long: deserializeParam(
          data['long'],
          ParamType.String,
          false,
        ),
        locationName: deserializeParam(
          data['locationName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserCurrentLocationDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCurrentLocationDetailsStruct &&
        fullAddress == other.fullAddress &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        zipCode == other.zipCode &&
        lat == other.lat &&
        long == other.long &&
        locationName == other.locationName;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [fullAddress, city, state, country, zipCode, lat, long, locationName]);
}

UserCurrentLocationDetailsStruct createUserCurrentLocationDetailsStruct({
  String? fullAddress,
  String? city,
  String? state,
  String? country,
  String? zipCode,
  String? lat,
  String? long,
  String? locationName,
}) =>
    UserCurrentLocationDetailsStruct(
      fullAddress: fullAddress,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
      lat: lat,
      long: long,
      locationName: locationName,
    );
