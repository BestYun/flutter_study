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
              child: Text('CupertinoAlertDialog'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
