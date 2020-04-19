import 'package:flutter/material.dart';
import 'package:flutter_study/model/list_item.dart';
import 'package:flutter_study/pages/other/to_native.dart';
import 'package:flutter_study/utils/log_util.dart';

class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<ListItemData> _data = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    LogUtil.log("_ThreePageState init");
    _data = [
      ListItemData(
        page: ToNativePage(
          title: "to native",
        ),
        title: "to native",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 判断齐刘海
    final topPadding = MediaQuery.of(context).padding.top;
    LogUtil.log("topPadding = " + topPadding.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("other page"),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          ListItemData item = _data[index];

          return GestureDetector(
            child: ListTile(
              title: Text(item.title),
            ),
            onTap: () {
              print("on click");

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => item.page));
            },
          );
        },
        itemCount: _data.length,
      )),
    );
  }
}
