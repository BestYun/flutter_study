import 'package:flutter/material.dart';
import 'package:flutter_study/providers/video_model.dart';
import 'package:provider/provider.dart';

typedef NextPlay = void Function(int);

class ProviderPage extends StatefulWidget {
  final String title;
  ProviderPage({this.title});

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
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
      body: ChangeNotifierProvider(
        create: (_) => VideoTestModel(),
        child: Container(
          width: double.infinity,
          child: Consumer<VideoTestModel>(
            builder: (c, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "InheritedWidget 夸层级传值 count =" + model.count.toString()),
                  Container(
                    child: FlatButton(
                      color: Colors.blueAccent,
                      child: Text("change url"),
                      onPressed: () {
                        setState(() {
                          String url = model.url == "http://www.test.com"
                              ? "http://api.test.com"
                              : "http://www.test.com";
                          model.updateUrl(url);
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),

                    child: _FirstLevel(),
                    // nextPlay: (int index) {
                    //   print("nextPlay = " + index.toString());
                    //   setState(() {
                    //     count = index;
                    //   });
                    // },
                  ),
                ],
              );
            },
            child: Container(
              color: Colors.redAccent,
            ),
          ),
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("__SecondLelveWidgetState didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<VideoTestModel>(
        builder: (context2, model, child) {
          return Column(
            children: <Widget>[
              Text("_SecondLevel currentIndex = " + model.count.toString()),
              Text("url = " + model.url),
              Text("count = " + model.count.toString()),
              FlatButton(
                color: Colors.blueAccent,
                child: Text("play"),
                onPressed: () {
                  model.increment();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
