import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverlayWidge();
  }
}

class _OverlayWidge extends State<OverlayWidget> {
  bool _isShow = false;
  OverlayEntry _overlay;

  OverlayEntry _createSelectViewWithContext(BuildContext context) {
    //屏幕宽高
    RenderBox renderBox = context.findRenderObject();
    var screenSize = renderBox.size;

    //正式创建Overlay
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        width: screenSize.width,
        height: 182,
        child: Stack(children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _isShow = false;
              });
              //点击背景 隐藏窗口
              _showOverlay(_isShow);
            },
            child: Container(
              width: screenSize.width,
              color: Colors.orange, //黑色 26透明度背景
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 24, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[],
                )
              ],
            ),
          ), //悬浮窗口自定义
        ]),
      ),
    );
  }

//现实显示具体方法 在需要的地方掉用即可
  _showOverlay(bool isShow) {
    if (isShow) {
      _overlay = _createSelectViewWithContext(context);
      Overlay.of(context).insert(_overlay);
    } else {
      _overlay.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("overlay_widget"),
      ),
      body: Center(
        child: RaisedButton(
          child: Container(
            width: 80,
            height: 40,
          ),
          onPressed: () {
            _showOverlay(!_isShow);
          },
        ),
      ),
    );
  }
}
