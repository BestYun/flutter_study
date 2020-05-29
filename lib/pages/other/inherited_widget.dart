import 'package:flutter/material.dart';

typedef NextPlay = void Function(int);

class InheritedWidgetPage extends StatefulWidget {
  final String title;
  InheritedWidgetPage({this.title});

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  String url = "http://www.baidu.com";
  int count;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("InheritedWidget 夸层级传值 count = $count"),
            Container(
              child: FlatButton(
                color: Colors.blueAccent,
                child: Text("change url"),
                onPressed: () {
                  setState(() {
                    url = url == "http://www.test.com"
                        ? "http://api.test.com"
                        : "http://www.test.com";
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: MyInheritedWidget(
                child: _FirstLevel(),
                url: url,
                nextPlay: (int index) {
                  print("nextPlay = " + index.toString());
                  setState(() {
                    count = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("_FirstLevel "),
          Container(
            margin: EdgeInsets.all(10),
            child: _SecondLelveWidget(),
          ),
        ],
      ),
    );
  }
}

class _SecondLelveWidget extends StatefulWidget {
  @override
  __SecondLelveWidgetState createState() => __SecondLelveWidgetState();
}

class __SecondLelveWidgetState extends State<_SecondLelveWidget> {
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("__SecondLelveWidgetState didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);

    return Container(
      child: Column(
        children: <Widget>[
          Text("_SecondLevel currentIndex = " + currentIndex.toString()),
          Text("url = " + myInheritedWidget.url),
          FlatButton(
            color: Colors.blueAccent,
            child: Text("play"),
            onPressed: () {
              setState(() {
                currentIndex += 1;
              });
              myInheritedWidget.nextPlay(currentIndex);
            },
          ),
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final String url;
  final NextPlay nextPlay;

  const MyInheritedWidget({this.url, this.nextPlay, Widget child})
      : super(child: child);

  /// 定义一个便捷方法，方便子树中的widget获取共享数据
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget

  @override
  bool updateShouldNotify(MyInheritedWidget old) =>
      nextPlay != old.nextPlay || url != old.url;
}
