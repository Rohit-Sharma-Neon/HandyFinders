import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
    });
    _safeInit(() {
      _IsRememberMe = prefs.getBool('ff_IsRememberMe') ?? _IsRememberMe;
    });
    _safeInit(() {
      _userEmail = prefs.getString('ff_userEmail') ?? _userEmail;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _userProfileImageUrl =
          prefs.getString('ff_userProfileImageUrl') ?? _userProfileImageUrl;
    });
    _safeInit(() {
      _deviceToken = prefs.getString('ff_deviceToken') ?? _deviceToken;
    });
    _safeInit(() {
      _deviceUniqueId = prefs.getString('ff_deviceUniqueId') ?? _deviceUniqueId;
    });
    _safeInit(() {
      _userMobile = prefs.getString('ff_userMobile') ?? _userMobile;
    });
    _safeInit(() {
      _userDob = prefs.getString('ff_userDob') ?? _userDob;
    });
    _safeInit(() {
      _userCountryCode =
          prefs.getString('ff_userCountryCode') ?? _userCountryCode;
    });
    _safeInit(() {
      _isWalkthroughCompleted =
          prefs.getBool('ff_isWalkthroughCompleted') ?? _isWalkthroughCompleted;
    });
    _safeInit(() {
      _isProfileCreated =
          prefs.getInt('ff_isProfileCreated') ?? _isProfileCreated;
    });
    _safeInit(() {
      _rememberMeEmail =
          prefs.getString('ff_rememberMeEmail') ?? _rememberMeEmail;
    });
    _safeInit(() {
      _rememberMePassword =
          prefs.getString('ff_rememberMePassword') ?? _rememberMePassword;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _userFirstName = prefs.getString('ff_userFirstName') ?? _userFirstName;
    });
    _safeInit(() {
      _userLastName = prefs.getString('ff_userLastName') ?? _userLastName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
  }

  List<int> _Items10ForDummyUI = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> get Items10ForDummyUI => _Items10ForDummyUI;
  set Items10ForDummyUI(List<int> value) {
    _Items10ForDummyUI = value;
  }

  void addToItems10ForDummyUI(int value) {
    Items10ForDummyUI.add(value);
  }

  void removeFromItems10ForDummyUI(int value) {
    Items10ForDummyUI.remove(value);
  }

  void removeAtIndexFromItems10ForDummyUI(int index) {
    Items10ForDummyUI.removeAt(index);
  }

  void updateItems10ForDummyUIAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    Items10ForDummyUI[index] = updateFn(_Items10ForDummyUI[index]);
  }

  void insertAtIndexInItems10ForDummyUI(int index, int value) {
    Items10ForDummyUI.insert(index, value);
  }

  bool _IsRememberMe = false;
  bool get IsRememberMe => _IsRememberMe;
  set IsRememberMe(bool value) {
    _IsRememberMe = value;
    prefs.setBool('ff_IsRememberMe', value);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
    prefs.setString('ff_userEmail', value);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  String _userProfileImageUrl = '';
  String get userProfileImageUrl => _userProfileImageUrl;
  set userProfileImageUrl(String value) {
    _userProfileImageUrl = value;
    prefs.setString('ff_userProfileImageUrl', value);
  }

  String _deviceToken = 'dummydevicetoken';
  String get deviceToken => _deviceToken;
  set deviceToken(String value) {
    _deviceToken = value;
    prefs.setString('ff_deviceToken', value);
  }

  String _deviceUniqueId = 'dummyuniqueid';
  String get deviceUniqueId => _deviceUniqueId;
  set deviceUniqueId(String value) {
    _deviceUniqueId = value;
    prefs.setString('ff_deviceUniqueId', value);
  }

  String _userMobile = '';
  String get userMobile => _userMobile;
  set userMobile(String value) {
    _userMobile = value;
    prefs.setString('ff_userMobile', value);
  }

  String _userDob = '';
  String get userDob => _userDob;
  set userDob(String value) {
    _userDob = value;
    prefs.setString('ff_userDob', value);
  }

  String _userCountryCode = '';
  String get userCountryCode => _userCountryCode;
  set userCountryCode(String value) {
    _userCountryCode = value;
    prefs.setString('ff_userCountryCode', value);
  }

  bool _isWalkthroughCompleted = false;
  bool get isWalkthroughCompleted => _isWalkthroughCompleted;
  set isWalkthroughCompleted(bool value) {
    _isWalkthroughCompleted = value;
    prefs.setBool('ff_isWalkthroughCompleted', value);
  }

  int _isProfileCreated = 0;
  int get isProfileCreated => _isProfileCreated;
  set isProfileCreated(int value) {
    _isProfileCreated = value;
    prefs.setInt('ff_isProfileCreated', value);
  }

  String _rememberMeEmail = '';
  String get rememberMeEmail => _rememberMeEmail;
  set rememberMeEmail(String value) {
    _rememberMeEmail = value;
    prefs.setString('ff_rememberMeEmail', value);
  }

  String _rememberMePassword = '';
  String get rememberMePassword => _rememberMePassword;
  set rememberMePassword(String value) {
    _rememberMePassword = value;
    prefs.setString('ff_rememberMePassword', value);
  }

  bool _isHomeTabInitialApiLoaded = false;
  bool get isHomeTabInitialApiLoaded => _isHomeTabInitialApiLoaded;
  set isHomeTabInitialApiLoaded(bool value) {
    _isHomeTabInitialApiLoaded = value;
  }

  bool _isRequestTabPrimaryApiLoaded = false;
  bool get isRequestTabPrimaryApiLoaded => _isRequestTabPrimaryApiLoaded;
  set isRequestTabPrimaryApiLoaded(bool value) {
    _isRequestTabPrimaryApiLoaded = value;
  }

  bool _isRequestTabSecondaryApiLoaded = false;
  bool get isRequestTabSecondaryApiLoaded => _isRequestTabSecondaryApiLoaded;
  set isRequestTabSecondaryApiLoaded(bool value) {
    _isRequestTabSecondaryApiLoaded = value;
  }

  bool _isForSalePrimaryApiLoaded = false;
  bool get isForSalePrimaryApiLoaded => _isForSalePrimaryApiLoaded;
  set isForSalePrimaryApiLoaded(bool value) {
    _isForSalePrimaryApiLoaded = value;
  }

  bool _isForSaleSecondaryApiLoaded = false;
  bool get isForSaleSecondaryApiLoaded => _isForSaleSecondaryApiLoaded;
  set isForSaleSecondaryApiLoaded(bool value) {
    _isForSaleSecondaryApiLoaded = value;
  }

  bool _isMessageTabInitialApiLoaded = false;
  bool get isMessageTabInitialApiLoaded => _isMessageTabInitialApiLoaded;
  set isMessageTabInitialApiLoaded(bool value) {
    _isMessageTabInitialApiLoaded = value;
  }

  CategoriesResponseStruct _appStateCategories = CategoriesResponseStruct();
  CategoriesResponseStruct get appStateCategories => _appStateCategories;
  set appStateCategories(CategoriesResponseStruct value) {
    _appStateCategories = value;
  }

  void updateAppStateCategoriesStruct(
      Function(CategoriesResponseStruct) updateFn) {
    updateFn(_appStateCategories);
  }

  List<dynamic> _yourTipAdviceList = [];
  List<dynamic> get yourTipAdviceList => _yourTipAdviceList;
  set yourTipAdviceList(List<dynamic> value) {
    _yourTipAdviceList = value;
  }

  void addToYourTipAdviceList(dynamic value) {
    yourTipAdviceList.add(value);
  }

  void removeFromYourTipAdviceList(dynamic value) {
    yourTipAdviceList.remove(value);
  }

  void removeAtIndexFromYourTipAdviceList(int index) {
    yourTipAdviceList.removeAt(index);
  }

  void updateYourTipAdviceListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    yourTipAdviceList[index] = updateFn(_yourTipAdviceList[index]);
  }

  void insertAtIndexInYourTipAdviceList(int index, dynamic value) {
    yourTipAdviceList.insert(index, value);
  }

  List<dynamic> _yourPostForumList = [];
  List<dynamic> get yourPostForumList => _yourPostForumList;
  set yourPostForumList(List<dynamic> value) {
    _yourPostForumList = value;
  }

  void addToYourPostForumList(dynamic value) {
    yourPostForumList.add(value);
  }

  void removeFromYourPostForumList(dynamic value) {
    yourPostForumList.remove(value);
  }

  void removeAtIndexFromYourPostForumList(int index) {
    yourPostForumList.removeAt(index);
  }

  void updateYourPostForumListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    yourPostForumList[index] = updateFn(_yourPostForumList[index]);
  }

  void insertAtIndexInYourPostForumList(int index, dynamic value) {
    yourPostForumList.insert(index, value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  List<dynamic> _yourListingItems = [];
  List<dynamic> get yourListingItems => _yourListingItems;
  set yourListingItems(List<dynamic> value) {
    _yourListingItems = value;
  }

  void addToYourListingItems(dynamic value) {
    yourListingItems.add(value);
  }

  void removeFromYourListingItems(dynamic value) {
    yourListingItems.remove(value);
  }

  void removeAtIndexFromYourListingItems(int index) {
    yourListingItems.removeAt(index);
  }

  void updateYourListingItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    yourListingItems[index] = updateFn(_yourListingItems[index]);
  }

  void insertAtIndexInYourListingItems(int index, dynamic value) {
    yourListingItems.insert(index, value);
  }

  List<dynamic> _yourListingServices = [];
  List<dynamic> get yourListingServices => _yourListingServices;
  set yourListingServices(List<dynamic> value) {
    _yourListingServices = value;
  }

  void addToYourListingServices(dynamic value) {
    yourListingServices.add(value);
  }

  void removeFromYourListingServices(dynamic value) {
    yourListingServices.remove(value);
  }

  void removeAtIndexFromYourListingServices(int index) {
    yourListingServices.removeAt(index);
  }

  void updateYourListingServicesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    yourListingServices[index] = updateFn(_yourListingServices[index]);
  }

  void insertAtIndexInYourListingServices(int index, dynamic value) {
    yourListingServices.insert(index, value);
  }

  List<dynamic> _homeTabPostList = [];
  List<dynamic> get homeTabPostList => _homeTabPostList;
  set homeTabPostList(List<dynamic> value) {
    _homeTabPostList = value;
  }

  void addToHomeTabPostList(dynamic value) {
    homeTabPostList.add(value);
  }

  void removeFromHomeTabPostList(dynamic value) {
    homeTabPostList.remove(value);
  }

  void removeAtIndexFromHomeTabPostList(int index) {
    homeTabPostList.removeAt(index);
  }

  void updateHomeTabPostListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    homeTabPostList[index] = updateFn(_homeTabPostList[index]);
  }

  void insertAtIndexInHomeTabPostList(int index, dynamic value) {
    homeTabPostList.insert(index, value);
  }

  List<dynamic> _homeTabCategoriesList = [];
  List<dynamic> get homeTabCategoriesList => _homeTabCategoriesList;
  set homeTabCategoriesList(List<dynamic> value) {
    _homeTabCategoriesList = value;
  }

  void addToHomeTabCategoriesList(dynamic value) {
    homeTabCategoriesList.add(value);
  }

  void removeFromHomeTabCategoriesList(dynamic value) {
    homeTabCategoriesList.remove(value);
  }

  void removeAtIndexFromHomeTabCategoriesList(int index) {
    homeTabCategoriesList.removeAt(index);
  }

  void updateHomeTabCategoriesListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    homeTabCategoriesList[index] = updateFn(_homeTabCategoriesList[index]);
  }

  void insertAtIndexInHomeTabCategoriesList(int index, dynamic value) {
    homeTabCategoriesList.insert(index, value);
  }

  List<dynamic> _requestTabCurrentList = [];
  List<dynamic> get requestTabCurrentList => _requestTabCurrentList;
  set requestTabCurrentList(List<dynamic> value) {
    _requestTabCurrentList = value;
  }

  void addToRequestTabCurrentList(dynamic value) {
    requestTabCurrentList.add(value);
  }

  void removeFromRequestTabCurrentList(dynamic value) {
    requestTabCurrentList.remove(value);
  }

  void removeAtIndexFromRequestTabCurrentList(int index) {
    requestTabCurrentList.removeAt(index);
  }

  void updateRequestTabCurrentListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    requestTabCurrentList[index] = updateFn(_requestTabCurrentList[index]);
  }

  void insertAtIndexInRequestTabCurrentList(int index, dynamic value) {
    requestTabCurrentList.insert(index, value);
  }

  List<dynamic> _requestTabCompletedList = [];
  List<dynamic> get requestTabCompletedList => _requestTabCompletedList;
  set requestTabCompletedList(List<dynamic> value) {
    _requestTabCompletedList = value;
  }

  void addToRequestTabCompletedList(dynamic value) {
    requestTabCompletedList.add(value);
  }

  void removeFromRequestTabCompletedList(dynamic value) {
    requestTabCompletedList.remove(value);
  }

  void removeAtIndexFromRequestTabCompletedList(int index) {
    requestTabCompletedList.removeAt(index);
  }

  void updateRequestTabCompletedListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    requestTabCompletedList[index] = updateFn(_requestTabCompletedList[index]);
  }

  void insertAtIndexInRequestTabCompletedList(int index, dynamic value) {
    requestTabCompletedList.insert(index, value);
  }

  dynamic _forSaleData;
  dynamic get forSaleData => _forSaleData;
  set forSaleData(dynamic value) {
    _forSaleData = value;
  }

  dynamic _forFreeData;
  dynamic get forFreeData => _forFreeData;
  set forFreeData(dynamic value) {
    _forFreeData = value;
  }

  String _userFirstName = '';
  String get userFirstName => _userFirstName;
  set userFirstName(String value) {
    _userFirstName = value;
    prefs.setString('ff_userFirstName', value);
  }

  String _userLastName = '';
  String get userLastName => _userLastName;
  set userLastName(String value) {
    _userLastName = value;
    prefs.setString('ff_userLastName', value);
  }

  int _requestTabPrimaryPageIndex = 0;
  int get requestTabPrimaryPageIndex => _requestTabPrimaryPageIndex;
  set requestTabPrimaryPageIndex(int value) {
    _requestTabPrimaryPageIndex = value;
  }

  int _requestTabSecondaryPageIndex = 0;
  int get requestTabSecondaryPageIndex => _requestTabSecondaryPageIndex;
  set requestTabSecondaryPageIndex(int value) {
    _requestTabSecondaryPageIndex = value;
  }

  int _requestTabPrimaryLastPage = 0;
  int get requestTabPrimaryLastPage => _requestTabPrimaryLastPage;
  set requestTabPrimaryLastPage(int value) {
    _requestTabPrimaryLastPage = value;
  }

  int _requestTabSecondaryLastPage = 0;
  int get requestTabSecondaryLastPage => _requestTabSecondaryLastPage;
  set requestTabSecondaryLastPage(int value) {
    _requestTabSecondaryLastPage = value;
  }

  bool _isHomePageSearching = false;
  bool get isHomePageSearching => _isHomePageSearching;
  set isHomePageSearching(bool value) {
    _isHomePageSearching = value;
  }

  int _notificationCount = 0;
  int get notificationCount => _notificationCount;
  set notificationCount(int value) {
    _notificationCount = value;
  }

  bool _notificationStatus = false;
  bool get notificationStatus => _notificationStatus;
  set notificationStatus(bool value) {
    _notificationStatus = value;
  }

  UserDataTypeStruct _userDetailsAppState = UserDataTypeStruct();
  UserDataTypeStruct get userDetailsAppState => _userDetailsAppState;
  set userDetailsAppState(UserDataTypeStruct value) {
    _userDetailsAppState = value;
  }

  void updateUserDetailsAppStateStruct(Function(UserDataTypeStruct) updateFn) {
    updateFn(_userDetailsAppState);
  }

  ForSaleVariablesStruct _ForSaleAppStateVariables = ForSaleVariablesStruct();
  ForSaleVariablesStruct get ForSaleAppStateVariables =>
      _ForSaleAppStateVariables;
  set ForSaleAppStateVariables(ForSaleVariablesStruct value) {
    _ForSaleAppStateVariables = value;
  }

  void updateForSaleAppStateVariablesStruct(
      Function(ForSaleVariablesStruct) updateFn) {
    updateFn(_ForSaleAppStateVariables);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
