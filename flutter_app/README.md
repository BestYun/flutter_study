# flutter_app
> Flutter 3.16.9 

## Getting Started

## Widgets

## 路由
### 1)安装
```
go_router: ^13.1.0
```

### 2)router配置
```
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

MaterialApp.router(
      routerConfig: routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
        ),
      ),
    )

```

3)api

```
goNamed

pushNamed

```

## log

## 网络

## 状态管理
### provider
### getx


## mvvm

## 插件

## 生命周期