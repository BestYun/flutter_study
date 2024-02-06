import 'package:flutter/material.dart';
import 'package:flutter_app/model/user_model.dart';
import 'package:flutter_app/router/navigator_util.dart';
import 'package:flutter_app/router/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (bc, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              const model = UserModel(age: 18, name: "yun");
              NavigatorUtil.pushNamed(PageName.page2.name,
                  queryParameters: {"name": "yun"}, extra: model);

              // pushName(name);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("f"),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
