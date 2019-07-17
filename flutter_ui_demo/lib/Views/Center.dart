import 'package:flutter/material.dart';

class CenterDemo extends StatefulWidget {
  @override
  _CenterDemo createState() => _CenterDemo();
}

class _CenterDemo extends State<CenterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListDemo'),
      ),
  body: new Center(child: new Text("我是中心"),
  heightFactor: 100,)
    );
  }
}