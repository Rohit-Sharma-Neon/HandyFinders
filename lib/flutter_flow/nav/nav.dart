import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => SplashWidget(),
        ),
        FFRoute(
          name: WalkthroughWidget.routeName,
          path: WalkthroughWidget.routePath,
          builder: (context, params) => WalkthroughWidget(
            walkthroughData: params.getParam<dynamic>(
              'walkthroughData',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: GetStartedWidget.routeName,
          path: GetStartedWidget.routePath,
          builder: (context, params) => GetStartedWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(
            showBackButton: params.getParam(
              'showBackButton',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: OTPVerifyWidget.routeName,
          path: OTPVerifyWidget.routePath,
          builder: (context, params) => OTPVerifyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            isForgettingPassword: params.getParam(
              'isForgettingPassword',
              ParamType.bool,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: CreateUpdateProfileWidget.routeName,
          path: CreateUpdateProfileWidget.routePath,
          builder: (context, params) => CreateUpdateProfileWidget(
            isUpdating: params.getParam(
              'isUpdating',
              ParamType.bool,
            ),
            authToken: params.getParam(
              'authToken',
              ParamType.String,
            ),
            userEmail: params.getParam(
              'userEmail',
              ParamType.String,
            ),
            hideBackButton: params.getParam(
              'hideBackButton',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: HomeTabWidget.routeName,
          path: HomeTabWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomeTab')
              : HomeTabWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: DeleteAccountWidget.routeName,
          path: DeleteAccountWidget.routePath,
          builder: (context, params) => DeleteAccountWidget(),
        ),
        FFRoute(
          name: AllowLocationWidget.routeName,
          path: AllowLocationWidget.routePath,
          builder: (context, params) => AllowLocationWidget(),
        ),
        FFRoute(
          name: AboutUsWidget.routeName,
          path: AboutUsWidget.routePath,
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: TermsAndConditionsWidget.routeName,
          path: TermsAndConditionsWidget.routePath,
          builder: (context, params) => TermsAndConditionsWidget(),
        ),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: ProfileTabWidget.routeName,
          path: ProfileTabWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfileTab')
              : ProfileTabWidget(),
        ),
        FFRoute(
          name: MessageTabWidget.routeName,
          path: MessageTabWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MessageTab')
              : MessageTabWidget(),
        ),
        FFRoute(
          name: YourPostWidget.routeName,
          path: YourPostWidget.routePath,
          builder: (context, params) => YourPostWidget(),
        ),
        FFRoute(
          name: YourListingWidget.routeName,
          path: YourListingWidget.routePath,
          builder: (context, params) => YourListingWidget(
            hideBackButton: params.getParam(
              'hideBackButton',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ReviewAndRatingsWidget.routeName,
          path: ReviewAndRatingsWidget.routePath,
          builder: (context, params) => ReviewAndRatingsWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: CategoriesWidget.routeName,
          path: CategoriesWidget.routePath,
          builder: (context, params) => CategoriesWidget(),
        ),
        FFRoute(
          name: ForSaleTabWidget.routeName,
          path: ForSaleTabWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ForSaleTab')
              : ForSaleTabWidget(),
        ),
        FFRoute(
          name: NewestItemsWidget.routeName,
          path: NewestItemsWidget.routePath,
          builder: (context, params) => NewestItemsWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ServicesWidget.routeName,
          path: ServicesWidget.routePath,
          builder: (context, params) => ServicesWidget(),
        ),
        FFRoute(
          name: PostOnFeedWidget.routeName,
          path: PostOnFeedWidget.routePath,
          builder: (context, params) => PostOnFeedWidget(),
        ),
        FFRoute(
          name: OtherUserProfileWidget.routeName,
          path: OtherUserProfileWidget.routePath,
          builder: (context, params) => OtherUserProfileWidget(
            userId: params.getParam(
              'userId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CategoryItemsWidget.routeName,
          path: CategoryItemsWidget.routePath,
          builder: (context, params) => CategoryItemsWidget(
            appBarTitle: params.getParam(
              'appBarTitle',
              ParamType.String,
            ),
            categoryIdName: params.getParam(
              'categoryIdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PostRequestForumWidget.routeName,
          path: PostRequestForumWidget.routePath,
          builder: (context, params) => PostRequestForumWidget(
            isUpdating: params.getParam(
              'isUpdating',
              ParamType.bool,
            ),
            jsonData: params.getParam(
              'jsonData',
              ParamType.JSON,
            ),
            itemIndex: params.getParam(
              'itemIndex',
              ParamType.int,
            ),
            isUpdatingRequestBottomTab: params.getParam(
              'isUpdatingRequestBottomTab',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PostTipAdviceWidget.routeName,
          path: PostTipAdviceWidget.routePath,
          builder: (context, params) => PostTipAdviceWidget(),
        ),
        FFRoute(
          name: ItemOrServiceDetailWidget.routeName,
          path: ItemOrServiceDetailWidget.routePath,
          builder: (context, params) => ItemOrServiceDetailWidget(
            listingType: params.getParam(
              'listingType',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddUpdateListingWidget.routeName,
          path: AddUpdateListingWidget.routePath,
          builder: (context, params) => AddUpdateListingWidget(
            isUpdating: params.getParam(
              'isUpdating',
              ParamType.bool,
            ),
            data: params.getParam(
              'data',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: SaveListingWidget.routeName,
          path: SaveListingWidget.routePath,
          builder: (context, params) => SaveListingWidget(
            hideBackButton: params.getParam(
              'hideBackButton',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RequestTabWidget.routeName,
          path: RequestTabWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'RequestTab')
              : RequestTabWidget(),
        ),
        FFRoute(
          name: ServiceList2Widget.routeName,
          path: ServiceList2Widget.routePath,
          builder: (context, params) => ServiceList2Widget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerifyEmailOtpWidget.routeName,
          path: VerifyEmailOtpWidget.routePath,
          builder: (context, params) => VerifyEmailOtpWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            isForgettingPassword: params.getParam(
              'isForgettingPassword',
              ParamType.bool,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            isUpdatingEmail: params.getParam(
              'isUpdatingEmail',
              ParamType.int,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
