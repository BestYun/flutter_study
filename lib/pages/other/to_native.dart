import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToNativePage extends StatefulWidget {
  final String title;
  ToNativePage({this.title});

  @override
  _ToNativePage createState() => _ToNativePage();
}

class _ToNativePage extends State<ToNativePage> {
  static const platform = const MethodChannel('com.readchen/goToNativePage');
  Future<void> _goToNativePage() async {
    try {
      final int result = await platform
          .invokeMethod('goToNativePage', {'test': 'from flutter'});
      print(result);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  nativeView() {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: 'plugins.bms_video_player/view',
        onPlatformViewCreated: null,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: 'plugins.bms_video_player/view',
        onPlatformViewCreated: null,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('去原生界面'),
              onPressed: _goToNativePage,
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            Text(
              "Flutter 页面",
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                fontFamily: "Georgia",
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
