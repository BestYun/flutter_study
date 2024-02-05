import 'package:flutter_app/pages/home_page.dart';
import 'package:go_router/go_router.dart';

enum PageName {
  home,
}

// GoRouter configuration
final routes = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
