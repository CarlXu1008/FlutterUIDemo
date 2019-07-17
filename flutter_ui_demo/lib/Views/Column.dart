import 'package:flutter/material.dart';

class ColumnDemo extends StatefulWidget {
  @override
  _ColumnDemo createState() => _ColumnDemo();
}

class _ColumnDemo extends State<ColumnDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnDemo'),
      ),
  body: new Center(child: new Text("我是中心"),
  heightFactor: 100,)
    );
  }
}