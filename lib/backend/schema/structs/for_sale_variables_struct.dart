// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ForSaleVariablesStruct extends BaseStruct {
  ForSaleVariablesStruct({
    String? searchedString,
    List<String>? selectedCategories,
  })  : _searchedString = searchedString,
        _selectedCategories = selectedCategories;

  // "searchedString" field.
  String? _searchedString;
  String get searchedString => _searchedString ?? '';
  set searchedString(String? val) => _searchedString = val;

  bool hasSearchedString() => _searchedString != null;

  // "selectedCategories" field.
  List<String>? _selectedCategories;
  List<String> get selectedCategories => _selectedCategories ?? const [];
  set selectedCategories(List<String>? val) => _selectedCategories = val;

  void updateSelectedCategories(Function(List<String>) updateFn) {
    updateFn(_selectedCategories ??= []);
  }

  bool hasSelectedCategories() => _selectedCategories != null;

  static ForSaleVariablesStruct fromMap(Map<String, dynamic> data) =>
      ForSaleVariablesStruct(
        searchedString: data['searchedString'] as String?,
        selectedCategories: getDataList(data['selectedCategories']),
      );

  static ForSaleVariablesStruct? maybeFromMap(dynamic data) => data is Map
      ? ForSaleVariablesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'searchedString': _searchedString,
        'selectedCategories': _selectedCategories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'searchedString': serializeParam(
          _searchedString,
          ParamType.String,
        ),
        'selectedCategories': serializeParam(
          _selectedCategories,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ForSaleVariablesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ForSaleVariablesStruct(
        searchedString: deserializeParam(
          data['searchedString'],
          ParamType.String,
          false,
        ),
        selectedCategories: deserializeParam<String>(
          data['selectedCategories'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ForSaleVariablesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ForSaleVariablesStruct &&
        searchedString == other.searchedString &&
        listEquality.equals(selectedCategories, other.selectedCategories);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([searchedString, selectedCategories]);
}

ForSaleVariablesStruct createForSaleVariablesStruct({
  String? searchedString,
}) =>
    ForSaleVariablesStruct(
      searchedString: searchedString,
    );
