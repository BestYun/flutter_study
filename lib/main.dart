import 'package:flutter/material.dart';
import 'package:flutter_study/config/config.dart';
import 'package:flutter_study/main_tab.dart';
import 'package:flutter_study/providers/counter_model.dart';
import 'package:provider/provider.dart';

void main() {
  config();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>.value(value: CounterModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainTabPage(),
      ),
    );
  }
}
