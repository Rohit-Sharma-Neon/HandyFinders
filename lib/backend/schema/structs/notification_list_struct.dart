// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationListStruct extends BaseStruct {
  NotificationListStruct({
    int? currentPage,
    List<NotificationDataStruct>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    int? total,
  })  : _currentPage = currentPage,
        _data = data,
        _firstPageUrl = firstPageUrl,
        _from = from,
        _lastPage = lastPage,
        _total = total;

  // "current_page" field.
  int? _currentPage;
  int get currentPage => _currentPage ?? 0;
  set currentPage(int? val) => _currentPage = val;

  void incrementCurrentPage(int amount) => currentPage = currentPage + amount;

  bool hasCurrentPage() => _currentPage != null;

  // "data" field.
  List<NotificationDataStruct>? _data;
  List<NotificationDataStruct> get data => _data ?? const [];
  set data(List<NotificationDataStruct>? val) => _data = val;

  void updateData(Function(List<NotificationDataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  // "first_page_url" field.
  String? _firstPageUrl;
  String get firstPageUrl => _firstPageUrl ?? '';
  set firstPageUrl(String? val) => _firstPageUrl = val;

  bool hasFirstPageUrl() => _firstPageUrl != null;

  // "from" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;

  void incrementFrom(int amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "last_page" field.
  int? _lastPage;
  int get lastPage => _lastPage ?? 0;
  set lastPage(int? val) => _lastPage = val;

  void incrementLastPage(int amount) => lastPage = lastPage + amount;

  bool hasLastPage() => _lastPage != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static NotificationListStruct fromMap(Map<String, dynamic> data) =>
      NotificationListStruct(
        currentPage: castToType<int>(data['current_page']),
        data: getStructList(
          data['data'],
          NotificationDataStruct.fromMap,
        ),
        firstPageUrl: data['first_page_url'] as String?,
        from: castToType<int>(data['from']),
        lastPage: castToType<int>(data['last_page']),
        total: castToType<int>(data['total']),
      );

  static NotificationListStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'current_page': _currentPage,
        'data': _data?.map((e) => e.toMap()).toList(),
        'first_page_url': _firstPageUrl,
        'from': _from,
        'last_page': _lastPage,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'current_page': serializeParam(
          _currentPage,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
        'first_page_url': serializeParam(
          _firstPageUrl,
          ParamType.String,
        ),
        'from': serializeParam(
          _from,
          ParamType.int,
        ),
        'last_page': serializeParam(
          _lastPage,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static NotificationListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationListStruct(
        currentPage: deserializeParam(
          data['current_page'],
          ParamType.int,
          false,
        ),
        data: deserializeStructParam<NotificationDataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: NotificationDataStruct.fromSerializableMap,
        ),
        firstPageUrl: deserializeParam(
          data['first_page_url'],
          ParamType.String,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.int,
          false,
        ),
        lastPage: deserializeParam(
          data['last_page'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NotificationListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NotificationListStruct &&
        currentPage == other.currentPage &&
        listEquality.equals(data, other.data) &&
        firstPageUrl == other.firstPageUrl &&
        from == other.from &&
        lastPage == other.lastPage &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([currentPage, data, firstPageUrl, from, lastPage, total]);
}

NotificationListStruct createNotificationListStruct({
  int? currentPage,
  String? firstPageUrl,
  int? from,
  int? lastPage,
  int? total,
}) =>
    NotificationListStruct(
      currentPage: currentPage,
      firstPageUrl: firstPageUrl,
      from: from,
      lastPage: lastPage,
      total: total,
    );
