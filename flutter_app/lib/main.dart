import 'package:flutter/material.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/utils/log_util.dart';

void main() {
  setLogging(enabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
