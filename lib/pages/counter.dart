import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_study/providers/counter_model.dart';
import 'package:flutter_study/utils/log_util.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    LogUtil.v("_CounterPageState build");
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text("状态管理Counter"),
        ),
        preferredSize: Size.fromHeight(40),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Consumer<CounterModel>(
                  builder: (context, CounterModel counter, child) {
                    return IconButton(
                      icon: Icon(
                        Icons.minimize,
                        size: 40,
                      ),
                      onPressed: () {
                        counter.minus();
                      },
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Consumer<CounterModel>(
                    builder: (
                      context,
                      CounterModel counter,
                      child,
                    ) =>
                        Center(child: Text("count = ${counter.value}")),
                  ),
                ),
                Consumer<CounterModel>(
                  builder: (context, CounterModel counter, _) {
                    return IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 40,
                      ),
                      onPressed: () {
                        counter.increment();
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
