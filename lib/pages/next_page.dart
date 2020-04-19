import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/http/http_manager.dart';
import 'package:flutter_study/model/index.dart';
import 'package:flutter_study/model/user.dart';
import 'package:flutter_study/utils/log_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        // color: Colors.red,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NextPage();
                  }));
                },
              ),
              Text(
                "next page count = ${_count}",
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _count += 10;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.touch_app),
                onPressed: () {
                  LogUtil.log("pop");
                  Navigator.of(context).pop("/");
                },
              ),
              IconButton(
                icon: Icon(Icons.tag_faces),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "toast", gravity: ToastGravity.CENTER);
                },
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("get requetst"),
                  color: Colors.blue,
                ),
                onTap: () {
                  LogUtil.v("get");
                  // var dio = Dio();
                  // dio.get("http://127.0.0.1:8888/index").then((result) {
                  //   LogUtil.v(result);
                  // });

                  // HttpManager().get(
                  //   url: "/index",
                  //   successCallback: (data) {
                  //     // LogUtil.v(data);
                  //     var index = Index.fromJson(data);
                  //     LogUtil.v(index.data);
                  //   },
                  //   errorCallback: (e) {
                  //     LogUtil.v(e);
                  //   },
                  //   tag: null,
                  // );

                  HttpManager().get(
                    url: "/users",
                    successCallback: (data) {
                      // LogUtil.v(data);
                      // var index = Index.fromJson(data);
                      LogUtil.v(data["data"]);

                      List<User> users = data["data"]
                          .map<User>((e) => e == null
                              ? null
                              : User.fromJson(e as Map<String, dynamic>))
                          .toList();

                      LogUtil.v(users);
                    },
                    errorCallback: (e) {
                      LogUtil.v(e);
                    },
                    tag: null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
