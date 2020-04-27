import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final String title;
  GridViewPage({this.title});

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: List.generate(50, (i) {
                  return Container(
                    // height: 80,
                    color: Colors.primaries[i % Colors.primaries.length],
                  );
                }),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            children: List.generate(9, (i) {
              return Container(
                // height: 80,
                color: Colors.primaries[i % Colors.primaries.length],
              );
            }),
          )
        ],
      ),
    );
  }
}
