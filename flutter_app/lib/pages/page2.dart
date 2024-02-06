import 'package:flutter/material.dart';
import 'package:flutter_app/model/user_model.dart';

class Page2 extends StatelessWidget {
  final String? name;
  final UserModel userModel;
  const Page2({super.key, required this.userModel, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 2"),
      ),
      body: Column(
        children: [
          Text("name = $name"),
          const Text("userModel---"),
          Text("user model name = ${userModel.name}"),
          Text("user model age = ${userModel.age}")
        ],
      ),
    );
  }
}
