// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesResponseStruct extends BaseStruct {
  CategoriesResponseStruct({
    bool? status,
    String? message,
    List<CategoriesListDataStruct>? data,
  })  : _status = status,
        _message = message,
        _data = data;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;

  bool hasStatus() => _status != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "data" field.
  List<CategoriesListDataStruct>? _data;
  List<CategoriesListDataStruct> get data => _data ?? const [];
  set data(List<CategoriesListDataStruct>? val) => _data = val;

  void updateData(Function(List<CategoriesListDataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static CategoriesResponseStruct fromMap(Map<String, dynamic> data) =>
      CategoriesResponseStruct(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: getStructList(
          data['data'],
          CategoriesListDataStruct.fromMap,
        ),
      );

  static CategoriesResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'message': _message,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CategoriesResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoriesResponseStruct(
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam<CategoriesListDataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: CategoriesListDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CategoriesResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CategoriesResponseStruct &&
        status == other.status &&
        message == other.message &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([status, message, data]);
}

CategoriesResponseStruct createCategoriesResponseStruct({
  bool? status,
  String? message,
}) =>
    CategoriesResponseStruct(
      status: status,
      message: message,
    );
