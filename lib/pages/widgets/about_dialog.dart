import 'package:flutter/material.dart';

class AboutDialogPage extends StatefulWidget {
  final String title;
  AboutDialogPage({this.title});

  @override
  _AboutDialogPageState createState() => _AboutDialogPageState();
}

class _AboutDialogPageState extends State<AboutDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text('show'),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationIcon: Icon(
                  Icons.insert_emoticon,
                  size: 40,
                ),
                applicationName: '应用程序',
                applicationVersion: '1.0.0',
                applicationLegalese: 'copyright 老孟，一枚有态度的程序员',
                children: <Widget>[
                  Container(
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 30,
                    color: Colors.green,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
