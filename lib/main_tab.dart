import 'package:flutter/material.dart';
import 'package:flutter_study/pages/first.dart';
import 'package:flutter_study/pages/other/three.dart';
import 'package:flutter_study/pages/second.dart';
import 'package:flutter_study/utils/log_util.dart';
import 'package:flutter_study/utils/num_ext.dart';

class MainTabPage extends StatefulWidget {
  MainTabPage({Key key}) : super(key: key);

  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  //   with SingleTickerProviderStateMixin {
  // TabController _tabController;

  // List<Widget> tablist = <Widget>[
  //   Tab(
  //     text: '正在热映',
  //     icon: Icon(Icons.movie),
  //   ),
  //   Tab(
  //     text: '即将上映',
  //     icon: Icon(Icons.movie_filter),
  //   ),
  //   Tab(
  //     text: 'Top250',
  //     icon: Icon(Icons.local_movies),
  //   ),
  // ];

  List<Widget> _pages = [FirstPage(), SecondPage(), ThreePage()];
  int _currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(vsync: this, length: tablist.length);
  // }

  // get tabBar => Container(
  //       // 设置 tabbar 的背景色
  //       // 设置 tabbar 的高度
  //       height: 50,
  //       // 指定 tabbar 组件
  //       child: TabBar(
  //         // 指定 tabbar 的控制器，必须提供控制器，否则 tabbar 不能正常工作
  //         controller: _tabController,
  //         // 设置 tabbar 中文本的样式，注意，height 属性很重要，必须设置为 0，否则文本和图标之间的距离太大，不美观
  //         labelStyle: TextStyle(height: 0, fontSize: 10),
  //         // 设置指示器的颜色
  //         indicatorColor: Colors.red,
  //         // 指定当前 tabbar 总共有几个按钮
  //         tabs: tablist,
  //       ),
  //     );

  final pageController = PageController();

  int currentIndex = 0;
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('widgets')),
    BottomNavigationBarItem(icon: Icon(Icons.music_video), title: Text('听')),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('other'))
  ];

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    LogUtil.v("rpx = " + rpx.toString());
    LogUtil.v("screen width = " + MediaQuery.of(context).size.width.toString());

    NumExt.rpx = rpx;
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _pages,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: Container(
        child: SafeArea(
          child: BottomNavigationBar(
              items: items, currentIndex: currentIndex, onTap: onTap),
        ),
        decoration: BoxDecoration(color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    // _tabController.dispose();
    super.dispose();
  }
}
