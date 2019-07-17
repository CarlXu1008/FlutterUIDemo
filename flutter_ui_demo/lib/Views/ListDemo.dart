import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:async';

class ListDemo extends StatefulWidget {
  @override
  _ListDemo createState() => _ListDemo();
}

class _ListDemo extends State<ListDemo> {

  // 先创建一个 controller
  var controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListDemo'),
      ),
    body: new LayoutBuilder(builder: (context, constraints) {
          return new NotificationListener(
              onNotification: (ScrollNotification note) {
                  print(note.metrics.pixels.toInt());  // 滚动位置。
              },
              child: new ListView.builder(
                itemCount: 40,
                controller: this.controller,
                itemBuilder: (BuildContext context, int index) {
                    return new Container(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text('今天吃什么？ $index'),
                    );
                },
              ),
          );
      })
    );
  }

 
}