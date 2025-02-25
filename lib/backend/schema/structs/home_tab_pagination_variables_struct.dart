// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeTabPaginationVariablesStruct extends BaseStruct {
  HomeTabPaginationVariablesStruct({
    int? apiLastPageNumber,
    int? currentPageIndex,
    bool? isLoadingMore,
  })  : _apiLastPageNumber = apiLastPageNumber,
        _currentPageIndex = currentPageIndex,
        _isLoadingMore = isLoadingMore;

  // "apiLastPageNumber" field.
  int? _apiLastPageNumber;
  int get apiLastPageNumber => _apiLastPageNumber ?? 0;
  set apiLastPageNumber(int? val) => _apiLastPageNumber = val;

  void incrementApiLastPageNumber(int amount) =>
      apiLastPageNumber = apiLastPageNumber + amount;

  bool hasApiLastPageNumber() => _apiLastPageNumber != null;

  // "currentPageIndex" field.
  int? _currentPageIndex;
  int get currentPageIndex => _currentPageIndex ?? 0;
  set currentPageIndex(int? val) => _currentPageIndex = val;

  void incrementCurrentPageIndex(int amount) =>
      currentPageIndex = currentPageIndex + amount;

  bool hasCurrentPageIndex() => _currentPageIndex != null;

  // "isLoadingMore" field.
  bool? _isLoadingMore;
  bool get isLoadingMore => _isLoadingMore ?? false;
  set isLoadingMore(bool? val) => _isLoadingMore = val;

  bool hasIsLoadingMore() => _isLoadingMore != null;

  static HomeTabPaginationVariablesStruct fromMap(Map<String, dynamic> data) =>
      HomeTabPaginationVariablesStruct(
        apiLastPageNumber: castToType<int>(data['apiLastPageNumber']),
        currentPageIndex: castToType<int>(data['currentPageIndex']),
        isLoadingMore: data['isLoadingMore'] as bool?,
      );

  static HomeTabPaginationVariablesStruct? maybeFromMap(dynamic data) => data
          is Map
      ? HomeTabPaginationVariablesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'apiLastPageNumber': _apiLastPageNumber,
        'currentPageIndex': _currentPageIndex,
        'isLoadingMore': _isLoadingMore,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apiLastPageNumber': serializeParam(
          _apiLastPageNumber,
          ParamType.int,
        ),
        'currentPageIndex': serializeParam(
          _currentPageIndex,
          ParamType.int,
        ),
        'isLoadingMore': serializeParam(
          _isLoadingMore,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HomeTabPaginationVariablesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomeTabPaginationVariablesStruct(
        apiLastPageNumber: deserializeParam(
          data['apiLastPageNumber'],
          ParamType.int,
          false,
        ),
        currentPageIndex: deserializeParam(
          data['currentPageIndex'],
          ParamType.int,
          false,
        ),
        isLoadingMore: deserializeParam(
          data['isLoadingMore'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'HomeTabPaginationVariablesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HomeTabPaginationVariablesStruct &&
        apiLastPageNumber == other.apiLastPageNumber &&
        currentPageIndex == other.currentPageIndex &&
        isLoadingMore == other.isLoadingMore;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([apiLastPageNumber, currentPageIndex, isLoadingMore]);
}

HomeTabPaginationVariablesStruct createHomeTabPaginationVariablesStruct({
  int? apiLastPageNumber,
  int? currentPageIndex,
  bool? isLoadingMore,
}) =>
    HomeTabPaginationVariablesStruct(
      apiLastPageNumber: apiLastPageNumber,
      currentPageIndex: currentPageIndex,
      isLoadingMore: isLoadingMore,
    );
