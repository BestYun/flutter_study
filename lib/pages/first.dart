import 'package:flutter/material.dart';
import 'package:flutter_study/model/list_item.dart';

import 'package:flutter_study/pages/overlay_widget.dart';
import 'package:flutter_study/pages/widgets/safe_area_page.dart';
import 'package:flutter_study/utils/log_util.dart';
import 'package:flutter_study/utils/num_ext.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  void initState() {
    LogUtil.log("_FirstPageState init");
    super.initState();
  }

  List<ListItemData> data = [
    ListItemData(
        title: "SafeArea",
        page: SafeAreaPage(
          title: "SafeArea",
        )),
    ListItemData(title: "Overlay", page: OverlayWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    LogUtil.v("first page = " + 100.adapter().toString());
// #2ABFE3 #4499EC
    return Scaffold(
      appBar: AppBar(
        title: Text("first"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          ListItemData item = data[index];
          return GestureDetector(
            child: Container(
              child: Text(item.title),
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xff666666))),
              ),
              margin: EdgeInsets.all(10),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return item.page;
              }));
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
