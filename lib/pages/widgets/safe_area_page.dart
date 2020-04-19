import 'package:flutter/material.dart';

class SafeAreaPage extends StatefulWidget {
  final String title;
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
      body: SafeArea(
        // bottom: false,
        // minimum: EdgeInsets.all(100),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("top"),
              Text("bottom"),
            ],
          ),
        ),
      ),
    );
  }
}
