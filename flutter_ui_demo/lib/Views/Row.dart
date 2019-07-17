import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  @override
  _RowDemo createState() => _RowDemo();
}

class _RowDemo extends State<RowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColumnDemo'),
      ),
  body: new Center(child: new Text("_RowDemo"),
  heightFactor: 100,)
    );
  }
}