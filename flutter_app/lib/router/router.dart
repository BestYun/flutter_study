import 'package:flutter/material.dart';
import 'package:flutter_app/model/user_model.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/page2.dart';
import 'package:go_router/go_router.dart';

import '../global.dart';
import '../utils/log_util.dart';

enum PageName {
  home,
  page2,
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did push route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did pop route');
  }
}

// GoRouter configuration
final routes = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,
  observers: [MyNavigatorObserver()],
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: PageName.home.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/page2',
      name: PageName.page2.name,
      builder: (context, GoRouterState state) {
        return Page2(
          name: state.uri.queryParameters['name'],
          userModel: state.extra as UserModel,
        );
      },
    ),
  ],
);
