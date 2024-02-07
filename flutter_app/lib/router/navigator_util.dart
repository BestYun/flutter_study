import 'package:go_router/go_router.dart';
import '../global.dart';

class NavigatorUtil {
  static var context = navigatorKey.currentContext!;

  /// Get a location from route name and parameters.
  ///
  /// context method can't be called during redirects.
  static String namedLocation(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) =>
      GoRouter.of(context).namedLocation(name,
          pathParameters: pathParameters, queryParameters: queryParameters);

  /// Navigate to a location.
  static void go(String location, {Object? extra}) =>
      GoRouter.of(context).go(location, extra: extra);

  /// Navigate to a named route.
  static void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      GoRouter.of(context).goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  /// Push a location onto the page stack.
  ///
  /// See also:
  /// * [pushReplacement] which replaces the top-most page of the page stack and
  ///   always uses a new page key.
  /// * [replace] which replaces the top-most page of the page stack but treats
  ///   it as the same page. The page key will be reused. context will preserve the
  ///   state and not run any page animation.
  static Future<T?> push<T extends Object?>(String location, {Object? extra}) =>
      GoRouter.of(context).push<T>(location, extra: extra);

  /// Navigate to a named route onto the page stack.
  static Future<T?> pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      //GoRouter.of(context)
      // MyNavigatorObserver.getInstance().navigator!.context

      GoRouter.of(context).pushNamed<T>(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  /// Returns `true` if there is more than 1 page on the stack.
  static bool canPop() => GoRouter.of(context).canPop();

  /// Pop the top page off the Navigator's page stack by calling
  /// [Navigator.pop].
  static void pop<T extends Object?>([T? result]) =>
      GoRouter.of(context).pop(result);

  /// Replaces the top-most page of the page stack with the given URL location
  /// w/ optional query parameters, e.g. `/family/f2/person/p1?color=blue`.
  ///
  /// See also:
  /// * [go] which navigates to the location.
  /// * [push] which pushes the given location onto the page stack.
  /// * [replace] which replaces the top-most page of the page stack but treats
  ///   it as the same page. The page key will be reused. context will preserve the
  ///   state and not run any page animation.
  static void pushReplacement(String location, {Object? extra}) =>
      GoRouter.of(context).pushReplacement(location, extra: extra);

  /// Replaces the top-most page of the page stack with the named route w/
  /// optional parameters, e.g. `name='person', pathParameters={'fid': 'f2', 'pid':
  /// 'p1'}`.
  ///
  /// See also:
  /// * [goNamed] which navigates a named route.
  /// * [pushNamed] which pushes a named route onto the page stack.
  static void pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      GoRouter.of(context).pushReplacementNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  /// Replaces the top-most page of the page stack with the given one but treats
  /// it as the same page.
  ///
  /// The page key will be reused. context will preserve the state and not run any
  /// page animation.
  ///
  /// See also:
  /// * [push] which pushes the given location onto the page stack.
  /// * [pushReplacement] which replaces the top-most page of the page stack but
  ///   always uses a new page key.
  static void replace(String location, {Object? extra}) =>
      GoRouter.of(context).replace<Object?>(location, extra: extra);

  /// Replaces the top-most page with the named route and optional parameters,
  /// preserving the page key.
  ///
  /// context will preserve the state and not run any page animation. Optional
  /// parameters can be provided to the named route, e.g. `name='person',
  /// pathParameters={'fid': 'f2', 'pid': 'p1'}`.
  ///
  /// See also:
  /// * [pushNamed] which pushes the given location onto the page stack.
  /// * [pushReplacementNamed] which replaces the top-most page of the page
  ///   stack but always uses a new page key.
  static void replaceNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      GoRouter.of(context).replaceNamed<Object?>(name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra);
}
