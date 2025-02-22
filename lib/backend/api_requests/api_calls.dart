import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HandyFinders APIs Group Code

class HandyFindersAPIsGroup {
  static String getBaseUrl() =>
      'https://demo.dev9server.com/handy-finders/api/v1/';
  static Map<String, String> headers = {
    'authtoken': 'handy_finders_access_token',
  };
  static LoginCall loginCall = LoginCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static VerifyOtpCall verifyOtpCall = VerifyOtpCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static CheckUserCall checkUserCall = CheckUserCall();
  static SignUpCall signUpCall = SignUpCall();
  static CreateUpdateProfileCall createUpdateProfileCall =
      CreateUpdateProfileCall();
  static ResendOTPCall resendOTPCall = ResendOTPCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static NotificationListCall notificationListCall = NotificationListCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static GetCategoriesListingCall getCategoriesListingCall =
      GetCategoriesListingCall();
  static HomeCategoriesCall homeCategoriesCall = HomeCategoriesCall();
  static AddItemOrServiceCall addItemOrServiceCall = AddItemOrServiceCall();
  static AddUpdateRequestTipCall addUpdateRequestTipCall =
      AddUpdateRequestTipCall();
  static HomePostListCall homePostListCall = HomePostListCall();
  static YourPostCall yourPostCall = YourPostCall();
  static UserListingCall userListingCall = UserListingCall();
  static UpdateNotificationStatusCall updateNotificationStatusCall =
      UpdateNotificationStatusCall();
  static BookmarkItemCall bookmarkItemCall = BookmarkItemCall();
  static RemoveRequestCall removeRequestCall = RemoveRequestCall();
  static UserSavedListingCall userSavedListingCall = UserSavedListingCall();
  static UserReviewDetailCall userReviewDetailCall = UserReviewDetailCall();
  static RemoveItemCall removeItemCall = RemoveItemCall();
  static ReportCommentCall reportCommentCall = ReportCommentCall();
  static RequestBottomTabCall requestBottomTabCall = RequestBottomTabCall();
  static ReportPostCall reportPostCall = ReportPostCall();
  static UsersListCall usersListCall = UsersListCall();
  static GiveReviewCall giveReviewCall = GiveReviewCall();
  static MarkRequestAsCompletedCall markRequestAsCompletedCall =
      MarkRequestAsCompletedCall();
  static ForSaleListCall forSaleListCall = ForSaleListCall();
  static ForFreeListCall forFreeListCall = ForFreeListCall();
  static AllSaleItemLIstCall allSaleItemLIstCall = AllSaleItemLIstCall();
  static AllSaleServiceListCall allSaleServiceListCall =
      AllSaleServiceListCall();
  static ServiceOrItemDetailsCall serviceOrItemDetailsCall =
      ServiceOrItemDetailsCall();
  static RequestTipCommentListCall requestTipCommentListCall =
      RequestTipCommentListCall();
  static AddCommentCall addCommentCall = AddCommentCall();
  static GetCurrencyListCall getCurrencyListCall = GetCurrencyListCall();
  static GetConditionListCall getConditionListCall = GetConditionListCall();
  static WalkthroughDetailsCall walkthroughDetailsCall =
      WalkthroughDetailsCall();
  static LikeDislikeCall likeDislikeCall = LikeDislikeCall();
  static GetNotificationCountCall getNotificationCountCall =
      GetNotificationCountCall();
  static CategoryItemsCall categoryItemsCall = CategoryItemsCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? deviceToken = '',
    String? deviceUniqueid = '',
    String? deviceType = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}signin',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
        'password': password,
        'device_token': deviceToken,
        'device_uniqueid': deviceUniqueid,
        'device_type': deviceType,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? bearerToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  int? isProfileCreated(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.is_profile_created''',
      ));
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user_name''',
      ));
  String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  int? apiUserId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? apiCountryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.country_code''',
      ));
  String? apiProfilePictureUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.profile_picture''',
      ));
  int? apiNotificationStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.notification_status''',
      ));
  String? apiFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.first_name''',
      ));
  String? apiLastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.last_name''',
      ));
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ForgotPassword',
      apiUrl: '${baseUrl}forgot-password',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VerifyOtpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'VerifyOtp',
      apiUrl: '${baseUrl}verify-otp',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
        'otp': otp,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ResetPassword',
      apiUrl: '${baseUrl}reset-password',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CheckUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CheckUser',
      apiUrl: '${baseUrl}check-user',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? deviceType = '',
    String? deviceToken = '',
    String? deviceUniqueid = '',
    String? otp = '',
    String? isdontAskon = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl: '${baseUrl}signup',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
        'password': password,
        'device_type': deviceType,
        'device_token': deviceToken,
        'device_uniqueid': deviceUniqueid,
        'otp': otp,
        'isdont_askon': isdontAskon,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class CreateUpdateProfileCall {
  Future<ApiCallResponse> call({
    String? userName = '',
    String? phoneNumber = '',
    String? countryCode = '',
    String? dob = '',
    String? key = '1',
    FFUploadedFile? profilePicture,
    String? authToken = '',
    String? firstName = '',
    String? lastName = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CreateUpdateProfile',
      apiUrl: '${baseUrl}create-edit-profile',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'user_name': userName,
        'phone_number': phoneNumber,
        'country_code': countryCode,
        'dob': dob,
        'key': "1",
        'profile_picture': profilePicture,
        'first_name': firstName,
        'last_name': lastName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? apiUserName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user_name''',
      ));
  String? apiEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  String? apiCountryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.country_code''',
      ));
  String? apiMobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.mobile''',
      ));
  String? apiProfilePicture(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.profile_picture_url''',
      ));
  String? apiDob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dob''',
      ));
}

class ResendOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Resend OTP',
      apiUrl: '${baseUrl}send-otp',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
      },
      params: {
        'email': email,
        'is_resend': "1",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? deviceType = '',
    String? deviceToken = '',
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}logout',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'device_type': deviceType,
        'device_token': deviceToken,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Profile',
      apiUrl: '${baseUrl}get-profile',
      callType: ApiCallType.GET,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? apiUserName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user_name''',
      ));
  String? apiEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  String? apiCountryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.country_code''',
      ));
  String? apiMobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.mobile''',
      ));
  String? apiDob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dob''',
      ));
  String? apiFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.first_name''',
      ));
  String? apiLastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.last_name''',
      ));
  String? apiProfilePictureUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.profile_picture''',
      ));
  int? apiNotificationStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.notification_status''',
      ));
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Account',
      apiUrl: '${baseUrl}delete-account',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class NotificationListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? page = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Notification List',
      apiUrl: '${baseUrl}notification-list',
      callType: ApiCallType.GET,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '${baseUrl}change-password',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetCategoriesListingCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Categories Listing',
      apiUrl: '${baseUrl}get-categories',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List<String>? apiCategoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiCategoryImage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiCreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? apiItemId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class HomeCategoriesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Home Categories',
      apiUrl: '${baseUrl}get-categories',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddItemOrServiceCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? categoryId = '',
    String? title = '',
    int? isFree,
    String? price = '',
    String? salePrice = '',
    int? isNegotiable,
    String? currency = '',
    String? condition = '',
    String? description = '',
    FFUploadedFile? image1,
    FFUploadedFile? image2,
    FFUploadedFile? image3,
    FFUploadedFile? image4,
    FFUploadedFile? image5,
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add Item or Service',
      apiUrl: '${baseUrl}add-item',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'type': type,
        'category_id': categoryId,
        'title': title,
        'is_free': isFree,
        'price': price,
        'sale_price': salePrice,
        'is_negotiable': isNegotiable,
        'currency': currency,
        'condition': condition,
        'description': description,
        'image1': image1,
        'image2': image2,
        'image3': image3,
        'image4': image4,
        'image5': image5,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddUpdateRequestTipCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? title = '',
    String? type = '',
    String? categoryId = '',
    String? description = '',
    String? cost = '',
    FFUploadedFile? image1,
    FFUploadedFile? image2,
    FFUploadedFile? image3,
    FFUploadedFile? image4,
    FFUploadedFile? image5,
    String? postId = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add Update Request Tip',
      apiUrl: '${baseUrl}add-request-tip',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'title': title,
        'type': type,
        'category_id': categoryId,
        'description': description,
        'cost': cost,
        'image1': image1,
        'image2': image2,
        'image3': image3,
        'image4': image4,
        'image5': image5,
        'post_id': postId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class HomePostListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? latitude = '',
    String? longitude = '',
    String? search = '',
    String? categoryName = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Home Post List',
      apiUrl: '${baseUrl}request-tip-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'latitude': latitude,
        'longitude': longitude,
        'search': search,
        'category_name': categoryName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  List<String>? testing(dynamic response) => (getJsonField(
        response,
        r'''$.data1.data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class YourPostCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? authToken = '',
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Your Post',
      apiUrl: '${baseUrl}user-post-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'type': type,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiDataList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  String? apiTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data1.data[:].title''',
      ));
  String? apiDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data1.data[:].description''',
      ));
  int? apiCost(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.data[:].cost''',
      ));
  String? apiUpdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data1.data[:].updated_at''',
      ));
  int? apiIsLiked(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.data[:].is_liked''',
      ));
  String? apiImages(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data1.data[:].images[:].image''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class UserListingCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? type = '',
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Listing',
      apiUrl: '${baseUrl}user-item-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'type': type,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class UpdateNotificationStatusCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? statusKey,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Notification Status',
      apiUrl: '${baseUrl}update-notification-status',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'status_key': statusKey,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class BookmarkItemCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? itemId = '',
    int? statusKey,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Bookmark Item',
      apiUrl: '${baseUrl}bookmark-item',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'item_id': itemId,
        'status_key': statusKey,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RemoveRequestCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? postId = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Request',
      apiUrl: '${baseUrl}remove-request',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UserSavedListingCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? type = '',
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Saved Listing',
      apiUrl: '${baseUrl}user-saved-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'type': type,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class UserReviewDetailCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? userId = '',
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Review Detail',
      apiUrl: '${baseUrl}user-review-detail',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'user_id': userId,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  double? overallRating(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data1.averagerating''',
      ));
  int? totalReviews(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.totalreviews''',
      ));
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.reviewslist.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.reviewslist.last_page''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.reviewslist.data''',
        true,
      ) as List?;
  dynamic apiUserDetails(dynamic response) => getJsonField(
        response,
        r'''$.data1.user_detail''',
      );
}

class RemoveItemCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? itemId,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Item',
      apiUrl: '${baseUrl}remove-item',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'item_id': itemId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ReportCommentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? commentId = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Report Comment',
      apiUrl: '${baseUrl}report-comment',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'comment_id': commentId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RequestBottomTabCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? type = '',
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request Bottom Tab',
      apiUrl: '${baseUrl}my-request-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'type': type,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class ReportPostCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? postId,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Report Post',
      apiUrl: '${baseUrl}report-post',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UsersListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Users List',
      apiUrl: '${baseUrl}user-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1''',
        true,
      ) as List?;
}

class GiveReviewCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? otherUserId,
    String? rating = '',
    int? requestId,
    String? review = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Give Review',
      apiUrl: '${baseUrl}leave-review',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'other_user_id': otherUserId,
        'rating': rating,
        'review': review,
        'request_id': requestId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class MarkRequestAsCompletedCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? postId,
    String? userName = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Mark Request As Completed',
      apiUrl: '${baseUrl}complete-request',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
        'user_name': userName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ForSaleListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'For Sale List',
      apiUrl: '${baseUrl}item-sale-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiItemList(dynamic response) => getJsonField(
        response,
        r'''$.data1.item_list''',
        true,
      ) as List?;
  List? apiServiceList(dynamic response) => getJsonField(
        response,
        r'''$.data1.service_list''',
        true,
      ) as List?;
}

class ForFreeListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'For Free List',
      apiUrl: '${baseUrl}item-free-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiItemList(dynamic response) => getJsonField(
        response,
        r'''$.data1.item_list''',
        true,
      ) as List?;
  List? apiServiceList(dynamic response) => getJsonField(
        response,
        r'''$.data1.service_list''',
        true,
      ) as List?;
}

class AllSaleItemLIstCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? page,
    String? type = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'All Sale Item LIst',
      apiUrl: '${baseUrl}all-item-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
        'type': type,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class AllSaleServiceListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? page,
    String? type = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'All Sale Service List',
      apiUrl: '${baseUrl}all-service-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
        'type': type,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class ServiceOrItemDetailsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? itemId,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Service or Item Details',
      apiUrl: '${baseUrl}item-detail',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'item_id': itemId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic apiJsonData(dynamic response) => getJsonField(
        response,
        r'''$.data1''',
      );
  List? imageList(dynamic response) => getJsonField(
        response,
        r'''$.data1.item_images''',
        true,
      ) as List?;
}

class RequestTipCommentListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? postId,
    int? page,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request Tip Comment List',
      apiUrl: '${baseUrl}request-tip-comment-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
        'page': page,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

class AddCommentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? postId,
    String? comment = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add Comment',
      apiUrl: '${baseUrl}add-request-tip-comment',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
        'comment': comment,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic apiCommentObject(dynamic response) => getJsonField(
        response,
        r'''$.data1''',
      );
}

class GetCurrencyListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Currency List',
      apiUrl: '${baseUrl}currency-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1''',
        true,
      ) as List?;
}

class GetConditionListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Condition List',
      apiUrl: '${baseUrl}currency-list',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1''',
        true,
      ) as List?;
}

class WalkthroughDetailsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Walkthrough Details',
      apiUrl: '${baseUrl}welcome-text',
      callType: ApiCallType.GET,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class LikeDislikeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? postId,
    int? statusKey,
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Like Dislike',
      apiUrl: '${baseUrl}like-dislike-request-tip',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'post_id': postId,
        'status_key': statusKey,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetNotificationCountCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification Count',
      apiUrl: '${baseUrl}notification-count',
      callType: ApiCallType.GET,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? apiNotificationCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.notification_count''',
      ));
}

class CategoryItemsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? categoryId = '',
    int? page,
    String? search = '',
  }) async {
    final baseUrl = HandyFindersAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Category Items',
      apiUrl: '${baseUrl}item-by-category',
      callType: ApiCallType.POST,
      headers: {
        'authtoken': 'handy_finders_access_token',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'category_id': categoryId,
        'page': page,
        'search': search,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? apiStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? apiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? apiCurrentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.current_page''',
      ));
  List? apiList(dynamic response) => getJsonField(
        response,
        r'''$.data1.data''',
        true,
      ) as List?;
  int? apiLastPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data1.last_page''',
      ));
}

/// End HandyFinders APIs Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
