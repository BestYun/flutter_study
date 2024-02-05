import 'package:flutter/material.dart';

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
          return ListTile(
            title: Text("index = $index"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
