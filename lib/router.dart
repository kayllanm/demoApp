// GoRouter configuration
import 'package:demoapp/bottom_navigation.dart';
import 'package:demoapp/views/account/account.dart';
import 'package:demoapp/views/calendar/calendar_view.dart';
import 'package:demoapp/views/home.dart';
import 'package:demoapp/views/internet/internet_speed_test.dart';
import 'package:demoapp/views/support.dart';
import 'package:demoapp/views/wifi/wifi_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
    AppRouter._();
  static final _instance = AppRouter._();
  factory AppRouter() => _instance;

  // private navigators
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> networkTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> supportTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> accountTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  //main menu
  static const root = '/';
  static const home = '/home';
  static const wifi = '/wifi';
  static const calendar = '/calendar';
  static const internet = '/internet';

  //bottom navigation
  static const support = '/support';
  static const account = '/account';

  static final GoRouter _router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: root,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: home,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: networkTabNavigatorKey,
            routes: [
              GoRoute(
                path: wifi,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const WifiDetailsPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: supportTabNavigatorKey,
            routes: [
              GoRoute(
                path: support,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const SupportPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: accountTabNavigatorKey,
            routes: [
              GoRoute(
                path: account,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const AccountPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: root,
        pageBuilder: (context, state) {
          return getPage(
            child: const HomePage(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: wifi,
        pageBuilder: (context, state) {
          return getPage(
            child: const WifiDetailsPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: calendar,
        pageBuilder: (context, state) {
          return getPage(
            child: const CalendarPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: internet,
        pageBuilder: (context, state) {
          return getPage(
            child: const InternetSpeedTest(),
            state: state,
          );
        },
      ),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  static GoRouter get router => _router;
}


