import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  final String title;
  AlertDialogPage({this.title});

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('alert dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context2) {
                    return AlertDialog(
                      elevation: 240,
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      title: Text('提示'),
                      content: Text('是否删除'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                        FlatButton(
                          child: Text('确认'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FlatButton(
              child: Text('ios 风格 CupertinoAlertDialog'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context2) {
                    return CupertinoAlertDialog(
                      title: Text('提示'),
                      content: Text('是否删除'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                        FlatButton(
                          child: Text('确认'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FlatButton(
              child: Text('SimpleDialog'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context2) {
                    return SimpleDialog(
                      title: Text('SimpleDialog提示'),
                      children: <Widget>[
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Text('确认删除吗？'),
                        ),
                        Divider(
                          height: 1,
                        ),
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                        Divider(
                          height: 1,
                        ),
                        FlatButton(
                          child: Text('确认'),
                          onPressed: () {
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FlatButton(
              child: Text('Dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context2) {
                    return Dialog(
                      child: Container(
                        color: Colors.lightBlue,
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text('SimpleDialog提示'),
                            Container(
                              height: 80,
                              alignment: Alignment.center,
                              child: Text('确认删除吗？'),
                            ),
                            Divider(
                              height: 1,
                            ),
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () {
                                Navigator.of(context).maybePop();
                              },
                            ),
                            Divider(
                              height: 1,
                            ),
                            FlatButton(
                              child: Text('确认'),
                              onPressed: () {
                                Navigator.of(context).maybePop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
