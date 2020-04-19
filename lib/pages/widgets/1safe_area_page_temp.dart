import 'package:flutter/material.dart';

class SafeAreaPage extends StatefulWidget {
  String title;
  SafeAreaPage({this.title});

  @override
  _SafeAreaPageState createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}
