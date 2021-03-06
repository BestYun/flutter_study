import 'package:flutter/material.dart';
import 'package:flutter_study/model/list_item.dart';
import 'package:flutter_study/pages/other/inherited_widget.dart';
import 'package:flutter_study/pages/other/provider_page.dart';

import 'package:flutter_study/pages/overlay_widget.dart';
import 'package:flutter_study/pages/widgets/about_dialog.dart';
import 'package:flutter_study/pages/widgets/alert_dialog_page.dart';
import 'package:flutter_study/pages/widgets/grid_view_page.dart';
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 暂时放在这，方便刷新
    List<ListItemData> data = [
      ListItemData(
        title: "SafeArea",
        page: SafeAreaPage(
          title: "SafeArea",
        ),
      ),
      ListItemData(
        title: "GridView",
        page: GridViewPage(
          title: "GridView",
        ),
      ),
      ListItemData(title: "Overlay", page: OverlayWidget()),
      ListItemData(
        title: "AboutDialog",
        page: AboutDialogPage(title: "AboutDialog"),
      ),
      ListItemData(
        title: "AlertDialogPage",
        page: AlertDialogPage(title: "AlertDialog"),
      ),
      ListItemData(
        title: "AlertDialogPage",
        page: AlertDialogPage(title: "AlertDialog"),
      ),
      ListItemData(
        title: "InheritedWidgetPage",
        page: InheritedWidgetPage(title: "InheritedWidgetPage"),
      ),
      ListItemData(
        title: "ProviderPage",
        page: ProviderPage(title: "ProviderPage"),
      ),
    ];

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: Text(item.title),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15)),
                Divider(
                  height: 1,
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return item.page;
                  },
                ),
              );
            },
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
